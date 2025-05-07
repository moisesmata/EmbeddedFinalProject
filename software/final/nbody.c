/*
 * Userspace program that communicates with the vga_ball device driver
 * through ioctls
 *
 * Stephen A. Edwards
 * Columbia University
 */

#include <stdio.h>
#include "vga_ball.h"
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

#define MAXCHAR 1000;

int vga_ball_fd; //old lab3 fd 
int nbody_fd;

//Old Lab3 Reference Code

/* Read and print the background color */
void print_background_color() {
  vga_ball_arg_t vla;
  
  if (ioctl(vga_ball_fd, VGA_BALL_READ_BACKGROUND, &vla)) {
      perror("ioctl(VGA_BALL_READ_BACKGROUND) failed");
      return;
  }
  printf("%02x %02x %02x\n",
	 vla.background.red, vla.background.green, vla.background.blue);
}

/* Set the background color */
void set_background_color(const vga_ball_color_t *c)
{
  vga_ball_arg_t vla;
  vla.background = *c;
  if (ioctl(vga_ball_fd, VGA_BALL_WRITE_BACKGROUND, &vla)) {
      perror("ioctl(VGA_BALL_SET_BACKGROUND) failed");
      return;
  }
}

//Begin new code

void set_body_parameters(float X, float Y, float VX, float VY, float M, int N){
  n_body_arg_t vla;
  vla.x = X;
  vla.y = Y;
  vla.vx = VX;
  vla.vy = VY;
  vla.m = M;
  vla.n = N
  if(ioctl(nbody_fd, SET_BODY_PARAMETERS, &vla)){
    perror("ioctl(NBODY_SET_PARAMETERS) failed");
    return;
  }
}

// Function to read the initial n-body state from a CSV file
float* get_initial_state(char* filename, int N){
  float* initial_state = (float*)malloc(N * 5 * sizeof(float));
  FILE* file = fopen(filename, 'r');
  if(!file){
    fprintf(stderr, "Could not open file %s\n", filename);
    return NULL; 
  }
  char row[MAXCHAR];
  int i = 0;
  while(fgets(row,MAXCHAR,file)){
    char* token = strtok(row,",");
    while(token != NULL){
      initial_state[i] = atof(token);
      token = strtok(NULL,",");
      i++;
    }
  }

  fclose(file);
  return initial_state;
}

// Main Function - Initializes the n-body simulation
int main(int argc, char** argv) //N, #TimeSteps
{
  if(argc > 3){
    perror("Too many arguments!\n");
    return -1; 
  }
  if (argc < 3){
    perror("Not enough arguments!\n");
    return -1; 
  }
  
  int N = atoi(argv[1]); //argument to integer
  int time_steps = atoi(argv[2]); //argument to integer
  if(N <= 0){
    perror("N must be a positive integer!\n");
    return -1; 
  } else if(N > 512){
    perror("N must be less than 512!\n");
    return -1; 
  }

  vga_ball_arg_t vla;
  int i;
  static const char filename[] = "/dev/nbody";

  printf("N-Body Userspace program started\n");

  if ( (nbody_fd = open(filename, O_RDWR)) == -1) {
    fprintf(stderr, "could not open %s\n", filename);
    return -1;
  }
  // Read in Initial N-Body State FROM CSV File
  float* initial_state = get_initial_state("input.csv", N);
  printf("Initial Bodies Parameters Read In\n");
  /*
  for (int i = 0; i< N*5; i++){
    printf("%f ", initial_state[i]);
  }
  printf("\n");
  */

  // The initial parameters are read in - pass them to the driver with ioctl
  for (int i = 0; i< N; i++){
    set_body_parameters(initial_state[i*5], initial_state[i*5 + 1], initial_state[i*5 + 2], initial_state[i*5 + 3], initial_state[i*5 + 4],i);
    //Do we need to sleep?
    usleep(5);
  }

  /*
  # define COLORS 9
  for (i = 0 ; i < 24 ; i++) {
    set_background_color(&colors[i % COLORS ]);
    print_background_color();
    usleep(400000);
  }
  */
  
  printf("N-Body Userspace program terminating\n");
  return 0;
}

