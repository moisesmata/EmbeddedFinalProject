#include <linux/module.h>
#include <linux/init.h>
#include <linux/errno.h>
#include <linux/version.h>
#include <linux/kernel.h>
#include <linux/platform_device.h>
#include <linux/miscdevice.h>
#include <linux/slab.h>
#include <linux/io.h>
#include <linux/of.h>
#include <linux/of_address.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include "display_driver.h"

#define DRIVER_NAME "vga_display"

//how many words in the framebuffer
#define FRAMEBUFFER_SIZE 0x8000  

#define BYTE_PER_ROW (DISPLAY_WIDTH / 8)
#define X_Y_TO_ADDR(base, x, y) ( base + ((y * BYTE_PER_ROW + (x / 8)) * 4))

struct vga_display_dev {
    struct resource res;     
    void __iomem *virtbase;     
    vga_display_arg_t vga_display_arg; 
} dev;

/*
 * Set a pixel in the framebuffer
 * x, y: coordinates (0-1279, 0-479)
 */
static inline void set_pixel(unsigned short x, unsigned short y, int value)
{
    if (x >= DISPLAY_WIDTH || y >= DISPLAY_HEIGHT)
        return;  
        
	//Find the byte the pixel is in, and the bit in that byte
    void *addr = X_Y_TO_ADDR(dev.virtbase, x, y);
    unsigned int bit = x % 8; 
    u32 bit_mask = 1U << bit;
    u32 cur = ioread32(addr);

    if (value) {
        // Set the bit to 1 (turn pixel on)
        iowrite32((u32)cur | bit_mask, addr);
    } else {
        // Clear the bit to 0 (turn pixel off)
        iowrite32((u32)cur & ~bit_mask, addr);
    }
}

/*
 * Clear the entire framebuffer
 */
static void clear_framebuffer(void)
{
    int i;
    for (i = 0; i < FRAMEBUFFER_SIZE; i++) {
        iowrite32(0, dev.virtbase + (i * 4));
    }
}

/*
 * Draw a filled circle with correction for y aspect ratio
 * x0, y0: Center coordinates of the circle
 * radius: Radius of the circle in pixels
 * This uses the circle drawing method from our lab 3.
 */
static void draw_circle(unsigned short x0, unsigned short y0, unsigned short radius)
{
    int radius_squared = radius * radius;
    
    int x_min = (x0 > radius) ? (x0 - radius) : 0;
    int y_min = (y0 > radius) ? (y0 - radius/2) : 0;  // Divide by 2 for y aspect ratio
    int x_max = (x0 + radius < DISPLAY_WIDTH) ? (x0 + radius) : (DISPLAY_WIDTH - 1);
    int y_max = (y0 + radius/2 < DISPLAY_HEIGHT) ? (y0 + radius/2) : (DISPLAY_HEIGHT - 1);
    
    int x, y;
    for (y = y_min; y <= y_max; y++) {
        for (x = x_min; x <= x_max; x++) {

            int dx = x - x0;
            int dy = y - y0;
            int distance_squared = dx*dx + 4*dy*dy;
            
            // If distance is less than or equal to radius, this pixel is in the circle
            if (distance_squared <= radius_squared) {
                set_pixel(x, y, 1);
            }
        }
    }
}

/*
 * Draw all bodies in the simulation
 */
static void draw_all_bodies(vga_display_arg_t *arg)
{
    clear_framebuffer();  // Clear screen before drawing new state
    
    unsigned int i;
    unsigned int num_bodies = arg->num_bodies > MAX_BODIES ? MAX_BODIES : arg->num_bodies;
    
    for (i = 0; i < num_bodies; i++) {
        vga_ball_props_t *body = &arg->bodies[i];
        draw_circle(body->x, body->y, body->radius);
    }
    
    // Save current state
    dev.vga_display_arg = *arg;
}

/*
 * Handle ioctl() calls from userspace
 */
static long vga_display_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
{
    vga_display_arg_t vla;

    switch (cmd) {
    case VGA_DISPLAY_WRITE_PROPERTIES:
        if (copy_from_user(&vla, (vga_display_arg_t *) arg, sizeof(vga_display_arg_t)))
            return -EACCES;
        draw_all_bodies(&vla);
        break;

    case VGA_DISPLAY_CLEAR_SCREEN:
        clear_framebuffer();
        dev.vga_display_arg.num_bodies = 0;  // No bodies displayed
        break;

    default:
        return -EINVAL;
    }

    return 0;
}

/* The operations our device knows how to do */
static const struct file_operations vga_display_fops = {
    .owner          = THIS_MODULE,
    .unlocked_ioctl = vga_display_ioctl,
};

/* Information about our device for the "misc" framework -- like a char dev */
static struct miscdevice vga_display_misc_device = {
    .minor       = MISC_DYNAMIC_MINOR,
    .name        = DRIVER_NAME,
    .fops        = &vga_display_fops,
};

/*
 * Initialization code: get resources (registers) and display
 * a welcome message
 */
static int __init vga_display_probe(struct platform_device *pdev)
{
    int ret;

    /* Register ourselves as a misc device: creates /dev/vga_display */
    ret = misc_register(&vga_display_misc_device);
    if (ret) {
        pr_err("%s: failed to register misc device\n", DRIVER_NAME);
        return ret;
    }

    /* Get the address of our registers from the device tree */
    ret = of_address_to_resource(pdev->dev.of_node, 0, &dev.res);
    if (ret) {
        ret = -ENOENT;
        goto out_deregister;
    }

    /* Make sure we can use these registers */
    if (request_mem_region(dev.res.start, resource_size(&dev.res),
                   DRIVER_NAME) == NULL) {
        ret = -EBUSY;
        goto out_deregister;
    }

    /* Arrange access to our registers */
    dev.virtbase = of_iomap(pdev->dev.of_node, 0);
    if (dev.virtbase == NULL) {
        ret = -ENOMEM;
        goto out_release_mem_region;
    }
        
    /* Initialize the device with empty screen */
    clear_framebuffer();
    dev.vga_display_arg.num_bodies = 0;
    
    pr_info("%s: initialized\n", DRIVER_NAME);
    return 0;

out_release_mem_region:
    release_mem_region(dev.res.start, resource_size(&dev.res));
out_deregister:
    misc_deregister(&vga_display_misc_device);
    return ret;
}

/* Clean-up code: release resources */
static int vga_display_remove(struct platform_device *pdev)
{
    iounmap(dev.virtbase);
    release_mem_region(dev.res.start, resource_size(&dev.res));
    misc_deregister(&vga_display_misc_device);
    return 0;
}

/* Which "compatible" string(s) to search for in the Device Tree */
#ifdef CONFIG_OF
static const struct of_device_id vga_display_of_match[] = {
    { .compatible = "csee4840,vga_display-1.0" },
    {},
};
MODULE_DEVICE_TABLE(of, vga_display_of_match);
#endif

/* Information for registering ourselves as a "platform" driver */
static struct platform_driver vga_display_driver = {
    .driver = {
        .name   = DRIVER_NAME,
        .owner  = THIS_MODULE,
        .of_match_table = of_match_ptr(vga_display_of_match),
    },
    .remove = __exit_p(vga_display_remove),
    .probe  = vga_display_probe,
};

/* Called when the module is loaded: set things up */
static int __init vga_display_init(void)
{
    pr_info("%s: init\n", DRIVER_NAME);
    return platform_driver_register(&vga_display_driver);
}

/* Called when the module is unloaded: release resources */
static void __exit vga_display_exit(void)
{
    platform_driver_unregister(&vga_display_driver);
    pr_info("%s: exit\n", DRIVER_NAME);
}

module_init(vga_display_init);
module_exit(vga_display_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Based on work by Stephen A. Edwards, Columbia University");
MODULE_DESCRIPTION("VGA framebuffer driver for N-body simulation");
