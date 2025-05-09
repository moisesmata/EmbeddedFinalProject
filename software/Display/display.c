/*
 * Userspace program that reads in the CSV and plays the simulation on the VGA display
 */
#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include "display_driver.h"

#define MAXCHAR 1000
#define CSV_FILENAME "nbody_results.csv"
#define PLAYBACK_DELAY_MS 100  // Time between frames (ms)
#define MAX_TIMESTEPS 1000     // Fixed allocation for up to 1000 timesteps

// Function to convert nbody simulation coordinates to display coordinates
static void convert_coordinates(float nbody_x, float nbody_y, 
                               unsigned short *display_x, unsigned short *display_y) {
    //Do we want to scale the coordinates? My histograms from the python sims show most data is -500 - 500 in x and y
//even 250 could be good
}

// Structure to hold data for one simulation step
typedef struct {
    int num_bodies;
    float x[MAX_BODIES];
    float y[MAX_BODIES];
    int body_ids[MAX_BODIES];
} simulation_step_t;

int main(int argc, char** argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <playback_speed>\n", argv[0]);
        fprintf(stderr, "  playback_speed: speed multiplier (1.0 = normal speed)\n");
        return -1;
    }

    double playback_speed = atof(argv[1]);
    if (playback_speed <= 0) {
        fprintf(stderr, "Playback speed must be positive\n");
        return -1;
    }
    
    int vga_fd;
    static const char vga_device[] = "/dev/vga_display";
    if ((vga_fd = open(vga_device, O_RDWR)) == -1) {
        fprintf(stderr, "Could not open %s\n", vga_device);
        return -1;
    }
    
        FILE* csv_file = fopen(CSV_FILENAME, "r");
    if (!csv_file) {
        fprintf(stderr, "Could not open file %s\n", CSV_FILENAME);
        close(vga_fd);
        return -1;
    }
    
    printf("Reading simulation data from %s\n", CSV_FILENAME);
    
    // Skip header line
    char line[MAXCHAR];
    fgets(line, MAXCHAR, csv_file);
    
    // Allocate memory for all timesteps at once (fixed allocation)
    simulation_step_t* simulation_data = calloc(MAX_TIMESTEPS, sizeof(simulation_step_t));
    if (!simulation_data) {
        fprintf(stderr, "Memory allocation failed\n");
        fclose(csv_file);
        close(vga_fd);
        return -1;
    }
        
    // Read all simulation data into allocated memory
    int max_body_id = -1;
    int actual_timesteps = 0;
    
    while (fgets(line, MAXCHAR, csv_file)) {
        int timestep, body_id;
        float x, y;
        
        // Parse CSV line: timestep,body_id,x,y
        if (sscanf(line, "%d,%d,%f,%f", &timestep, &body_id, &x, &y) != 4) {
            fprintf(stderr, "Error parsing line: %s", line);
            continue;
        }
        
        //update the max timestep
        if (timestep + 1 > actual_timesteps) {
            actual_timesteps = timestep + 1;
        }
        //update max body seen
        if (body_id > max_body_id) {
            max_body_id = body_id;
        }
        
        //store data in struct
        int idx = simulation_data[timestep].num_bodies;
        simulation_data[timestep].x[idx] = x;
        simulation_data[timestep].y[idx] = y;
        simulation_data[timestep].body_ids[idx] = body_id;
        simulation_data[timestep].num_bodies++;
    }
    
    fclose(csv_file);
    
    printf("Loaded %d timesteps with %d bodies\n", actual_timesteps, max_body_id + 1);
    
    //clear screen
    if (ioctl(vga_fd, VGA_DISPLAY_CLEAR_SCREEN, 0) < 0) {
        perror("ioctl(VGA_DISPLAY_CLEAR_SCREEN) failed");
        free(simulation_data);
        close(vga_fd);
        return -1;
    }
    
    //Insert Playback loop //

    free(simulation_data);
    close(vga_fd);
    
    return 0;
}

