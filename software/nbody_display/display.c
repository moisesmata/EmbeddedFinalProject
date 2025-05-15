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
#include "nbody_display_driver.h"

#define MAXCHAR 100000
#define CSV_FILENAME "nbody_results.csv"
#define PLAYBACK_DELAY_MS 100  
#define MAX_TIMESTEPS 40000   //Fixed allocation (will fix later)
#define MIN_RADIUS 2
#define MAX_RADIUS 6

typedef struct {
    float x;
    float y;
    int n;
    float m;
} body_full;
// Function to convert nbody simulation coordinates to display coordinates
static void convert_coordinates(float nbody_x, float nbody_y, 
                               short *display_x, short *display_y) {
    // Scale from -500,500 range to display coordinates
    *display_x = (short)((nbody_x + 500.0) / 1000.0 * (DISPLAY_WIDTH));
    *display_y = (short)((nbody_y + 500.0) / 1000.0 * (DISPLAY_HEIGHT));
    
}

// Function to parse a CSV line into a vga_ball_arg_t structure -- This populates one timestep of data
static int parse_csv_line(char* line, body_full* arg, int max_bodies) {
    char* token;
    
    //Ensure num_bodies starts at 0
    int num_bodies = 0;
    // Get the timestep (first column)
    token = strtok(line, ",");
    if (!token) return -1;
    
    // Process each body's x and y coordinates
    for (int i = 0; i < max_bodies; i++) {
        // Passing in Null to strtok will continue tokenizing the same string
        token = strtok(NULL, ",");
        if (!token) break;  //Exit the loop, we've accounted for all bodies
        float x = atof(token);
        
        token = strtok(NULL, ",");
        if (!token) break;  //Exit the loop, we've accounted for all bodies
        float y = atof(token);
        
        token = strtok(NULL, ",");
        if (!token) break;  //Exit the loop, we've accounted for all bodies
        float m = atof(token);

        if(m == 0) {
            continue; // Skip bodies with mass 0
        } 
        arg[i].x = x;
        arg[i].y = y;
        arg[i].n = i;
        arg[i].m = m;
        num_bodies++;
    }
    
    return num_bodies;
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
    
    int vga_fd;
    static const char vga_device[] = "/dev/nbody_display";
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
    vga_ball_arg_t* simulation_data = calloc(MAX_TIMESTEPS, sizeof(vga_ball_arg_t));
    body_full* row_data = calloc(MAX_BODIES, sizeof(body_full));
    
    if (!simulation_data) {
        fprintf(stderr, "Memory allocation failed\n");
        fclose(csv_file);
        close(vga_fd);
        return -1;
    }
        
    //Find the actual amt of timesteps
    int actual_timesteps = 0;
    
    char first_line = 1; 
    float xzero, yzero, xrange, yrange;
    float mzero, mrange;
    //Read from CSV (one line per timestep)
    while (fgets(line, MAXCHAR, csv_file)) {
        //Use above function to parse the line
        int n_bodies = parse_csv_line(line, row_data, MAX_BODIES);
        
        if (first_line) {
            simulation_data[0].num_bodies = n_bodies;
            printf("Detected %d bodies in the simulation\n", n_bodies);
        } else {
            //Bodies stay the same for each timestep
            simulation_data[actual_timesteps].num_bodies = simulation_data[0].num_bodies;
        }
        if(first_line) {
            first_line = 0;
            xzero = row_data[0].x;
            yzero = row_data[0].y;
            mzero = row_data[0].m;
            xrange = row_data[0].x;
            yrange = row_data[0].y;
            mrange = row_data[0].m;

            for (int i = 1; i < n_bodies; i++) {
                // printf("Body %d: x=%.2f, y=%.2f, m=%.2f\n", i, row_data[i].x, row_data[i].y, row_data[i].m);
                if (row_data[i].x < xzero) xzero = row_data[i].x;
                if (row_data[i].y < yzero) yzero = row_data[i].y;
                if (row_data[i].m < mzero) mzero = row_data[i].m;

                if (row_data[i].x > xrange) xrange = row_data[i].x;
                if (row_data[i].y > yrange) yrange = row_data[i].y;
                if (row_data[i].m > mrange) mrange = row_data[i].m;
            }

            xrange -= xzero;
            yrange -= yzero;
            xzero -= .1 * xrange;
            yzero -= .1 * yrange;
            xrange *= 1.2;
            yrange *= 1.2; 
            mrange -= mzero;
        }

        for (int i = 0; i < n_bodies; i++) {
            if(row_data[i].x > xzero && row_data[i].x < xzero + xrange &&
               row_data[i].y > yzero && row_data[i].y < yzero + yrange && row_data[i].m != 0) {
                simulation_data[actual_timesteps].bodies[i].x = ((row_data[i].x - xzero) / xrange) * (float)DISPLAY_WIDTH;
                simulation_data[actual_timesteps].bodies[i].y = ((row_data[i].y - yzero) / yrange) * (float)DISPLAY_HEIGHT;
                simulation_data[actual_timesteps].bodies[i].m = ((row_data[i].m - mzero) / mrange) * (float) 255;
                simulation_data[actual_timesteps].bodies[i].n = i;
                simulation_data[actual_timesteps].bodies[i].radius = (unsigned short)(((row_data[i].m - mzero) / mrange) * (float)(MAX_RADIUS - MIN_RADIUS) + MIN_RADIUS);
                

            } else {
                simulation_data[actual_timesteps].bodies[i].radius = 0;
            }
        }
        
        // When reading the first line, theres a special case to populate num_bodies
        
        
        actual_timesteps++;
        
    }

    fclose(csv_file);
    printf("Loaded %d timesteps with %d bodies\n", actual_timesteps, simulation_data[0].num_bodies);
    
    // double min_mass = 1e100;  // Start with a very large number
    // double max_mass = 0; //Start with 0
    
    // for (int i = 0; i < simulation_data[0].num_bodies; i++) {
    //     if (simulation_data[0].bodies[i].m < min_mass) {
    //         min_mass = simulation_data[0].bodies[i].m;
    //     }
    //     if (simulation_data[0].bodies[i].m > max_mass) {
    //         max_mass = simulation_data[0].bodies[i].m;
    //     }
    // }

    // printf("Mass range: min=%.2f, max=%.2f\n", min_mass, max_mass);

    // for (int t = 0; t < actual_timesteps; t++) {
    //     for (int i = 0; i < simulation_data[t].num_bodies; i++) {
    //         double mass_normalized = 0.0;
            
    //         // Prevent division by zero if all masses are the same
    //         if (max_mass > min_mass) {
    //             //the percentage of max mass
    //             mass_normalized = (simulation_data[t].bodies[i].m - min_mass) / (max_mass - min_mass);
    //         }
            
    //         simulation_data[t].bodies[i].radius = (unsigned short)(mass_normalized * MAX_RADIUS + MIN_RADIUS);
    //     }
    // }
    

    // Clear screen
    if (ioctl(vga_fd, VGA_BALL_CLEAR_SCREEN, 0) < 0) {
        perror("ioctl(VGA_BALL_CLEAR_SCREEN) failed");
        free(simulation_data);
        close(vga_fd);
        return -1;
    }
    
    // Playback loop
    for (int t = 0; t < actual_timesteps; t++) {
        if (ioctl(vga_fd, VGA_BALL_WRITE_PROPERTIES, &simulation_data[t]) < 0) {
            perror("ioctl(VGA_BALL_WRITE_PROPERTIES) failed");
            break;
        }
        
        usleep((int)(PLAYBACK_DELAY_MS * 1000 / playback_speed));

        
    }
    
    printf("\nPlayback complete\n");
    
    free(simulation_data);
    close(vga_fd);
    
    return 0;
}
