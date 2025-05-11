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

#define MAXCHAR 5000
#define CSV_FILENAME "nbody_results.csv"
#define PLAYBACK_DELAY_MS 100  
#define MAX_TIMESTEPS 1000   //Fixed allocation (will fix later)

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

// Function to parse a CSV line into a vga_ball_arg_t structure -- This populates one timestep of data
static int parse_csv_line(char* line, vga_ball_arg_t* arg, int max_bodies) {
    char* token;
    int timestep;

    //Ensure num_bodies starts at 0
    arg->num_bodies = 0;

    // Get the timestep (first column)
    token = strtok(line, ",");
    if (!token) return -1;
    timestep = atoi(token);

    // Process each body's x and y coordinates
    for (int i = 0; i < max_bodies; i++) {
        // Passing in Null to strtok will continue tokenizing the same string
        token = strtok(NULL, ",");
        if (!token) break;  //Exit the loop, we've accounted for all bodies
        float x = atof(token);

        token = strtok(NULL, ",");
        if (!token) break;  //Exit the loop, we've accounted for all bodies
        float y = atof(token);

        unsigned short display_x, display_y;
        convert_coordinates(x, y, &display_x, &display_y);

        arg->bodies[i].x = display_x;
        arg->bodies[i].y = display_y;
        arg->bodies[i].radius = 25; 
        arg->bodies[i].n = i;

        arg->num_bodies++;
    }

    return timestep;
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
    static const char vga_device[] = "/dev/vga_ball";
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
<<<<<<< HEAD

=======
    
>>>>>>> 62e5a77f29c2f2496e713d15636a4a433360fad8
    if (!simulation_data) {
        fprintf(stderr, "Memory allocation failed\n");
        fclose(csv_file);
        close(vga_fd);
        return -1;
    }

    //Find the actual amt of timesteps
    int actual_timesteps = 0;

    //Read from CSV (one line per timestep)
    while (fgets(line, MAXCHAR, csv_file)) {
        //Use above function to parse the line
        int timestep = parse_csv_line(line, &simulation_data[actual_timesteps], MAX_BODIES);
        if (timestep < 0) {
            fprintf(stderr, "Error parsing line: %s", line);
            continue;
        }

        // When reading the first line, theres a special case to populate num_bodies
        if (timestep == 0) {
            printf("Detected %d bodies in the simulation\n", simulation_data[0].num_bodies);
        } else {
            //Bodies stay the same for each timestep
            simulation_data[actual_timesteps].num_bodies = simulation_data[0].num_bodies;
        }

        actual_timesteps++;

    }

    fclose(csv_file);
    printf("Loaded %d timesteps with %d bodies\n", actual_timesteps, simulation_data[0].num_bodies);

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