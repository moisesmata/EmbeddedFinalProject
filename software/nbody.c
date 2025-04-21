#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <time.h>

#include "vga_ball.h"

int vga_ball_fd;

/* Read and print the properties color */
void print_properties_color() {
  vga_ball_arg_t vla;
  
  if (ioctl(vga_ball_fd, VGA_BALL_READ_PROPERTIES, &vla)) {
      perror("ioctl(VGA_BALL_READ_PROPERTIES) failed");
      return;
  }
  printf("%02x %02x %02x %02x\n",
	 vla.properties.x1, vla.properties.y1, vla.properties.x2, vla.properties.y2);
}

/* Set the properties color */
void set_properties_color(const vga_ball_props_t *c)
{
  vga_ball_arg_t vla;
  vla.properties = *c;
  if (ioctl(vga_ball_fd, VGA_BALL_WRITE_PROPERTIES, &vla)) {
      perror("ioctl(VGA_BALL_SET_PROPERTIES) failed");
      return;
  }
}


// Function to calculate the acceleration for each body
void getA(double** R, double G, double* M, int N, double** A) {
    double** F = (double**)malloc(N * sizeof(double*));
    for (int i = 0; i < N; i++) {
        F[i] = (double*)calloc(2, sizeof(double));
    }

    // Calculate forces for each body
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (i != j) { // Avoid calculating force with itself
                double dx = R[i][0] - R[j][0];
                double dy = R[i][1] - R[j][1];
                double distance = sqrt(dx * dx + dy * dy);
                double factor = G * M[i] * M[j] / pow(distance, 3);
                
                F[i][0] += factor * dx;
                F[i][1] += factor * dy;
            }
        }
        
        // Calculate acceleration from force: A = -F/M
        A[i][0] = -1 * (F[i][0] / M[i]);
        A[i][1] = -1 * (F[i][1] / M[i]);
    }

    // Print accelerations
    printf("Accelerations:\n");
    for (int i = 0; i < N; i++) {
        printf("Body %d: (%f, %f)\n", i+1, A[i][0], A[i][1]);
    }

    // Free allocated memory for F
    for (int i = 0; i < N; i++) {
        free(F[i]);
    }
    free(F);
}

// Main function with N-body simulation
void simulate(int N, double T, double dt, vga_ball_props_t init) {
    double t0 = 0.0;
    int timestep = 0;
    int total_timesteps = (int)(T / dt) + 1;
    
    // Gravitational constant
    double G = 10.0;
    
    // Allocate memory for positions, velocities, accelerations, and masses
    double** R = (double**)malloc(N * sizeof(double*));
    double** V = (double**)malloc(N * sizeof(double*));
    double** A = (double**)malloc(N * sizeof(double*));
    double* M = (double*)malloc(N * sizeof(double));
    
    /*
    // Allocate memory for position history (for visualization if needed)
    double*** positions = (double***)malloc(total_timesteps * sizeof(double**));
    for (int t = 0; t < total_timesteps; t++) {
        positions[t] = (double**)malloc(N * sizeof(double*));
        for (int i = 0; i < N; i++) {
            positions[t][i] = (double*)malloc(2 * sizeof(double));
        }
    }*/
    
    // Initialize arrays
    for (int i = 0; i < N; i++) {
        R[i] = (double*)calloc(2, sizeof(double));
        V[i] = (double*)calloc(2, sizeof(double));
        A[i] = (double*)calloc(2, sizeof(double));
    }
    
    // Get initial positions and masses from user
    for (int i = 0; i < N; i++) {
        printf("Body #%d - Type in X Position: ", i+1);
        scanf("%lf", &R[i][0]);
        
        printf("Body #%d - Type in Y Position: ", i+1);
        scanf("%lf", &R[i][1]);
        
        printf("Body #%d - Type in Mass: ", i+1);
        scanf("%lf", &M[i]);
    }
    
    // Calculate initial accelerations
    getA(R, G, M, N, A);

    set_properties_color(&init);

    // Main simulation loop
    while (t0 < T) {
        /*
        // Store current positions (for visualization if needed)
        for (int i = 0; i < N; i++) {
            positions[timestep][i][0] = R[i][0];
            positions[timestep][i][1] = R[i][1];
        }*/
        
        // Print current positions
        printf("Time: %.2f\n", t0);
        for (int i = 0; i < N; i++) {
            printf("Body %d position: (%.2f, %.2f)\n", i+1, R[i][0], R[i][1]);
        }
        printf("\n");
        
        // Leapfrog integrator
        
        // 1. Update velocities by half a time step
        for (int i = 0; i < N; i++) {
            V[i][0] += A[i][0] * dt / 2.0;
            V[i][1] += A[i][1] * dt / 2.0;
        }
        
        // 2. Update positions by a full time step
        for (int i = 0; i < N; i++) {
            R[i][0] += V[i][0] * dt;
            R[i][1] += V[i][1] * dt;
        }

        init.x1 = (unsigned short)R[0][0];
        init.y1 = (unsigned short)R[0][1];
        init.x2 = (unsigned short)R[1][0];
        init.y2 = (unsigned short)R[1][1];
        set_properties_color(&init);

        // 3. Recalculate accelerations
        getA(R, G, M, N, A);
        
        // 4. Update velocities by another half time step
        for (int i = 0; i < N; i++) {
            V[i][0] += A[i][0] * dt / 2.0;
            V[i][1] += A[i][1] * dt / 2.0;
        }
        
        // Update time and timestep
        t0 += dt;
        timestep++;
    }
    
    // Free all allocated memory
    for (int i = 0; i < N; i++) {
        free(R[i]);
        free(V[i]);
        free(A[i]);
    }
    free(R);
    free(V);
    free(A);
    free(M);
    
    /*
    for (int t = 0; t < total_timesteps; t++) {
        for (int i = 0; i < N; i++) {
            free(positions[t][i]);
        }
        free(positions[t]);
    }
    free(positions);
    */

}

int main() {
    vga_ball_arg_t vla;
    static const char filename[] = "/dev/vga_ball";
    vga_ball_props_t init = {320, 120, 640, 120 };

    int N = 2;   // Number of bodies
    double T = 10.0;  // Total simulation time
    double dt = 0.01; // Time step
    
    if ( (vga_ball_fd = open(filename, O_RDWR)) == -1) {
        fprintf(stderr, "could not open %s\n", filename);
        return -1;
    }

    printf("N-body simulation\n");
    printf("----------------\n");
    printf("Number of bodies: %d\n", N);
    printf("Total simulation time: %.2f\n", T);
    printf("Time step: %.2f\n\n", dt);
    
    simulate(N, T, dt, init);
    
    return 0;
}