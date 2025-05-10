#!/usr/bin/env python3

"""
N-body simulation CSV generator
Creates a sample CSV file for testing the display.c program
"""

import numpy as np
import csv

# Simulation parameters
num_bodies = 100
num_timesteps = 100
dt = 0.1  # Time step size
G = 6.67430e-11  # Gravitational constant
softening = 5.0  # Softening parameter to avoid singularities

# Output file
csv_filename = "nbody_results.csv"

# Create a simple class to represent bodies
class Body:
    def __init__(self, id, mass, x, y, vx, vy):
        self.id = id
        self.mass = mass
        self.x = x
        self.y = y
        self.vx = vx
        self.vy = vy
    
    def update_position(self, dt):
        self.x += self.vx * dt
        self.y += self.vy * dt
    
    def update_velocity(self, ax, ay, dt):
        self.vx += ax * dt
        self.vy += ay * dt
    
    def as_dict(self, timestep):
        return {
            'timestep': timestep,
            'body_id': self.id,
            'x': self.x,
            'y': self.y
        }

def compute_forces(bodies):
    """Compute gravitational forces between all bodies"""
    ax = np.zeros(num_bodies)
    ay = np.zeros(num_bodies)
    
    # Calculate pairwise gravitational forces
    for i in range(num_bodies):
        for j in range(num_bodies):
            if i != j:
                dx = bodies[j].x - bodies[i].x
                dy = bodies[j].y - bodies[i].y
                
                # Distance with softening to avoid numerical issues
                dist = np.sqrt(dx**2 + dy**2 + softening**2)
                
                # Force magnitude (F = G*m1*m2/r^2)
                # We divide by bodies[i].mass to get acceleration directly
                F = G * bodies[j].mass / (dist**2)
                
                # Components of acceleration
                ax[i] += F * dx / dist
                ay[i] += F * dy / dist
    
    return ax, ay

def initialize_bodies():
    """Create random initial conditions for bodies"""
    bodies = []
    
    # Create a large central body
    bodies.append(Body(
        id=0, 
        mass=1.0e10,
        x=0.0,
        y=0.0,
        vx=0.0,
        vy=0.0
    ))
    
    # Create orbiting bodies
    for i in range(1, num_bodies):
        # Random distance from center (50-400 units)
        distance = 50 + np.random.rand() * 350
        
        # Random angle
        angle = np.random.rand() * 2 * np.pi
        
        # Position based on polar coordinates
        x = distance * np.cos(angle)
        y = distance * np.sin(angle)
        
        # Velocity for circular orbit (perpendicular to position vector)
        # v = sqrt(G*M/r) for circular orbit
        orbit_speed = np.sqrt(G * bodies[0].mass / distance) * 0.8
        
        # Perpendicular velocity components
        vx = orbit_speed * np.sin(angle) 
        vy = -orbit_speed * np.cos(angle)
        
        # Add random perturbations
        vx += (np.random.rand() - 0.5) * 10
        vy += (np.random.rand() - 0.5) * 10
        
        # Create the body
        bodies.append(Body(
            id=i,
            mass=1.0e6 + np.random.rand() * 1.0e7,
            x=x,
            y=y,
            vx=vx,
            vy=vy
        ))
    
    return bodies

def run_simulation():
    """Run the N-body simulation and save results to CSV"""
    print("Initializing bodies...")
    bodies = initialize_bodies()
    
    # Store simulation results
    results = []
    
    # Store initial state
    initial_state = {'timestep': 0}
    for body in bodies:
        initial_state[f'body{body.id}_x'] = body.x
        initial_state[f'body{body.id}_y'] = body.y
    results.append(initial_state)
    
    # Run simulation for specified number of timesteps
    for timestep in range(1, num_timesteps):
        if timestep % 10 == 0:
            print(f"Computing timestep {timestep}/{num_timesteps-1}")
        
        # Compute forces
        ax, ay = compute_forces(bodies)
        
        # Update velocities and positions
        timestep_data = {'timestep': timestep}
        for i, body in enumerate(bodies):
            body.update_velocity(ax[i], ay[i], dt)
            body.update_position(dt)
            
            # Store the body's position in this timestep's data
            timestep_data[f'body{body.id}_x'] = body.x
            timestep_data[f'body{body.id}_y'] = body.y
        
        # Add this timestep to results
        results.append(timestep_data)
    
    # Write all data to CSV
    print(f"Writing simulation results to {csv_filename}")
    with open(csv_filename, 'w', newline='') as csvfile:
        # Get all field names from the first result
        fieldnames = list(results[0].keys())
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        
        # Write all rows
        for row in results:
            writer.writerow(row)
    
    print("Simulation complete!")

if __name__ == "__main__":
    run_simulation()
    print(f"CSV file '{csv_filename}' is ready for testing with display.c")