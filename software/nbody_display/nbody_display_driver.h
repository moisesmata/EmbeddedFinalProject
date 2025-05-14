#ifndef _NBODY_DISPLAY_DRIVER_H
#define _NBODY_DISPLAY_DRIVER_H

#include <linux/ioctl.h>

// Display parameters
#define DISPLAY_WIDTH 640
#define DISPLAY_HEIGHT 480
#define MAX_BODIES 512

// Framebuffer calculations
#define FRAMEBUFFER_SIZE (DISPLAY_HEIGHT * DISPLAY_WIDTH/32)
#define WORDS_PER_ROW (DISPLAY_WIDTH / 32)
#define BYTE_PER_ROW (DISPLAY_WIDTH / 8)

// --------------------------------------
// NBody Simulation Structures
// --------------------------------------

// Body parameters structure
typedef struct {
  double x, y, vx, vy, m;
  int n;
} body_t;

// Body position structure (for reading back)
typedef struct {
  double x, y;
  int n;
} body_pos_t;

// All positions structure
typedef struct {
  body_pos_t bodies[MAX_BODIES];
} all_positions_t;

// Simulation configuration structure
typedef struct {
  int N;
  int gap;
} nbody_sim_config_t;

// --------------------------------------
// Display Structures
// --------------------------------------

// Structure for circle properties
typedef struct {
  unsigned short x, y, radius, n, m;
} vga_ball_props_t;

// Structure for all circles
typedef struct {
  vga_ball_props_t bodies[MAX_BODIES];
  int num_bodies;
} vga_ball_arg_t;

// --------------------------------------
// IOCTL Commands
// --------------------------------------
#define UNIFIED_MAGIC 'q'

// NBody simulation commands
#define NBODY_SET_SIM_PARAMETERS _IOW(UNIFIED_MAGIC, 1, nbody_sim_config_t)
#define WRITE_GO                 _IOW(UNIFIED_MAGIC, 2, int)
#define READ_DONE                _IOR(UNIFIED_MAGIC, 3, int)
#define READ_POSITIONS           _IOR(UNIFIED_MAGIC, 4, body_pos_t)
#define WRITE_READ               _IOW(UNIFIED_MAGIC, 5, int)
#define SET_BODY                 _IOW(UNIFIED_MAGIC, 6, body_t)

// Display commands (offset to avoid conflict)
#define VGA_BALL_WRITE_PROPERTIES _IOW(UNIFIED_MAGIC, 7, vga_ball_arg_t)
#define VGA_BALL_CLEAR_SCREEN     _IO(UNIFIED_MAGIC, 8)
#define VGA_BALL_FILL_SCREEN      _IO(UNIFIED_MAGIC, 9)

#endif /* _NBODY_DISPLAY_DRIVER_H */
