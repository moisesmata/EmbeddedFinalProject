/* * Device driver for the NBody Hardware Accelerator
 */

#include <linux/module.h>
#include <linux/init.h>
#include <linux/errno.h>
#include <linux/kernel.h>
#include <linux/platform_device.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>
#include <linux/types.h>
#include <linux/uaccess.h>
#include <linux/io.h>
#include "nbody_driver.h"

#define DRIVER_NAME "nbody"

/* Device registers */
#define IN_PORT(x) (x)

#define X_ADDR(base, body) (base) + ((body<<3) + 3 << 12)
#define Y_ADDR(base, body) (base) + ((body<<3) + 4 << 12)
#define M_ADDR(base, body) (base) + ((body<<3) + 5 << 12)
#define VX_ADDR(base, body) (base) + ((body<<3) + 6 << 12)
#define VY_ADDR(base, body) (base) + ((body<<3) + 7 << 12)

#define N_ADDR(base) (base) + ( 2 << 12)
#define GAP_ADDR(base) (base) + ( 16 << 12)
#define GO_ADDR(base) (base) + ( 64 << 12)
#define DONE_ADDR(base) (base) + ( 65 << 12)
#define READX_ADDR(base) (base) + ( 65 << 12)
#define READY_ADDR(base) (base) + ( 66 << 12)


/* Information about our device */
struct nbody_dev {
    struct resource res;
    void __iomem *virtbase;
    n_body_parameters_t parameters;
	n_body_sim_config_t sim_config;
	int go;
	int done;
	int read;
} dev;

static void write_parameters(n_body_parameters_t *parameters){
	for (int i = 0; i < ioread64(N_ADDR(dev.virtbase)); i++){
		iowrite64(parameters->bodies[i].x , X_ADDR(dev.virtbase, i)); //Writing to memory
		iowrite64(parameters->bodies[i].y , Y_ADDR(dev.virtbase, i));
		iowrite64(parameters->bodies[i].m , M_ADDR(dev.virtbase, i));
		iowrite64(parameters->bodies[i].vx, VX_ADDR(dev.virtbase, i));
		iowrite64(parameters->bodies[i].vy, VY_ADDR(dev.virtbase, i));
	}
	dev.parameters = *parameters;
	
}

/* Start the N-body simulation in hardware */
static void write_simulation_parameters(n_body_sim_config_t *parameters){
	iowrite64(parameters->N, N_ADDR(dev.virtbase));
	iowrite64(parameters->gap, GAP_ADDR(dev.virtbase));
	dev.sim_config = *parameters;
}


static void read_positions(all_positions_t *positions){
	for (int i = 0; i < ioread64(N_ADDR(dev.virtbase)) ; i++){
		positions->bodies[i].x = ioread64(X_ADDR(dev.virtbase, i));
		positions->bodies[i].y = ioread64(Y_ADDR(dev.virtbase, i));
	}
}

static void write_go(int go){
	iowrite64(go,GO_ADDR(dev.virtbase));
	dev.go = go;
}

static void write_read(int read){
	iowrite64(read, READX_ADDR(dev.virtbase));
	dev.read = read;
}

static void read_done(int *status){
	*status = ioread64(DONE_ADDR(dev.virtbase));
}

/* Handle ioctl calls from userspace */
static long nbody_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
{
    n_body_parameters_t nbody_parameters;
	n_body_sim_config_t sim_config;
	all_positions_t all_positions;
	int go;
	int status = 0;

    switch (cmd) {
    case NBODY_SET_BODY_PARAMETERS:
	//shouldn't be needed?
	//nbody_parameters = dev.parameters;
        if (copy_from_user(&nbody_parameters, (n_body_parameters_t *)arg, sizeof(n_body_parameters_t)))
            return -EFAULT;
        write_parameters(&nbody_parameters);
        break;

	case NBODY_SET_SIM_PARAMETERS:
	//sim_config = dev.sim_config;
		if (copy_from_user(&sim_config, (n_body_sim_config_t *)arg, sizeof(n_body_sim_config_t)))
			return -EFAULT;
		write_simulation_parameters(&sim_config);
		break;

    case WRITE_GO:
	//go = dev.go;
        if (copy_from_user(&go, (int *)arg, sizeof(int)))
            return -EFAULT;
        write_go(go);
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

	case NBODY_READ_POSITIONS:
		read_positions(&all_positions);
		if (copy_to_user((all_positions_t *)arg, &all_positions, sizeof(all_positions_t)))
			return -EFAULT;
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
	memset(&dev.parameters, 0, sizeof(dev.parameters));
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
