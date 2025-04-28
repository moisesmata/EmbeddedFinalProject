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

#include "fbputchar.h"

// Display dimensions and parameters
#define DISPLAY_WIDTH 640
#define DISPLAY_HEIGHT 480
#define MAX_BODIES 10
#define BODY_RADIUS 5
#define MIN_MASS 5.0f
#define MAX_MASS 50.0f

// Structure to represent a body in the simulation
typedef struct {
    float x;
    float y;
    float mass;
    char symbol;
} body_t;

// Function to draw a body on the frame buffer
void draw_body(body_t body) {
    int x = (int)body.x;
    int y = (int)body.y;
    
    // Ensure the body is within display bounds
    if (x < 0 || x >= DISPLAY_WIDTH || y < 0 || y >= DISPLAY_HEIGHT)
        return;
    
    // Draw the body using its symbol character
    fbputchar(body.symbol, y / 16, x / 8);  // Assuming 8x16 character size
}

// Function to clear the previous position of a body
void clear_body(int x, int y) {
    if (x < 0 || x >= DISPLAY_WIDTH || y < 0 || y >= DISPLAY_HEIGHT)
        return;
    
    fbputchar(' ', y / 16, x / 8);
}

// Function to calculate the acceleration for each body
void getA(body_t *bodies, float G, int N, float** A) {
    float** F = (float**)malloc(N * sizeof(float*));
    for (int i = 0; i < N; i++) {
        F[i] = (float*)calloc(2, sizeof(float));
    }

    // Calculate forces for each body
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (i != j) { // Avoid calculating force with itself
                float dx = bodies[i].x - bodies[j].x;
                float dy = bodies[i].y - bodies[j].y;
                float distance = sqrtf(dx * dx + dy * dy);
                
                // Avoid division by zero or very small distances
                if (distance < 5.0f) distance = 5.0f;
                
                float factor = G * bodies[i].mass * bodies[j].mass / powf(distance, 3);
                
                F[i][0] += factor * dx;
                F[i][1] += factor * dy;
            }
        }
        
        // Calculate acceleration from force: A = -F/M
        A[i][0] = -1.0f * (F[i][0] / bodies[i].mass);
        A[i][1] = -1.0f * (F[i][1] / bodies[i].mass);
    }

    // Free allocated memory for F
    for (int i = 0; i < N; i++) {
        free(F[i]);
    }
    free(F);
}

// Generate a random float between min and max
float random_float(float min, float max) {
    return min + (max - min) * ((float)rand() / (float)RAND_MAX);
}

// Main function with N-body simulation
void simulate(int N, float T, float dt) {
    float t0 = 0.0f;
    int timestep = 0;
    
    // Gravitational constant
    float G = 10.0f;
    
    // Initialize bodies array
    body_t *bodies = (body_t*)malloc(N * sizeof(body_t));
    
    // Allocate memory for velocities and accelerations
    float** V = (float**)malloc(N * sizeof(float*));
    float** A = (float**)malloc(N * sizeof(float*));
    
    // Store previous positions for clearing
    int *prev_x = (int*)malloc(N * sizeof(int));
    int *prev_y = (int*)malloc(N * sizeof(int));
    
    // Initialize arrays
    for (int i = 0; i < N; i++) {
        V[i] = (float*)calloc(2, sizeof(float));
        A[i] = (float*)calloc(2, sizeof(float));
    }
    
    // Set random seed
    srand(time(NULL));
    
    // Available symbols for the bodies
    char symbols[] = {'@', '#', '*', '+', 'O', 'X', 'H', 'M', 'W', 'Z'};
    
    // Generate random initial positions and masses
    printf("Generating random positions for %d bodies...\n", N);
    for (int i = 0; i < N; i++) {
        // Generate position with some margin from the edges
        bodies[i].x = random_float(DISPLAY_WIDTH * 0.1f, DISPLAY_WIDTH * 0.9f);
        bodies[i].y = random_float(DISPLAY_HEIGHT * 0.1f, DISPLAY_HEIGHT * 0.9f);
        
        // Generate random mass
        bodies[i].mass = random_float(MIN_MASS, MAX_MASS);
        
        // Assign a symbol for visualization
        bodies[i].symbol = (i < sizeof(symbols)) ? symbols[i] : '*';
        
        // Initialize previous positions
        prev_x[i] = (int)bodies[i].x;
        prev_y[i] = (int)bodies[i].y;
        
        // Print the generated body information
        printf("Body %d: Position (%.2f, %.2f), Mass: %.2f, Symbol: %c\n", 
               i+1, bodies[i].x, bodies[i].y, bodies[i].mass, bodies[i].symbol);
    }
    
    // Calculate initial accelerations
    getA(bodies, G, N, A);

    // Clear the screen before starting
    clearscreen();
    
    // Display initial positions
    for (int i = 0; i < N; i++) {
        draw_body(bodies[i]);
    }
    
    // Draw borders
    for (int i = 0; i < DISPLAY_WIDTH/8; i++) {
        fbputchar('-', 0, i);
        fbputchar('-', DISPLAY_HEIGHT/16 - 1, i);
    }
    
    for (int i = 0; i < DISPLAY_HEIGHT/16; i++) {
        fbputchar('|', i, 0);
        fbputchar('|', i, DISPLAY_WIDTH/8 - 1);
    }

    // Display a legend for bodies
    fbputs("Bodies:", 2, 1);
    for (int i = 0; i < N && i < 10; i++) {
        char legend[20];
        sprintf(legend, "%c: %.1f", bodies[i].symbol, bodies[i].mass);
        fbputs(legend, 3+i, 1);
    }
    
    // Main simulation loop
    while (t0 < T) {
        // Brief pause to make the simulation visible
        usleep(50000);  // 50ms delay
        
        // Clear previous positions
        for (int i = 0; i < N; i++) {
            clear_body(prev_x[i], prev_y[i]);
        }
        
        // Print current time at the top
        char time_str[32];
        sprintf(time_str, "Time: %.2f / %.2f", t0, T);
        fbputs("                    ", 1, 1);  // Clear the line first
        fbputs(time_str, 1, 1);
        
        // Leapfrog integrator
        
        // 1. Update velocities by half a time step
        for (int i = 0; i < N; i++) {
            V[i][0] += A[i][0] * dt / 2.0f;
            V[i][1] += A[i][1] * dt / 2.0f;
        }
        
        // 2. Update positions by a full time step
        for (int i = 0; i < N; i++) {
            // Store previous positions for clearing
            prev_x[i] = (int)bodies[i].x;
            prev_y[i] = (int)bodies[i].y;
            
            // Update positions
            bodies[i].x += V[i][0] * dt;
            bodies[i].y += V[i][1] * dt;
            
            // Bounce off walls if position is outside the display area
            if (bodies[i].x < 0 || bodies[i].x >= DISPLAY_WIDTH) {
                V[i][0] = -V[i][0] * 0.8f;  // Damping factor
                bodies[i].x = (bodies[i].x < 0) ? 0 : DISPLAY_WIDTH-1;
            }
            
            if (bodies[i].y < 0 || bodies[i].y >= DISPLAY_HEIGHT) {
                V[i][1] = -V[i][1] * 0.8f;  // Damping factor
                bodies[i].y = (bodies[i].y < 0) ? 0 : DISPLAY_HEIGHT-1;
            }
        }

        // 3. Recalculate accelerations
        getA(bodies, G, N, A);
        
        // 4. Update velocities by another half time step
        for (int i = 0; i < N; i++) {
            V[i][0] += A[i][0] * dt / 2.0f;
            V[i][1] += A[i][1] * dt / 2.0f;
        }
        
        // Draw updated positions
        for (int i = 0; i < N; i++) {
            draw_body(bodies[i]);
        }
        
        // Update time and timestep
        t0 += dt;
        timestep++;
    }
    
    // Free all allocated memory
    for (int i = 0; i < N; i++) {
        free(V[i]);
        free(A[i]);
    }
    free(V);
    free(A);
    free(bodies);
    free(prev_x);
    free(prev_y);
}

int main() {
    int N = 2;   // Default number of bodies
    float T = 30.0f;  // Total simulation time
    float dt = 0.1f;  // Time step
    
    // Open the frame buffer
    if (fbopen() != 0) {
        fprintf(stderr, "Error: could not open framebuffer device\n");
        return -1;
    }

    printf("N-body simulation\n");
    printf("----------------\n");
    printf("Enter number of bodies (1-%d): ", MAX_BODIES);
    scanf("%d", &N);
    
    // Validate the number of bodies
    if (N < 1) {
        N = 1;
        printf("Using minimum of 1 body\n");
    } else if (N > MAX_BODIES) {
        N = MAX_BODIES;
        printf("Using maximum of %d bodies\n", MAX_BODIES);
    }
    
    printf("Enter total simulation time (seconds): ");
    scanf("%f", &T);
    
    printf("Enter time step (smaller = more accurate but slower): ");
    scanf("%f", &dt);
    
    printf("\nStarting simulation...\n");
    simulate(N, T, dt);
    
    // Display "Press Enter to exit" message
    fbputs("Simulation complete. Press Enter to exit.", DISPLAY_HEIGHT/16 - 2, 1);
    getchar();  // Clear previous Enter
    getchar();  // Wait for Enter
    
    // Clear screen before exiting
    clearscreen();
    
    return 0;
}