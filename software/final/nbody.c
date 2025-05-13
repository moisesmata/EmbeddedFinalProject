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

int high = 0xFFFFFFFF;
int low = 0x00000000;

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
  vla.n = n;
  fprintf(stderr, "Setting Body %d: X: %f, Y: %f, M: %f\n",n,x,y,m);
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
  if(ioctl(nbody_fd, WRITE_GO, &go)){
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
  fprintf(stderr, "Polling: %d \n", done);
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
    fprintf(stderr, "Reading Body Number %d\n", i);
    body_pos_t vla;
    vla.n = i;
    if (ioctl(nbody_fd, READ_POSITIONS, &vla)){
      perror("ioctl(READ_POSITION) failed\n");
    } 
    fprintf(stderr, "Body %d Position Read: X:%f, Y:%f \n", N,vla.x,vla.y);
    positions.bodies[i] = vla;
  }
  return positions;
}

// ----------------------------------------------------
// Set the read signal
// ----------------------------------------------------
void set_read(int read){
  if(ioctl(nbody_fd, WRITE_READ, &read)){
    perror("ioctl(WRITE_READ) failed\n");
    return;
  }
}

// ----------------------------------------------------
// Function to read the input CSV
// ----------------------------------------------------
double* get_initial_state(char* filename, int N){
//Allocate Space for a the Body Paremeters a
  double* initial_state = (double*)calloc(N * 5 * sizeof(double));
  if (!initial_state) {
    fprintf(stderr, "Memory allocation failed\n");
    return NULL;
  }
  fprintf(stderr, "Allocated %d bytes for initial state\n", N * 5 * sizeof(double));

  //Open the file and read it
  FILE* file = fopen(filename, "r");
  if(!file){
    fprintf(stderr, "Could not open file %s\n", filename);
    return NULL; 
  }
  char row[MAXCHAR];
  int i = 0;
  int flag = 0;
  fprintf(stderr, "Reading file %s\n", filename);
  //Go through file and save all the data
  while(fgets(row, MAXCHAR, file)){
    char* token = strtok(row,",");
    while(token != NULL){
      initial_state[i] = atof(token);
      fprintf(stderr, "Initial State %d: %lf\n", i, initial_state[i]);
      token = strtok(NULL,",");
      i++;
      if(i >= (N * 5)){
        flag = 1;
        break;
      }
    }
    if(flag){
      break;
    }
  }

  fprintf(stderr, "Do we get here???? %lf %lf %lf\n", initial_state[0], initial_state[1], initial_state[2]);

  //Close final and return pointer to the initial parameters
  fclose(file);
  fprintf(stderr, "we closed the file\n");
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

  set_go(low);
  set_read(low);

  //Parse User Input
  int N = atoi(argv[1]); 
  fprintf(stderr, "Number of bodies is %d\n",N);

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

  if ( (nbody_fd = open(filename, O_RDWR)) == -1) {
    fprintf(stderr, "could not open %s\n", filename);
    return -1;
  }

  printf("N-Body Userspace program started\n");

  // Read in Initial N-Body State FROM CSV File

  double* zeros = (double*)calloc(N * 5, sizeof(double));
  for(int i = 0; i < N; i++){
    set_body(zeros[5*i + 0], //x
             zeros[5*i + 1], //y
             zeros[5*i + 2], //vx
             zeros[5*i + 3], //vy
             zeros[5*i + 4], //m
             i); //body number
  }

  double* initial_state = get_initial_state("input.csv", N);
  
  fprintf(stderr, "Initial Bodies Parameters Read In\n");

  //Create an array that saves all the timesteps
  all_positions_t* position_history = malloc(time_steps * sizeof(all_positions_t));
  if (!position_history) {
      fprintf(stderr, "Failed to allocate memory for position history\n");
      return -1;
  }

  //Then set the initial parameters for the simulation
  int output_step = 6;
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

  fprintf(stderr, "Simulation bodies and parameters read in\n");

  //Send the go signal
  set_go(high);

  fprintf(stderr, "Go signal set high!\n");
  
  //Do the looping - implemented as some sort of silly state machine
  int t = 0;
  while(t < time_steps){

    fprintf(stderr, "Timestep %d Beginning:\n", t);
    //Do Polling
    int read = 0;

    /**/
    while(!read){
      //Wait for the poll signal
      fprintf(stderr, "Polling...\n");
      if(poll_done()){
        fprintf(stderr, "Received Done!\n");
        read = 1;
        set_read(high);
        break;
      }
    }
    //Read the positions from the driver

    fprintf(stderr, "Read Set To High\n");
    //usleep(100000);

    while(1){
      if(poll_done() == 0){
        break;
      }
    }
    
    fprintf(stderr, "Done is low again!\n");

    position_history[t] = read_positions(N);

    fprintf(stderr, "How did we get here?\n");

    //Reading is finished, set read to low!
    set_read(low);

    //Increment Time Thing
    t += 1;
  }
  set_go(low);

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
      fprintf(stderr, "Results saved to nbody_results.csv\n");
  } else {
      fprintf(stderr, "Failed to open output file\n");
  }

  // Free the allocated memory to prevent memory leaks
  free(zeros);
  free(initial_state);
  free(position_history);

  printf("N-Body Userspace program terminating\n");
  return 0;
}

