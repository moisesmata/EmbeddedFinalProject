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
#define PLAYBACK_DELAY_MS 100  
#define MAX_TIMESTEPS 1000   //Fixed allocation (will fix later)

int vga_fd;

// Function to convert nbody simulation coordinates to display coordinates
static void convert_coordinates(float nbody_x, float nbody_y, 
                               unsigned short *display_x, unsigned short *display_y) {
    // Scale from -500,500 range to display coordinates
    *display_x = (unsigned short)((nbody_x + 500.0) / 1000.0 * (DISPLAY_WIDTH - 100)) + 50;
    *display_y = (unsigned short)((nbody_y + 500.0) / 1000.0 * (DISPLAY_HEIGHT - 100)) + 50;
    
    // Ensure within bounds
    if (*display_x >= DISPLAY_WIDTH) *display_x = DISPLAY_WIDTH - 1;
    if (*display_y >= DISPLAY_HEIGHT) *display_y = DISPLAY_HEIGHT - 1;
}

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
    vga_display_arg_t* simulation_data = calloc(MAX_TIMESTEPS, sizeof(vga_display_arg_t));
    
    if (!simulation_data) {
        fprintf(stderr, "Memory allocation failed\n");
        fclose(csv_file);
        close(vga_fd);
        return -1;
    }
        
    //Find the actual no of bodies
    // and amt of timesteps
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
        
        //Get index
        int idx = simulation_data[timestep].num_bodies;
        
        //Convert to display coords
        unsigned short display_x, display_y;
        convert_coordinates(x, y, &display_x, &display_y);
        
        simulation_data[timestep].bodies[idx].x = display_x;
        simulation_data[timestep].bodies[idx].y = display_y;
        
        //simulation_data[timestep].bodies[idx].radius = 5 + (body_id % 10);
        //simulation_data[timestep].bodies[idx].n = body_id;
        //simulation_data[timestep].num_bodies++;
    }
    
    fclose(csv_file);
    
    printf("Loaded %d timesteps with %d bodies\n", actual_timesteps, max_body_id + 1);
    
    // Clear screen
    if (ioctl(vga_fd, VGA_DISPLAY_CLEAR_SCREEN, 0) < 0) {
        perror("ioctl(VGA_DISPLAY_CLEAR_SCREEN) failed");
        free(simulation_data);
        close(vga_fd);
        return -1;
    }
    
    // Playback loop
    
    for (int t = 0; t < actual_timesteps; t++) {
        if (ioctl(vga_fd, VGA_DISPLAY_WRITE_PROPERTIES, &simulation_data[t]) < 0) {
            perror("ioctl(VGA_DISPLAY_WRITE_PROPERTIES) failed");
            break;
        }
        
        usleep((int)(PLAYBACK_DELAY_MS * 1000 / playback_speed));
        
    }
    
    printf("\nPlayback complete\n");
    
    free(simulation_data);
    close(vga_fd);
    
    return 0;
}

