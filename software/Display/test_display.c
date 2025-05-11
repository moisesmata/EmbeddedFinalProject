/*
 * Simple test program to verify VGA display functionality
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include "display_driver.h"

int main(int argc, char *argv[])
{
    int vga_fd;
    char cmd;
    
    // Open the VGA device
    vga_fd = open("/dev/vga_ball", O_RDWR);
    if (vga_fd < 0) {
        perror("Error: Could not open /dev/vga_ball");
        return -1;
    }
    
    printf("VGA Display Test Utility\n");
    printf("------------------------\n");
    printf("c - Clear screen (all pixels off)\n");
    printf("f - Fill screen (all pixels on)\n");
    printf("t - Toggle between fill and clear\n");
    printf("q - Quit\n\n");
    
    while (1) {
        printf("Enter command (c/f/t/q): ");
        scanf(" %c", &cmd);
        
        switch (cmd) {
            case 'c':
                printf("Clearing screen...\n");
                if (ioctl(vga_fd, VGA_BALL_CLEAR_SCREEN, 0) < 0) {
                    perror("ioctl(VGA_BALL_CLEAR_SCREEN) failed");
                }
                break;
                
            case 'f':
                printf("Filling screen (all pixels on)...\n");
                if (ioctl(vga_fd, VGA_BALL_FILL_SCREEN, 0) < 0) {
                    perror("ioctl(VGA_BALL_FILL_SCREEN) failed");
                }
                break;
                
            case 't':
                printf("Toggling screen...\n");
                printf("Filling screen...\n");
                if (ioctl(vga_fd, VGA_BALL_FILL_SCREEN, 0) < 0) {
                    perror("ioctl(VGA_BALL_FILL_SCREEN) failed");
                    break;
                }
                
                sleep(1);  // Wait 1 second
                
                printf("Clearing screen...\n");
                if (ioctl(vga_fd, VGA_BALL_CLEAR_SCREEN, 0) < 0) {
                    perror("ioctl(VGA_BALL_CLEAR_SCREEN) failed");
                }
                break;
                
            case 'q':
                printf("Exiting...\n");
                close(vga_fd);
                return 0;
                
            default:
                printf("Invalid command. Try again.\n");
                break;
        }
    }
    
    close(vga_fd);
    return 0;
}