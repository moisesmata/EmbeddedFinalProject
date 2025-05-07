#ifndef _VGA_BALL_H
#define _VGA_BALL_H

#include <linux/ioctl.h>

// New struct definitions:
typedef struct {
  float x, y, vx, vy, m;
  int n;
} n_body_initial_parameters_t;
  
typedef struct {
  n_body_initial_parameters_t parameters;
} n_body_arg_t;

// Old struct definitions:
typedef struct {
  unsigned char red, green, blue;
} vga_ball_color_t;
  
typedef struct {
  vga_ball_color_t background;
} vga_ball_arg_t;

#define VGA_BALL_MAGIC 'q'

/* ioctls and their arguments */
#define VGA_BALL_WRITE_BACKGROUND _IOW(VGA_BALL_MAGIC, 1, vga_ball_arg_t)
#define VGA_BALL_READ_BACKGROUND  _IOR(VGA_BALL_MAGIC, 2, vga_ball_arg_t)

#define SET_BODY_PARAMETERS _IOW(VGA_BALL_MAGIC, 3, n_body_arg_t)

#endif

