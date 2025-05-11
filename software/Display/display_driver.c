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

#define DRIVER_NAME "vga_ball"  

//how many words in the framebuffer
#define FRAMEBUFFER_SIZE (DISPLAY_HEIGHT * DISPLAY_WIDTH/32)
#define WORDS_PER_ROW (DISPLAY_WIDTH / 32)
#define BYTE_PER_ROW (DISPLAY_WIDTH / 8)
#define X_Y_TO_ADDR(base, x, y) ( base + ((y * WORDS_PER_ROW + (x / 32)) * 4))

struct vga_ball_dev {  // Changed from vga_display_dev
    struct resource res;     
    void __iomem *virtbase;     
    char framebuffer[FRAMEBUFFER_SIZE * 4]; //Words * bytes per word
    vga_ball_arg_t vga_ball_arg;  // Changed from vga_display_arg_t vga_display_arg
} dev;

/*
 * Set a pixel in the framebuffer
 * x, y: coordinates (0-639, 0-479)
 */
static inline void set_pixel(unsigned short x, unsigned short y, int value)
{
    if (x >= DISPLAY_WIDTH || y >= DISPLAY_HEIGHT || x < 0 || y < 0){
        return;
    }

    int index = (y*WORDS_PER_ROW)*32 + x;
    if (value) {
        dev.framebuffer[index] = 0xFFFFFFFF;
    } else{
        dev.framebuffer[index] = 0x00000000;
    }  
}

/*
 * Clear the entire framebuffer
 */
static void clear_framebuffer(void)
{
    int i;
    for (i = 0; i < FRAMEBUFFER_SIZE; i++) {
        dev.framebuffer[i*4] = 0;  
        iowrite32(0, dev.virtbase + (i * 4));
    }
}

/*
 * Fill the entire framebuffer (turn all pixels on)
 */
static void fill_framebuffer(void)
{
    int i;
    printk(KERN_INFO "vga_ball: Filling entire framebuffer (all pixels on)\n");
    
    for (i = 0; i < FRAMEBUFFER_SIZE; i++) {
        dev.framebuffer[i*4] = 0xFFFFFFFF;  
        iowrite32(dev.framebuffer[i], dev.virtbase + (i * 4));
    }
    
    printk(KERN_INFO "vga_ball: Framebuffer filled with all pixels on\n");
}

static void draw_bodies(void)
{
    clear_framebuffer();
    int i;
    printk(KERN_INFO "vga_ball: Drawing the Bodies\n");
    
    for (i = 0; i < FRAMEBUFFER_SIZE; i++) {
        iowrite32(dev.framebuffer[i], dev.virtbase + (i * 4));
    }
    
    printk(KERN_INFO "vga_ball: Bodies Drawn\n");
}

//Right now the default radius is 5
static void draw_circle(unsigned short x0, unsigned short y0){ 
    int radius = 5;
    if (x0 >= DISPLAY_WIDTH || y0 >= DISPLAY_HEIGHT || x0 < 0 || y0 < 0) {
        printk(KERN_WARNING "vga_ball: Circle center (%d,%d) is outside display bounds\n", 
               x0, y0);
        return;
    }
    int radius_squared = radius * radius;
    int x_min = x0 - radius;
    int y_min = y0 - radius;
    int x_max = x0 + radius;
    int y_max = y0 + radius;

    for (int y = y_min; y <= y_max; y++){
        for (int x = x_min; x <= x_max; x++){
            int dx = x - x0;
            int dy = y - y0;
            int d2 = dx*dx + dy*dy;
            if (d2 <= radius_squared){
                set_pixel(x,y,1)
            }
        }
    }

}

/*
 * Handle ioctl() calls from userspace
 */
static long vga_ball_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
{
    vga_ball_arg_t vla;

    printk(KERN_INFO "vga_ball: ioctl command %u received\n", cmd);

    switch (cmd) {
    case VGA_BALL_WRITE_PROPERTIES:
        if (copy_from_user(&vla, (vga_ball_arg_t *) arg, sizeof(vga_ball_arg_t))){
            return -EACCES;
        }
        for(int i = 0; i < vla.num_bodies; i++){
            dev.vga_ball_arg.bodies[i].x = vla.bodies[i].x;
            dev.vga_ball_arg.bodies[i].y = vla.bodies[i].y;
            dev.vga_ball_arg.bodies[i].radius = vla.bodies[i].radius;
            dev.vga_ball_arg.bodies[i].n = vla.bodies[i].n;
            draw_circle(dev.vga_ball_arg.bodies[i].x, dev.vga_ball_arg.bodies[i].y);
        }
        draw_bodies();
        break;

    case VGA_BALL_CLEAR_SCREEN:
        printk(KERN_INFO "vga_ball: Clearing screen\n");
        clear_framebuffer();
        dev.vga_ball_arg.num_bodies = 0;
        break;
        
    case VGA_BALL_FILL_SCREEN:
        printk(KERN_INFO "vga_ball: Filling screen (all pixels on)\n");
        fill_framebuffer();
        break;

    default:
        printk(KERN_WARNING "vga_ball: Unknown ioctl command: %u\n", cmd);
        return -EINVAL;
    }

    return 0;
}

/* The operations our device knows how to do */
static const struct file_operations vga_ball_fops = {  // Changed from vga_display_fops
    .owner          = THIS_MODULE,
    .unlocked_ioctl = vga_ball_ioctl,
};

/* Information about our device for the "misc" framework -- like a char dev */
static struct miscdevice vga_ball_misc_device = {  // Changed from vga_display_misc_device
    .minor       = MISC_DYNAMIC_MINOR,
    .name        = DRIVER_NAME,
    .fops        = &vga_ball_fops,  // Changed from &vga_display_fops
};

/*
 * Initialization code: get resources (registers) and display
 * a welcome message
 */
static int __init vga_ball_probe(struct platform_device *pdev)  // Changed from vga_display_probe
{
    int ret;

    /* Register ourselves as a misc device: creates /dev/vga_ball */  // Changed comment
    ret = misc_register(&vga_ball_misc_device);  // Changed from vga_display_misc_device
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
    dev.vga_ball_arg.num_bodies = 0;  // Changed from dev.vga_display_arg
    
    pr_info("%s: initialized\n", DRIVER_NAME);
    return 0;

out_release_mem_region:
    release_mem_region(dev.res.start, resource_size(&dev.res));
out_deregister:
    misc_deregister(&vga_ball_misc_device);
    return ret;
}

/* Clean-up code: release resources */
static int vga_ball_remove(struct platform_device *pdev)  // Changed from vga_display_remove
{
    iounmap(dev.virtbase);
    release_mem_region(dev.res.start, resource_size(&dev.res));
    misc_deregister(&vga_ball_misc_device);  // Changed from vga_display_misc_device
    return 0;
}

/* Which "compatible" string(s) to search for in the Device Tree */
#ifdef CONFIG_OF
static const struct of_device_id vga_ball_of_match[] = {  // Changed from vga_display_of_match
    { .compatible = "csee4840,vga_ball-1.0" },  // Changed from vga_display-1.0
    {},
};
MODULE_DEVICE_TABLE(of, vga_ball_of_match);  // Changed from vga_display_of_match
#endif

/* Information for registering ourselves as a "platform" driver */
static struct platform_driver vga_ball_driver = {  // Changed from vga_display_driver
    .driver = {
        .name   = DRIVER_NAME,
        .owner  = THIS_MODULE,
        .of_match_table = of_match_ptr(vga_ball_of_match),  // Changed from vga_display_of_match
    },
    .remove = __exit_p(vga_ball_remove),  // Changed from vga_display_remove
    .probe  = vga_ball_probe,  // Changed from vga_display_probe
};

/* Called when the module is loaded: set things up */
static int __init vga_ball_init(void)  // Changed from vga_display_init
{
    pr_info("%s: init\n", DRIVER_NAME);
    return platform_driver_register(&vga_ball_driver);  // Changed from vga_display_driver
}

/* Called when the module is unloaded: release resources */
static void __exit vga_ball_exit(void)  // Changed from vga_display_exit
{
    platform_driver_unregister(&vga_ball_driver);  // Changed from vga_display_driver
    pr_info("%s: exit\n", DRIVER_NAME);
}

module_init(vga_ball_init);  // Changed from vga_display_init
module_exit(vga_ball_exit);  // Changed from vga_display_exit

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Based on work by Stephen A. Edwards, Columbia University");
MODULE_DESCRIPTION("VGA ball driver for N-body simulation");  // Changed from framebuffer
