/*
 * Userspace program that communicates with the vga_ball device driver
 * through ioctls
 *
 * Stephen A. Edwards
 * Columbia University
 */

#include <stdio.h>
#include "nbody_driver.h"
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

#define MAXCHAR 1000

int nbody_fd;
int high = 1;
int low = 0;

// ----------------------------------------------------
// Setting the Body parameters for the Sim
// ----------------------------------------------------
void set_body_parameters(float* input_parameters, int N){
  n_body_initial_parameters_t vla;
  for(int i = 0; i < N; i ++){
    body_t body;
    body.x = input_parameters[5*N];
    body.y = input_parameters[5*N+1];
    body.vx = input_parameters[5*N+2];
    body.vy = input_parameters[5*N+3];
    body.m = input_parameters[5*N+4];
    body.n = N;

    vla[i] = body;
  }
  
  if(ioctl(nbody_fd, NBODY_SET_BODY_PARAMETERS, &vla)){
    perror("ioctl(NBODY_SET_BODY_PARAMETERS) failed");
    return;
  }
}

// ----------------------------------------------------
// Set the Simulation Paraameters - Called Once
// ----------------------------------------------------
void set_simulation_parameters(int N, int output_step){ //dt is always 2
  nbody_sim_config_t vla; 
  vla.N = N;
  vla.output_step = output_step; 
  if(ioctl(nbody_fd, NBODY_SET_SIM_PARAMETERS, &vla)){
    perror("ioctl(NBODY_SET_SIM_PARAMETERS) failed");
    return;
  } 
}

// ----------------------------------------------------
// Set the go signal high to start thes sim
// ----------------------------------------------------
void set_go(int go){
  if(ioctl(nbody_fd, NBODY_START_SIM, go)){
    perror("ioctl(NBODY_START_SIM) failed");
    return;
  } 
}

// ----------------------------------------------------
// Continuously poll the read signal
// ----------------------------------------------------
int poll_done(){
  return 0; 
}

// ----------------------------------------------------
// Set the read signal
// ----------------------------------------------------
void set_read(int x){
  if(ioctl(nbody_fd, NBODY_SET_READ, go)){
    perror("ioctl(NBODY_SET_READ) failed");
    return;
  } ; 
}

// ----------------------------------------------------
// Function to read the input CSV
// ----------------------------------------------------
float* get_initial_state(char* filename, int N){
  //Allocate Space for a the Body Paremeters
  float* initial_state = (float*)malloc(N * 5 * sizeof(float));

  //Open the file and read it
  FILE* file = fopen(filename, 'r');
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
  if(argc > 3){
    perror("Too many arguments!\n");
    return -1; 
  } else if (argc < 3){
    perror("Usage: ./nbody <# of bodies> <# of time steps> \n");
    return -1; 
  } else{
    perror("Idk how this would happen but there's an error\n");
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
  static const char filename[] = "/dev/nbody";

  printf("N-Body Userspace program started\n");

  if ( (nbody_fd = open(filename, O_RDWR)) == -1) {
    fprintf(stderr, "could not open %s\n", filename);
    return -1;
  }
  // Read in Initial N-Body State FROM CSV File
  float* initial_state = get_initial_state("input.csv", N);
  printf("Initial Bodies Parameters Read In\n");

  // The initial parameters are read in - Send them to the driver
  set_body_parameters(initial_state, N);

  //Then set the initial parameters for the simulation
  int output_step = 5;
  set_body_parameters(N,ouput_step);
  
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
    //The polling is over, now we gotta go N times over the data and update the positions

    
    
    //Updating is done, set read to low
    set_read(low);

    //Increment Time
    t += 1;
  }

  printf("Simulation Complete! Activating Display...");
  //TODO: Add the display? What if we just did this in software with a graphics library
  
  printf("N-Body Userspace program terminating\n");
  return 0;
}

