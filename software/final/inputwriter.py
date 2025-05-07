import csv
import random


def write_input(j):
    f = open("input.csv",'w')
    writer = csv.writer(f)
    for i in range(j):
        x = random.randint(-100,100)
        y = random.randint(-100,100)
        vx = random.randint(-5,5)
        vy = random.randint(-5,5)
        m = random.randint(10,100)
        row = (x,y,vx,vy,m)
        writer.writerow(row)
    f.close()

write_input(512)
