import random
import math

def create_solar_system():
    bodies = []
    
    # Sun at the center with large mass
    bodies.append([0, 0, 0, 0, 1000.0])
    
    # Mercury
    bodies.append([20, 0, 0, 2.0, 3.3])
    
    # Venus
    bodies.append([35, 0, 0, 1.6, 48.7])
    
    # Earth
    bodies.append([50, 0, 0, 1.4, 60.0])
    
    # Mars
    bodies.append([75, 0, 0, 1.1, 6.4])
    
    # Jupiter
    bodies.append([250, 0, 0, 0.6, 190.0])
    
    # Saturn
    bodies.append([450, 0, 0, 0.4, 95.0])
    
    # Uranus
    bodies.append([900, 0, 0, 0.3, 14.5])
    
    # Neptune
    bodies.append([1400, 0, 0, 0.25, 17.1])
    
    # Fill remaining slots with zeros
    for i in range(23):
        bodies.append([0, 0, 0, 0, 0])
    
    # Write to CSV
    with open("input.csv", "w") as f:
        for body in bodies:
            f.write(f"{body[0]},{body[1]},{body[2]},{body[3]},{body[4]}\n")

create_solar_system()