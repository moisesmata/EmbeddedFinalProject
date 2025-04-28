CFLAGS = -Wall

OBJECTS = nbody.o fbputchar.o 

nbody: $(OBJECTS)
	cc $(CFLAGS) -o nbody $(OBJECTS) -pthread -lm

nbody.o : nbody.c fbputchar.h
fbputchar.o : fbputchar.c fbputchar.h

.PHONY : clean
clean :
	rm -rf *.o nbody
