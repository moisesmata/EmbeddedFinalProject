import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib.animation import FuncAnimation
import csv

def getA(R,M,N):
    A = np.zeros((N,2))
    F = np.zeros((N,2))

    for i in range(N):
        for j in range(N):
            if i != j: #needed to make sure we do not calculate infinite force between the same object
                #print(np.linalg.norm((R[i]-R[j]))**3)
                F[i] +=  1 * (M[j] * (R[i] - R[j]) / (np.linalg.norm((R[i]-R[j])))**3)

        A[i] = -1 * F[i]

    return A

#N is the number of bodies, T is the total time, dt is the timestep
def main(N,total_time, dt = 2, gap = 2):

    gapstep = 0
    positions = np.zeros((int(total_time/dt)+1, N,2))

    R = np.zeros((N,2)) #Array of position vectors
    V = np.zeros((N,2)) #Array of velocity vectors
    M = np.ones((N,1)) #Array of masses

    #Initialize starting parameters
    with open('input.csv','r') as file:
        csv_reader = csv.reader(file)
        i = 0
        for row in csv_reader:
            #print(row)
            x, y, vx, vy, m = row
            R[i,0] = x
            R[i,1] = y
            V[i,0] = vx
            V[i,1] = vy
            M[i,0] = m
            i += 1

    #Get the initial acceleration:
    
    A = getA(R,M,N)

    fig, ax = plt.subplots()
    line, = ax.plot([], [], 'bo')  # blue line with circle markers

    ax.set_xlim(-100, 100)
    ax.set_ylim(-100, 100)
    print(f"Gapstep: 0, time: 0, positions:\n {R}")

    first = True
    t = 0
    while t < total_time:
        gapstep += 1
        positions[gapstep] = R

        line.set_data(positions[gapstep,:,0], positions[gapstep,:,1])
        plt.pause(0.01)

        if first:
            V += A * dt/2 # Calculate v i+1/2
            first = False
        else:
            V += A * dt

        R += V * dt # Calculate x i+1
        A = getA(R,M,N) # Calculate a i+1

        t += dt
        if gapstep % gap == 0:
            print(f"Gapstep: {int(gapstep/gap)}, time: {t}, positions: \n{R}")
        
    plt.show()
    #print(csv_output[0])


main(3, 10)
