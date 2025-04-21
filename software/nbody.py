import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib.animation import FuncAnimation


def getA(R, G, M, N):
    """Calculate acceleration using 32-bit float precision"""
    # Initialize arrays with np.float32 data type
    A = np.zeros((N, 2), dtype=np.float32)
    F = np.zeros((N, 2), dtype=np.float32)
    
    for i in range(N):
        for j in range(N):
            if i != j:
                # Direction should be FROM i TO j, so (R[j] - R[i])
                r_ij = R[j].astype(np.float32) - R[i].astype(np.float32)
                distance = np.float32(np.linalg.norm(r_ij))
                
                # Avoid division by zero or very small numbers
                if distance < np.float32(0.001):
                    distance = np.float32(0.001)
                
                # Force calculation with explicit float32 conversion
                force_scalar = np.float32(G * M[i, 0] * M[j, 0]) / np.float32(distance**3)
                force_vector = r_ij * force_scalar
                F[i] += force_vector.astype(np.float32)

        # F = ma, so a = F/m - ensure 32-bit floats
        A[i] = (F[i] / np.float32(M[i, 0])).astype(np.float32)

    return A


def main(N, T=np.float32(10.0), dt=np.float32(0.01), t0=np.float32(0.0)):
    """Main simulation function using 32-bit floats"""
    timestep = 0
    
    # Calculate number of timesteps
    num_timesteps = int(T/dt) + 1
    
    # Initialize arrays with float32 data type
    positions = np.zeros((num_timesteps, N, 2), dtype=np.float32)
    velocities = np.zeros((num_timesteps, N, 2), dtype=np.float32)
    accelerations = np.zeros((num_timesteps, N, 2), dtype=np.float32)

    G = np.float32(10.0)
    R = np.zeros((N, 2), dtype=np.float32)  # Position vectors
    V = np.zeros((N, 2), dtype=np.float32)  # Velocity vectors
    M = np.ones((N, 1), dtype=np.float32)   # Mass values

    # Randomly initialize parameters with float32
    R = np.random.uniform(-50, 50, (N, 2)).astype(np.float32)
    V = np.random.uniform(-5, 5, (N, 2)).astype(np.float32)
    M = np.random.uniform(1, 20, (N, 1)).astype(np.float32)
    
    print("Initialized bodies with random parameters (32-bit float):")
    for i in range(N):
        print(f"Body #{i+1} - Position: ({R[i,0]:.2f}, {R[i,1]:.2f}), "
              f"Velocity: ({V[i,0]:.2f}, {V[i,1]:.2f}), Mass: {M[i,0]:.2f}")
    
    # Get initial acceleration
    A = getA(R, G, M, N)

    # Setup visualization
    fig, ax = plt.subplots()
    scatter = ax.scatter(R[:,0], R[:,1], c='blue', s=M[:,0]*5, alpha=0.7)
    
    ax.set_xlim(-100, 100)
    ax.set_ylim(-100, 100)
    ax.set_title(f"N-body Simulation with {N} Bodies (32-bit float)")
    
    # Add info text
    info_text = ax.text(-95, 90, f"Time: {t0:.2f}", fontsize=10)
    
    # Main simulation loop
    while t0 < T:
        # Store current state
        positions[timestep] = R
        velocities[timestep] = V
        accelerations[timestep] = A
        
        # Update visualization
        scatter.set_offsets(R)
        info_text.set_text(f"Time: {t0:.2f}")
        plt.pause(0.01)
        
        # Velocity Verlet integration with explicit float32 conversions
        V += (A * np.float32(dt/2)).astype(np.float32)  # v(i+1/2) = v(i) + a(i)*dt/2
        R += (V * np.float32(dt)).astype(np.float32)    # x(i+1) = x(i) + v(i+1/2)*dt
        A = getA(R, G, M, N)                           # Calculate a(i+1)
        V += (A * np.float32(dt/2)).astype(np.float32)  # v(i+1) = v(i+1/2) + a(i+1)*dt/2

        t0 += dt
        timestep += 1

    plt.close()
    
    # Generate histograms after simulation completes
    create_histograms(positions, velocities, accelerations)


def create_histograms(positions, velocities, accelerations):
    """Create histograms for position, velocity and acceleration components with improved ranges"""
    # Flatten the data across all bodies and timesteps
    x_pos = positions[:,:,0].flatten()
    y_pos = positions[:,:,1].flatten()
    
    x_vel = velocities[:,:,0].flatten()
    y_vel = velocities[:,:,1].flatten()
    
    x_acc = accelerations[:,:,0].flatten()
    y_acc = accelerations[:,:,1].flatten()
    
    # Create a 2x3 grid of subplots for the histograms
    fig, axes = plt.subplots(2, 3, figsize=(15, 10))
    fig.suptitle('Distribution of Position, Velocity, and Acceleration Values (32-bit float)', fontsize=16)
    
    # Set up histogram parameters
    bins = 50
    alpha = 0.7
    
    # Function to calculate smart range based on percentiles
    def get_range(data, percentile=99):
        lower = np.percentile(data, 100-percentile)
        upper = np.percentile(data, percentile)
        # Add a bit of padding
        padding = np.float32((upper - lower) * 0.1)
        return lower - padding, upper + padding
    
    # Plot histograms with better ranges
    # X Position
    x_pos_range = get_range(x_pos)
    axes[0, 0].hist(x_pos, bins=bins, alpha=alpha, color='blue', range=x_pos_range)
    axes[0, 0].set_title('X Position')
    axes[0, 0].set_xlabel('Value')
    axes[0, 0].set_ylabel('Frequency')
    
    # X Velocity
    x_vel_range = get_range(x_vel)
    axes[0, 1].hist(x_vel, bins=bins, alpha=alpha, color='green', range=x_vel_range)
    axes[0, 1].set_title('X Velocity')
    axes[0, 1].set_xlabel('Value')
    axes[0, 1].set_ylabel('Frequency')
    
    # X Acceleration
    x_acc_range = get_range(x_acc)
    axes[0, 2].hist(x_acc, bins=bins, alpha=alpha, color='red', range=x_acc_range)
    axes[0, 2].set_title('X Acceleration')
    axes[0, 2].set_xlabel('Value')
    axes[0, 2].set_ylabel('Frequency')
    
    # Y Position
    y_pos_range = get_range(y_pos)
    axes[1, 0].hist(y_pos, bins=bins, alpha=alpha, color='blue', range=y_pos_range)
    axes[1, 0].set_title('Y Position')
    axes[1, 0].set_xlabel('Value')
    axes[1, 0].set_ylabel('Frequency')
    
    # Y Velocity
    y_vel_range = get_range(y_vel)
    axes[1, 1].hist(y_vel, bins=bins, alpha=alpha, color='green', range=y_vel_range)
    axes[1, 1].set_title('Y Velocity')
    axes[1, 1].set_xlabel('Value')
    axes[1, 1].set_ylabel('Frequency')
    
    # Y Acceleration
    y_acc_range = get_range(y_acc)
    axes[1, 2].hist(y_acc, bins=bins, alpha=alpha, color='red', range=y_acc_range)
    axes[1, 2].set_title('Y Acceleration')
    axes[1, 2].set_xlabel('Value')
    axes[1, 2].set_ylabel('Frequency')
    
    # Print ranges for each parameter
    print("\nValue Ranges (Full Data - 32-bit float):")
    print(f"X Position: [{np.min(x_pos):.2f}, {np.max(x_pos):.2f}]")
    print(f"Y Position: [{np.min(y_pos):.2f}, {np.max(y_pos):.2f}]")
    print(f"X Velocity: [{np.min(x_vel):.2f}, {np.max(x_vel):.2f}]")
    print(f"Y Velocity: [{np.min(y_vel):.2f}, {np.max(y_vel):.2f}]")
    print(f"X Acceleration: [{np.min(x_acc):.2f}, {np.max(x_acc):.2f}]")
    print(f"Y Acceleration: [{np.min(y_acc):.2f}, {np.max(y_acc):.2f}]")
    
    print("\nHistogram Display Ranges (99th percentiles):")
    print(f"X Position: [{x_pos_range[0]:.2f}, {x_pos_range[1]:.2f}]")
    print(f"Y Position: [{y_pos_range[0]:.2f}, {y_pos_range[1]:.2f}]")
    print(f"X Velocity: [{x_vel_range[0]:.2f}, {x_vel_range[1]:.2f}]")
    print(f"Y Velocity: [{y_vel_range[0]:.2f}, {y_vel_range[1]:.2f}]")
    print(f"X Acceleration: [{x_acc_range[0]:.2f}, {x_acc_range[1]:.2f}]")
    print(f"Y Acceleration: [{y_acc_range[0]:.2f}, {y_acc_range[1]:.2f}]")
    
    # Add percentage of data shown in each histogram
    for i, (ax, data, data_range) in enumerate(zip(
            [axes[0, 0], axes[0, 1], axes[0, 2], axes[1, 0], axes[1, 1], axes[1, 2]],
            [x_pos, x_vel, x_acc, y_pos, y_vel, y_acc],
            [x_pos_range, x_vel_range, x_acc_range, y_pos_range, y_vel_range, y_acc_range]
        )):
        shown_data = data[(data >= data_range[0]) & (data <= data_range[1])]
        percentage = len(shown_data) / len(data) * 100
        ax.annotate(f"Showing {percentage:.1f}% of data", xy=(0.05, 0.95), xycoords='axes fraction',
                    fontsize=8, ha='left', va='top', bbox=dict(boxstyle='round', fc='white', alpha=0.8))
    
    plt.tight_layout()
    plt.show()

    # Add a new visualization to show float32 precision effects
    plot_precision_effects(positions, velocities, accelerations)

def plot_precision_effects(positions, velocities, accelerations):
    """Create plots to visualize the effects of float32 precision"""
    # Take the last 20% of data for analysis
    start_idx = int(positions.shape[0] * 0.8)
    
    # Get position differences between timesteps
    pos_diffs = positions[1:] - positions[:-1]
    pos_diffs_magnitude = np.sqrt(pos_diffs[:,:,0]**2 + pos_diffs[:,:,1]**2)
    
    # Get velocity differences between timesteps
    vel_diffs = velocities[1:] - velocities[:-1]
    vel_diffs_magnitude = np.sqrt(vel_diffs[:,:,0]**2 + vel_diffs[:,:,1]**2)
    
    # Create figure for precision analysis
    fig, axes = plt.subplots(2, 1, figsize=(12, 10))
    fig.suptitle('32-bit Float Precision Effects', fontsize=16)
    
    # Plot position differences
    for i in range(pos_diffs_magnitude.shape[1]):  # For each body
        axes[0].plot(pos_diffs_magnitude[-100:, i], label=f"Body {i+1}")
    
    axes[0].set_title('Position Change Between Timesteps (Last 100)')
    axes[0].set_xlabel('Timestep')
    axes[0].set_ylabel('Position Change Magnitude')
    axes[0].legend()
    axes[0].grid(True)
    
    # Plot velocity differences
    for i in range(vel_diffs_magnitude.shape[1]):  # For each body
        axes[1].plot(vel_diffs_magnitude[-100:, i], label=f"Body {i+1}")
    
    axes[1].set_title('Velocity Change Between Timesteps (Last 100)')
    axes[1].set_xlabel('Timestep')
    axes[1].set_ylabel('Velocity Change Magnitude')
    axes[1].legend()
    axes[1].grid(True)
    
    plt.tight_layout()
    plt.show()


if __name__ == "__main__":
    # Get only the number of bodies as input
    try:
        n_bodies = int(input("Enter number of bodies to simulate: "))
        if n_bodies < 1:
            print("Number of bodies must be at least 1. Using default of 5.")
            n_bodies = 5
    except ValueError:
        print("Invalid input. Using default of 5 bodies.")
        n_bodies = 5
        
    main(n_bodies)
