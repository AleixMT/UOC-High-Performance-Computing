CC = gcc
CFLAGS = -O3 -Wall -fopenmp

all : parallel_sum

parallel_sum : parallel_sum.c
	$(CC) $(CFLAGS) -o parallel_sum parallel_sum.c

run : parallel_sum
	@echo "Parallel run"
	@time ./parallel_sum
	@echo "Sequential run"
	@time ./parallel_sum

run_cluster : parallel_sum.sge parallel_sum
	qsub parallel_sum.sge

.PHONY : clean
clean :
	rm -f parallel_sum