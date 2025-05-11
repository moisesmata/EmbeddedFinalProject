#ifndef _VGA_BALL_H
#define _VGA_BALL_H

#include <linux/ioctl.h>

#define DISPLAY_WIDTH 1280
#define DISPLAY_HEIGHT 480 
#define MAX_BODIES 512

/**
 * Structure representing a circle in the framebuffer
 * x, y: Center coordinates of the circle
 * x:0-1279 Width
 * y:0-479 Height
 * radius: Radius of the circle in pixels
 * n: which body it is
 */
typedef struct {
  unsigned short x, y, radius, n;
} vga_ball_props_t;
  
typedef struct {
  vga_ball_props_t bodies[MAX_BODIES];
  int num_bodies;
} vga_ball_arg_t;

#define VGA_BALL_MAGIC 'q'

#define VGA_BALL_WRITE_PROPERTIES _IOW(VGA_BALL_MAGIC, 1, vga_ball_arg_t)
#define VGA_BALL_CLEAR_SCREEN     _IO(VGA_BALL_MAGIC, 2)
#define VGA_BALL_FILL_SCREEN      _IO(VGA_BALL_MAGIC, 3)  // New command to fill the screen

#endif /* _VGA_BALL_H */
