/* * Device driver for the NBody Hardware Accelerator
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
#include "nbody_driver.h"


#define DRIVER_NAME "nbody"

/* Device registers */

#define GO_ADDR(base) (base)
#define READ_ADDR(base) (base) + (1 << 11)
#define N_ADDR(base) (base) + ( 2 << 11)
#define GAP_ADDR(base) (base) + ( 3 << 11)

/* Memory */

#define X_ADDR_LOW(base, body) (base) + ((body<<2) + (4 << 11))
#define X_ADDR_HIGH(base, body) (base) + ((body<<2) + (5 << 11))

#define Y_ADDR_LOW(base, body) (base) + ((body<<2) + (6 << 11))
#define Y_ADDR_HIGH(base, body) (base) + ((body<<2) + (7 << 11))

#define M_ADDR_LOW(base, body) (base) + ((body<<2) + (8 << 11))
#define M_ADDR_HIGH(base, body) (base) + ((body<<2) + (9 << 11))

#define VX_ADDR_LOW(base, body) (base) + ((body<<2) + (10 << 11))
#define VX_ADDR_HIGH(base, body) (base) + ((body<<2) + (11 << 11))

#define VY_ADDR_LOW(base, body) (base) + ((body<<2) + (12 << 11))
#define VY_ADDR_HIGH(base, body) (base) + ((body<<2) + (13 << 11))

/* More Memory */

#define DONE_ADDR(base) (base) + ( 64 << 11)

#define READX_ADDR_LOW(base) (base) + ( 65 << 11)
#define READX_ADDR_HIGH(base) (base) + ( 66 << 11)

#define READY_ADDR_LOW(base) (base) + ( 67 << 11)
#define READY_ADDR_HIGH(base) (base) + ( 68 << 11)


/* Macros to get the upper and lower 32 bits of a 64-bit number */

/* Information about our device */
struct nbody_dev {
    struct resource res;
    void __iomem *virtbase;
    //nbody_parameters_t parameters;
	body_t body_parameters;
	nbody_sim_config_t sim_config;
	int go;
	int done;
	int read;
} dev;


static void write_body(body_t * body_parameters){
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

/* Start the N-body simulation in hardware */
static void write_simulation_parameters(nbody_sim_config_t *parameters){
	iowrite32(parameters->N, N_ADDR(dev.virtbase));
	iowrite32(parameters->gap, GAP_ADDR(dev.virtbase));
	dev.sim_config = *parameters;
}

static void read_position(body_pos_t *body){
    
	int i = body->n; 
    
	uint64_t x_bits = ((uint64_t)ioread32(X_ADDR_LOW(dev.virtbase, i))) |
						(((uint64_t)ioread32(X_ADDR_HIGH(dev.virtbase, i))) << 32);
	uint64_t y_bits = ((uint64_t)ioread32(Y_ADDR_LOW(dev.virtbase, i))) |
						(((uint64_t)ioread32(Y_ADDR_HIGH(dev.virtbase, i))) << 32);

	memcpy(&body->x, &x_bits, sizeof(uint64_t));
	memcpy(&body->y, &y_bits, sizeof(uint64_t));	
}

static void write_go(int go){
	iowrite32(go, GO_ADDR(dev.virtbase));
	dev.go = go;
}

static void write_read(int read){
	iowrite32(read, READ_ADDR(dev.virtbase));
	dev.read = read;
}

static void read_done(int *status){
	*status = ioread32(DONE_ADDR(dev.virtbase));
}

/* Handle ioctl calls from userspace */
static long nbody_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
{
    //nbody_parameters_t nbody_parameters;
	nbody_sim_config_t sim_config;
	body_pos_t body_position;
	body_t body_parameters;
	int go = 0;
	int status = 0;

    switch (cmd) {
	
		case WRITE_GO:
		//go = dev.go;
			if (copy_from_user(&go, (int *)arg, sizeof(int)))
				return -EFAULT;
			
			write_go(go);
			break;

		case NBODY_SET_SIM_PARAMETERS:
		//sim_config = dev.sim_config;
			if (copy_from_user(&sim_config, (nbody_sim_config_t *)arg, sizeof(nbody_sim_config_t)))
				return -EFAULT;
			write_simulation_parameters(&sim_config);
			break;

		case WRITE_READ:
		//read = dev.read;
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
			read_position(&body_position);
			if (copy_to_user((body_pos_t *)arg, &body_position, sizeof(body_pos_t)))
				return -EFAULT;
			break;

		case SET_BODY:
			if (copy_from_user(&body_parameters, (body_t *)arg, sizeof(body_t)))
				return -EFAULT;
			write_body(&body_parameters);
			break;

		default:
			return -EINVAL;
    }

    return 0;
}

/* The file operations structure */
static const struct file_operations nbody_fops = {
    .owner          = THIS_MODULE,
    .unlocked_ioctl = nbody_ioctl,
};

/* Information for the "misc" framework */
static struct miscdevice nbody_misc_device = {
    .minor = MISC_DYNAMIC_MINOR,
    .name  = DRIVER_NAME,
    .fops  = &nbody_fops,
};


/*
 * Initialization code: get resources (registers) and display
 * a welcome message
 */
static int __init nbody_probe(struct platform_device *pdev)
{
	int ret;

	/* Register ourselves as a misc device: creates /dev/vga_ball */
	ret = misc_register(&nbody_misc_device);

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
	return 0;

out_release_mem_region:
	release_mem_region(dev.res.start, resource_size(&dev.res));
out_deregister:
	misc_deregister(&nbody_misc_device);
	return ret;
}

/* Clean-up code: release resources */
static int nbody_remove(struct platform_device *pdev)
{
	iounmap(dev.virtbase);
	release_mem_region(dev.res.start, resource_size(&dev.res));
	misc_deregister(&nbody_misc_device);
	return 0;
}

/* Which "compatible" string(s) to search for in the Device Tree */
#ifdef CONFIG_OF
static const struct of_device_id nbody_of_match[] = {
	{ .compatible = "csee4840,nbody-1.0" },
	{},
};
MODULE_DEVICE_TABLE(of, nbody_of_match);
#endif

/* Information for registering ourselves as a "platform" driver */
static struct platform_driver nbody_driver = {
	.driver	= {
		.name	= DRIVER_NAME,
		.owner	= THIS_MODULE,
		.of_match_table = of_match_ptr(nbody_of_match),
	},
	.remove	= __exit_p(nbody_remove),
};

/* Called when the module is loaded: set things up */
static int __init nbody_init(void)
{
	pr_info(DRIVER_NAME ": init\n");
	return platform_driver_probe(&nbody_driver, nbody_probe);
}

/* Calball when the module is unloaded: release resources */
static void __exit nbody_exit(void)
{
	platform_driver_unregister(&nbody_driver);
	pr_info(DRIVER_NAME ": exit\n");
}

module_init(nbody_init);
module_exit(nbody_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Robbie, Moises, Isaac, Adib, Kris");
MODULE_DESCRIPTION("Nbody driver");
