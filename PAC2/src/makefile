CC = gcc
CFLAGS = -Wall -fopenmp -std=c99

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

study_3 : parallel_sum parallel_sum.sge process_data.py plot_results_mm.gnu plot_results_mm2.gnu mm mm2
	bash get_data.sh
	bash wait_jobs.sh
	python process_data.py
	/share/apps/gnuplot/bin/gnuplot plot_results_mm.gnu
	/share/apps/gnuplot/bin/gnuplot plot_results_mm2.gnu

q9_parallel : q9_parallel.c
	$(CC) $(CFLAGS) -o q9_parallel q9_parallel.c

run_q9_parallel : q9_parallel
	time ./q9_parallel

q9 : q9.c
	$(CC) $(CFLAGS) -o q9 q9.c

run_q9 : q9
	time ./q9

mm : mm.c
	gcc mm.c -o mm

mm2 : mm2.c
	gcc mm2.c -o mm2

.PHONY : clean
clean :
	rm -f parallel_sum job*.sge mm*.txt omp.out. omp.out.* q9_parallel q9