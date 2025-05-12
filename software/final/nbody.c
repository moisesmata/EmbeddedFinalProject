/*
 * Userspace program that communicates with the vga_ball device driver
 * through ioctls
 *
 * Stephen A. Edwards
 * Columbia University
 */

#include <stdio.h>
#include <stdlib.h>
#include "nbody_driver.h"
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

#define MAXCHAR 1000

int nbody_fd;

int high = 0xFFFF;
int low = 0x0000;

// ----------------------------------------------------
// Setting the Body for a Single Body
// ----------------------------------------------------
void set_body(double x, double y, double xv, double yv, double m, int n){
  body_t vla;
  vla.x = x;
  vla.y = y;
  vla.vx = xv;
  vla.vy = yv;
  vla.m = m;
  vla.n = (double) n;
  if(ioctl(nbody_fd, SET_BODY, &vla)){
    perror("ioctl(SET_BODY) failed");
    return;
  }
}

// ----------------------------------------------------
// Set the Simulation Paraameters - Called Once
// ----------------------------------------------------
void set_simulation_parameters(int N, int output_step){ //dt is always 2
  nbody_sim_config_t vla; 
  vla.N = N;
  vla.gap = output_step; 
  if(ioctl(nbody_fd, NBODY_SET_SIM_PARAMETERS, &vla)){
    perror("ioctl(NBODY_SET_SIM_PARAMETERS) failed");
    return;
  } 
}

// ----------------------------------------------------
// Set the go signal high to start thes sim
// ----------------------------------------------------
void set_go(int go){
  if(ioctl(nbody_fd, WRITE_GO, go)){
    perror("ioctl(WRITE_GO) failed");
    return;
  } 
}

// ----------------------------------------------------
// Continuously poll the read signal
// ----------------------------------------------------
int poll_done(){
  int done; 
  if (ioctl(nbody_fd, READ_DONE, &done)) {
      perror("ioctl(READ_DONE) failed");
      return -1;
  }
  if(done > 0){
    return 1;
  }
  return 0; 
}

// ----------------------------------------------------
// Read all the positions into the struct
// ----------------------------------------------------
all_positions_t read_positions(int N){
  //ioctl goes here
  all_positions_t positions;
  for(int i = 0; i < N; i++){
    body_pos_t vla;
    if (ioctl(nbody_fd, NBODY_READ_POSITIONS, &vla)){
      perror("ioctl(NBODY_SET_SIM_PARAMETERS) failed");
    } 
    positions[i] = vla;
  }
  return positions;
}

// ----------------------------------------------------
// Set the read signal
// ----------------------------------------------------
void set_read(int read){
  if(ioctl(nbody_fd, WRITE_READ, read)){
    perror("ioctl(WRITE_READ) failed");
    return;
  }
}

// ----------------------------------------------------
// Function to read the input CSV
// ----------------------------------------------------
double* get_initial_state(char* filename, int N){
  //Allocate Space for a the Body Paremeters
  double* initial_state = (double*)malloc(N * 5 * sizeof(double));
  if (!initial_state) {
    fprintf(stderr, "Memory allocation failed\n");
    return NULL;
  }

  //Open the file and read it
  FILE* file = fopen(filename, "r");
  if(!file){
    fprintf(stderr, "Could not open file %s\n", filename);
    return NULL; 
  }
  char row[MAXCHAR];
  int i = 0;

  //Go through file and save all the data
  while(fgets(row, MAXCHAR, file)){
    char* token = strtok(row,",");
    while(token != NULL){
      initial_state[i] = atof(token);
      token = strtok(NULL,",");
      i++;
    }
  }

  //Close final and return pointer to the initial parameters
  fclose(file);
  return initial_state;
}

// ----------------------------------------------------
// Main function - Runs Everything
// ----------------------------------------------------
int main(int argc, char** argv){  
  //Check to make sure that the 
  if (argc != 3) {
    fprintf(stderr, "Usage: ./nbody <# of bodies> <# of outputs>\n");
    return -1;
  }

  //Parse User Input
  int N = atoi(argv[1]); 
  int time_steps = atoi(argv[2]); 
  int dt = 2; //Set timestep to 2 because it makes our lives easier!

  //Make sure that N wasn't set to something weird
  if(N <= 0){
    perror("N must be a positive integer!\n");
    return -1; 
  } else if(N > 512){
    perror("N must be less than 512!\n");
    return -1; 
  }

  //Begin the userspace program
  int i;
  static const char filename[] = "/dev/sim";

  printf("N-Body Userspace program started\n");

  if ( (nbody_fd = open(filename, O_RDWR)) == -1) {
    fprintf(stderr, "could not open %s\n", filename);
    return -1;
  }

  // Read in Initial N-Body State FROM CSV File
  double* initial_state = get_initial_state("input.csv", N);
  printf("Initial Bodies Parameters Read In\n");

  //Create an array that saves all the timesteps
  all_positions_t* position_history = malloc(time_steps * sizeof(all_positions_t));
  if (!position_history) {
      fprintf(stderr, "Failed to allocate memory for position history\n");
      free(initial_state);
      return -1;
  }

  //Then set the initial parameters for the simulation
  int output_step = 5;
  set_simulation_parameters(N,output_step);

  // The initial parameters are read in - Send them to the driver

  for(int i = 0; i < N; i++){
    set_body(initial_state[5*i + 0], //x
             initial_state[5*i + 1], //y
             initial_state[5*i + 2], //vx
             initial_state[5*i + 3], //vy
             initial_state[5*i + 4], //m
             i); //body number
  }

  //Send the go signal
  set_go(high);
  
  //Do the looping - implemented as some sort of silly state machine
  int t = 0;
  while(t < time_steps){
    //Do Polling
    int read = 0;
    while(!read){
      //Wait for the poll signal
      if(poll_done()){
        read = 1;
        set_read(high);
      }
    }
    //Read the positions from the driver
    position_history[t] = read_positions(N);

    //Reading is finished, set read to low!
    set_read(low);

    //Increment Time Thing
    t += 1;
  }
  set_go(low);

  printf("Simulation Complete! Activating Display...");

  // Write all data to a CSV file
  FILE* output = fopen("nbody_results.csv", "w");
  if (output) {
      //Header with timestep, body0_x, body0_y, body1_x, body1_y, ...
      fprintf(output, "timestep");
      for (int i = 0; i < N; i++) {
          fprintf(output, ",body%d_x,body%d_y", i, i);
      }
      fprintf(output, "\n");
      
      for (int t = 0; t < time_steps; t++) {
          fprintf(output, "%d", t);
          for (int i = 0; i < N; i++) {
              fprintf(output, ",%f,%f", 
                  position_history[t].bodies[i].x, 
                  position_history[t].bodies[i].y);
          }
          fprintf(output, "\n");
      }
      fclose(output);
      printf("Results saved to nbody_results.csv\n");
  } else {
      fprintf(stderr, "Failed to open output file\n");
  }

  // Free allocated memory
  free(position_history);
  free(initial_state);

  printf("N-Body Userspace program terminating\n");
  return 0;
}

