#ifndef _VGA_DISPLAY_H
#define _VGA_DISPLAY_H

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
} vga_display_arg_t;

#define VGA_DISPLAY_MAGIC 'q'

#define VGA_DISPLAY_WRITE_PROPERTIES _IOW(VGA_DISPLAY_MAGIC, 1, vga_display_arg_t)
#define VGA_DISPLAY_CLEAR_SCREEN     _IO(VGA_DISPLAY_MAGIC, 2)

#endif /* _VGA_DISPLAY_H */
