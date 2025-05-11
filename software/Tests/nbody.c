/*
 * Userspace program that communicates with the vga_ball device driver
 * through ioctls
 *
 * Stephen A. Edwards
 * Columbia University
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAXCHAR 1000

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

  int N = atoi(argv[1]);

  double* initial_state = get_initial_state("input.csv", N);
  if (!initial_state) {
    fprintf(stderr, "Failed to read initial state\n");
    return -1;
  }

  // Check that it parses the input correctly
  for(int i = 0; i< N; i++){
    printf("Body %d: x=%f, y=%f, m=%f, vx=%f, vy=%f\n", 
        i, initial_state[i*5], initial_state[i*5+1], 
        initial_state[i*5+2], initial_state[i*5+3], 
        initial_state[i*5+4]);
  }

  

  /*
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
  */
  return 0;
}

