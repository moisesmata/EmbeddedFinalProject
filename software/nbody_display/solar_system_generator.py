import random
import math

def create_solar_system():
    bodies = []
    
    # Sun at the center with large mass
    bodies.append([0, 0, 0, 0, 10.000])
    
    # Mercury
    bodies.append([20, 0, 0, 2.0, .0033])
    
    # Venus
    bodies.append([35, 0, 0, 1.6, .0487])
    
    # Earth
    bodies.append([50, 0, 0, 1.4, .0600])
    
    # Mars
    bodies.append([75, 0, 0, 1.1, .0064])
    
    # Jupiter
    bodies.append([250, 0, 0, 0.6, .1900])
    
    # Saturn
    bodies.append([450, 0, 0, 0.4, .0950])
    
    # Uranus
    bodies.append([900, 0, 0, 0.3, .0145])
    
    # Neptune
    bodies.append([1400, 0, 0, 0.25, .0171])
    
    # Write to CSV
    with open("input.csv", "w") as f:
        for body in bodies:
            f.write(f"{body[0]},{body[1]},{body[2]},{body[3]},{body[4]}\n")

create_solar_system()