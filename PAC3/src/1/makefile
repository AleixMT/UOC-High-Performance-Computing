CC = gcc
CFLAGS = -Wall -fopenmp -std=c99

hello : hello.c
	mpicc hello.c -o hello

run : hello hello2.sge


.PHONY : clean
clean :
	rm -f hello