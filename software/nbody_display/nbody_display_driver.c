/*
    * nbody_display_driver.c
    *
    * This file implements a Linux kernel driver for the N-body simulation display.
    * It provides an interface for user-space applications to interact with the
    * hardware and control the display.
    *
*/
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
#include "nbody_display_driver.h"

#define DRIVER_NAME "nbody_display"

/* Device registers */

#define GO_ADDR(base) (base) + (0x40 << 11)
#define READ_ADDR(base) (base) + (0x41 << 11)
#define N_ADDR(base) (base) + (0x42 << 11)
#define GAP_ADDR(base) (base) + (0x43 << 11)

/* Memory */

#define X_ADDR_LOW(base, body) (base) + ((body<<2) + (0x44 << 11))
#define X_ADDR_HIGH(base, body) (base) + ((body<<2) + (0x45 << 11))

#define Y_ADDR_LOW(base, body) (base) + ((body<<2) + (0x46 << 11))
#define Y_ADDR_HIGH(base, body) (base) + ((body<<2) + (0x47 << 11))

#define M_ADDR_LOW(base, body) (base) + ((body<<2) + (0x48 << 11))
#define M_ADDR_HIGH(base, body) (base) + ((body<<2) + (0x49 << 11))

#define VX_ADDR_LOW(base, body) (base) + ((body<<2) + (0x4a << 11))
#define VX_ADDR_HIGH(base, body) (base) + ((body<<2) + (0x4b << 11))

#define VY_ADDR_LOW(base, body) (base) + ((body<<2) + (0x4c << 11))
#define VY_ADDR_HIGH(base, body) (base) + ((body<<2) + (0x4d << 11))

#define DONE_ADDR(base) (base) + (0x50 << 11)

#define READX_ADDR_LOW(base, body) (base) + ((0x51 << 11) + ((body)<<2))
#define READX_ADDR_HIGH(base, body) (base) + ((0x52 << 11) + ((body)<<2))

#define READY_ADDR_LOW(base, body) (base) + ((0x53 << 11) + ((body)<<2))
#define READY_ADDR_HIGH(base, body) (base) + ((0x54 << 11) + ((body)<<2))



/* Combined device information */
struct nbody_display_dev {
    // Hardware resources
    struct resource res;
    void __iomem *virtbase;
    
    // NBody simulation data
    body_t body_parameters;
    nbody_sim_config_t sim_config;
    int go;
    int done;
    int read;
    
    // Display data
    unsigned int framebuffer[FRAMEBUFFER_SIZE];
    vga_ball_arg_t vga_ball_arg;
} dev;

/* ========== NBody Simulation Functions ========== */

static void write_body(body_t * body_parameters) {
    int i = (int) body_parameters->n;
    int x_bits[2];
    int y_bits[2];
    int m_bits[2];
    int vx_bits[2];
    int vy_bits[2];
    
    memcpy(&x_bits, &body_parameters->x, sizeof(uint64_t));
    memcpy(&y_bits, &body_parameters->y, sizeof(uint64_t));
    memcpy(&m_bits, &body_parameters->m, sizeof(uint64_t));
    memcpy(&vx_bits, &body_parameters->vx, sizeof(uint64_t));
    memcpy(&vy_bits, &body_parameters->vy, sizeof(uint64_t));
    
    // Perform actual writes
    iowrite32(x_bits[0], X_ADDR_LOW(dev.virtbase, i)); 
    iowrite32(x_bits[1], X_ADDR_HIGH(dev.virtbase, i));
    
    iowrite32(y_bits[0], Y_ADDR_LOW(dev.virtbase, i));
    iowrite32(y_bits[1], Y_ADDR_HIGH(dev.virtbase, i));
    
    iowrite32(m_bits[0], M_ADDR_LOW(dev.virtbase, i));
    iowrite32(m_bits[1], M_ADDR_HIGH(dev.virtbase, i));
    
    iowrite32(vx_bits[0], VX_ADDR_LOW(dev.virtbase, i));
    iowrite32(vx_bits[1], VX_ADDR_HIGH(dev.virtbase, i));
    
    iowrite32(vy_bits[0], VY_ADDR_LOW(dev.virtbase, i));
    iowrite32(vy_bits[1], VY_ADDR_HIGH(dev.virtbase, i));
}

static void write_simulation_parameters(nbody_sim_config_t *parameters) {
    iowrite32(parameters->N, N_ADDR(dev.virtbase));
    iowrite32(parameters->gap, GAP_ADDR(dev.virtbase));
    dev.sim_config = *parameters;
}

static void read_position(body_pos_t *body) {
    int i = body->n; 
    int x_bits[2];
    int y_bits[2];
    
    x_bits[0] = ioread32(READX_ADDR_LOW(dev.virtbase, i));
    x_bits[1] = ioread32(READX_ADDR_HIGH(dev.virtbase, i));
    
    y_bits[0] = ioread32(READY_ADDR_LOW(dev.virtbase, i));
    y_bits[1] = ioread32(READY_ADDR_HIGH(dev.virtbase, i));
    
    memcpy(&body->x, &x_bits, sizeof(uint64_t));
    memcpy(&body->y, &y_bits, sizeof(uint64_t));
}

static void write_go(int go) {
    iowrite32(go, GO_ADDR(dev.virtbase));
    dev.go = go;
}

static void write_read(int read) {
    iowrite32(read, READ_ADDR(dev.virtbase));
    dev.read = read;
}

static void read_done(int *status) {
    *status = ioread32(DONE_ADDR(dev.virtbase));
}

/* ========== Display/VGA Functions ========== */

static inline void set_pixel(unsigned short x, unsigned short y, int value) {
    if (x >= DISPLAY_WIDTH || y >= DISPLAY_HEIGHT || x < 0 || y < 0) {
        return;
    }

    int index = (y*WORDS_PER_ROW) + x/32;
    if (value) {
        dev.framebuffer[index] |= 1 << (x % 32);
    } else {
        dev.framebuffer[index] &= ~(1 << (x % 32));
    }  
}

static void clear_framebuffer(void) {
    int i;
    for (i = 0; i < FRAMEBUFFER_SIZE; i++) {
        dev.framebuffer[i] = 0;  
        iowrite32(0, dev.virtbase + (i << 2));
    }
}

static void clear_framebuffer_virtual(void) {
    int i;
    for (i = 0; i < FRAMEBUFFER_SIZE; i++) {
        dev.framebuffer[i] = 0;
    }
}

static void fill_framebuffer(void) {
    int i;
    printk(KERN_INFO "nbody_display: Filling entire framebuffer (all pixels on)\n");
    
    for (i = 0; i < FRAMEBUFFER_SIZE; i++) {
        dev.framebuffer[i] = 0xFFFFFFFF;  // All bits set to 1
        iowrite32(dev.framebuffer[i], dev.virtbase + (i << 2));
    }
    
    printk(KERN_INFO "nbody_display: Framebuffer filled with all pixels on\n");
}

static void draw_circle(unsigned short x0, unsigned short y0, unsigned short radius) {
    if (radius < 2) radius = 2;  // Minimum radius
    if (radius > 25) radius = 25; // Maximum radius
    
    int radius_squared = radius * radius;
    int x_min = x0 - radius;
    int y_min = y0 - radius;
    int x_max = x0 + radius;
    int y_max = y0 + radius;

    int x, y; 
    for (y = y_min; y <= y_max; y++) {
        for (x = x_min; x <= x_max; x++) {
            int dx = x - x0;
            int dy = y - y0;
            int d2 = dx*dx + dy*dy;
            if (d2 <= radius_squared) {
                set_pixel(x, y, 1);
            }
        }
    }
}

static void draw_bodies(void) {
    int i;
    printk(KERN_INFO "nbody_display: Drawing the Bodies\n");
    
    // Clear virtual framebuffer
    clear_framebuffer_virtual();

    // Draw all bodies with their respective radii
    for (i = 0; i < dev.vga_ball_arg.num_bodies; i++) {
        draw_circle(
            dev.vga_ball_arg.bodies[i].x, 
            dev.vga_ball_arg.bodies[i].y,
            dev.vga_ball_arg.bodies[i].radius
        );
    }

    // Write the completed framebuffer to hardware
    for (i = 0; i < FRAMEBUFFER_SIZE; i++) {
        iowrite32(dev.framebuffer[i], dev.virtbase + (i << 2));
    }
    
    printk(KERN_INFO "nbody_display: Bodies Drawn\n");
}

static void draw_checkerboard(void) {
    int i, j;
    for (i = 0; i < DISPLAY_HEIGHT; i++) {
        for (j = 0; j < DISPLAY_WIDTH; j++) {
            if ((i / 20) % 2 == (j / 20) % 2) {
                set_pixel(j, i, 1);
            } else {
                set_pixel(j, i, 0);
            }
        }
    }
}

/* ========== Main Driver Functions ========== */

static long nbody_display_ioctl(struct file *f, unsigned int cmd, unsigned long arg) {
    nbody_sim_config_t sim_config;
    body_pos_t body_position;
    body_t body_parameters;
    vga_ball_arg_t vla;
    int go = 0;
    int status = 0;
    int i;

    printk(KERN_INFO "nbody_display: ioctl command %u received\n", cmd);

    switch (cmd) {
        /* NBody simulation commands */
        case WRITE_GO:
            if (copy_from_user(&go, (int *)arg, sizeof(int)))
                return -EFAULT;
            write_go(go);
            break;

        case NBODY_SET_SIM_PARAMETERS:
            if (copy_from_user(&sim_config, (nbody_sim_config_t *)arg, sizeof(nbody_sim_config_t)))
                return -EFAULT;
            write_simulation_parameters(&sim_config);
            break;

        case WRITE_READ:
            if (copy_from_user(&go, (int *)arg, sizeof(int)))
                return -EFAULT;
            write_read(go);
            break;

        case READ_DONE:
            read_done(&status);
            if (copy_to_user((int *)arg, &status, sizeof(int)))
                return -EFAULT;
            break;

        case READ_POSITIONS:
            if (copy_from_user(&body_position, (body_pos_t *)arg, sizeof(body_pos_t)))
                return -EFAULT;
            read_position(&body_position);
            if (copy_to_user((body_pos_t *)arg, &body_position, sizeof(body_pos_t)))
                return -EFAULT;
            break;

        case SET_BODY:
            if (copy_from_user(&body_parameters, (body_t *)arg, sizeof(body_t)))
                return -EFAULT;
            write_body(&body_parameters);
            break;

        /* Display commands */
        case VGA_BALL_WRITE_PROPERTIES:
            if (copy_from_user(&vla, (vga_ball_arg_t *)arg, sizeof(vga_ball_arg_t))) {
                return -EACCES;
            }
            
            // Copy new body data
            memcpy(&dev.vga_ball_arg, &vla, sizeof(vga_ball_arg_t));
            
            // Draw the bodies to the display
            draw_bodies();
            break;

        case VGA_BALL_CLEAR_SCREEN:
            printk(KERN_INFO "nbody_display: Clearing screen\n");
            clear_framebuffer();
            dev.vga_ball_arg.num_bodies = 0;
            break;
            
        case VGA_BALL_FILL_SCREEN:
            printk(KERN_INFO "nbody_display: Filling screen\n");
            draw_checkerboard();
            //draw_bodies();
            break;

        default:
            printk(KERN_WARNING "nbody_display: Unknown ioctl command: %u\n", cmd);
            return -EINVAL;
    }

    return 0;
}


/* The file operations structure */
static const struct file_operations nbody_display_fops = {
    .owner          = THIS_MODULE,
    .unlocked_ioctl = nbody_display_ioctl,
};

/* Information for the "misc" framework */
static struct miscdevice nbody_display_misc_device = {
    .minor = MISC_DYNAMIC_MINOR,
    .name  = DRIVER_NAME,
    .fops  = &nbody_display_fops,
};


/*
 * Initialization code: get resources (registers) and display
 * a welcome message
 */
static int __init nbody_display_probe(struct platform_device *pdev)
{
	int ret;

	/* Register ourselves as a misc device: creates /dev/vga_ball */
	ret = misc_register(&nbody_display_misc_device);

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

	//LOOK INTO THIS
	dev.go = 0;
	dev.done = 0;
	dev.read = 0;
	dev.sim_config.N = 0;
	dev.sim_config.gap = 0;
	dev.body_parameters.n = 0;
	dev.body_parameters.x = 0;
	dev.body_parameters.y = 0;
	dev.body_parameters.m = 0;
	dev.body_parameters.vx = 0;
	dev.body_parameters.vy = 0;
    /* Initialize the device with empty screen */
    clear_framebuffer();
    dev.vga_ball_arg.num_bodies = 0;  // Changed from dev.vga_display_arg

	return 0;

out_release_mem_region:
	release_mem_region(dev.res.start, resource_size(&dev.res));
out_deregister:
	misc_deregister(&nbody_display_misc_device);
	return ret;
}

/* Clean-up code: release resources */
static int nbody_display_remove(struct platform_device *pdev)
{
	iounmap(dev.virtbase);
	release_mem_region(dev.res.start, resource_size(&dev.res));
	misc_deregister(&nbody_display_misc_device);
	return 0;
}

/* Which "compatible" string(s) to search for in the Device Tree */
#ifdef CONFIG_OF
static const struct of_device_id nbody_display_of_match[] = {
	{ .compatible = "csee4840,nbody-1.0" },
	{ .compatible = "unknown,unknown-1.0" },
	{ .compatible = "Kris,nbody_main-1.0" },
	{},
};
MODULE_DEVICE_TABLE(of, nbody_display_of_match);
#endif

/* Information for registering ourselves as a "platform" driver */
static struct platform_driver nbody_display_driver = {
	.driver	= {
		.name	= DRIVER_NAME,
		.owner	= THIS_MODULE,
		.of_match_table = of_match_ptr(nbody_display_of_match),
	},
	.remove	= __exit_p(nbody_display_remove),
};

/* Called when the module is loaded: set things up */
static int __init nbody_display_init(void)
{
	pr_info(DRIVER_NAME ": init\n");
	return platform_driver_probe(&nbody_display_driver, nbody_display_probe);
}

/* Calball when the module is unloaded: release resources */
static void __exit nbody_display_exit(void)
{
	platform_driver_unregister(&nbody_display_driver);
	pr_info(DRIVER_NAME ": exit\n");
}

module_init(nbody_display_init);
module_exit(nbody_display_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Robbie, Moises, Isaac, Adib, Kris");
MODULE_DESCRIPTION("nbody_display driver");