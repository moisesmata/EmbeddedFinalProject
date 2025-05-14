import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib.animation import FuncAnimation
import csv

def updateV(R,M,N,V,first = False):
    for i in range(N):
        for j in range(N):
            if i != j:
                dx = R[i,0] - R[j,0]
                dy = R[i,1] - R[j,1] 

                dx2 = dx**2
                dy2 = dy**2

                r2 = dx2 + dy2
                r = (1/np.sqrt(r2))**3

                if first:
                    f = r*M[i]/2
                else:
                    f = r*M[i]

                #print(f"Intermediaries i: {i}, j: {j}, r2: {r2}, r: {r}, f: {f}, dvx: {dx*f}, dvy: {dy*f}")

                vx = V[j,0] + dx*f

                vy = V[j,1] + dy*f

                V[j,0] =  vx
                V[j,1] =  vy

                #print(V[j])
    
#N is the number of bodies, T is the total time, dt is the timestep
def main(N,total_time, dt = 1, gap = 500):

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
    
    updateV(R,M,N,V,True) #updates velocities
    print(f"Velocities: \n{V}")

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
 
        R += V * dt #update positions
        updateV(R,M,N,V,False) #update velocities

        #print(f"Velocities: \n{V}")

        t += dt
        if gapstep % gap == 0:
            print(f"Gapstep: {int(gapstep/gap)}, time: {t}, positions: \n{R}")
        
    plt.show()
    #print(csv_output[0])


main(3, 600)
