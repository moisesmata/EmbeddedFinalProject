#ifndef _NBODY_H
#define _NBODY_H

#include <linux/ioctl.h>

// New struct definitions:

// --------------------------------------
// Struct to define body parameters
// --------------------------------------
#define MAX_BODIES 512 //Max number of bodies

typedef struct {
  double x, y, vx, vy, m;
  int n;
} body_t;

typedef struct{
  body_t bodies[MAX_BODIES]; 
} nbody_parameters_t;

typedef struct{
  int go;
} go_signal;


// --------------------------------------
// Structs that will be passed back to userspace (only positions are returned from simulation)
// --------------------------------------

typedef struct{
  double x, y;
  int n;
} body_pos_t;

typedef struct{
  body_pos_t bodies[MAX_BODIES];
} all_positions_t;

  
// --------------------------------------
// Struct to define simulation parameters
// --------------------------------------
typedef struct {
  //other needed start params?
  int N;
  int gap;
} nbody_sim_config_t;


#define NBODY_MAGIC 'q'

/* ioctls and their arguments */
#define NBODY_SET_SIM_PARAMETERS        _IOW(NBODY_MAGIC, 1, nbody_sim_config_t)
#define WRITE_GO                        _IOW(NBODY_MAGIC, 2, int)
#define READ_DONE                       _IOR(NBODY_MAGIC, 3, int)
#define READ_POSITIONS                  _IOR(NBODY_MAGIC, 4, body_pos_t)
#define WRITE_READ                      _IOW(NBODY_MAGIC, 5, int)
#define SET_BODY                        _IOW(NBODY_MAGIC, 6, body_t)

//might need more ioctls?

#endif

