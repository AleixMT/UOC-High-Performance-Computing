CC = gcc
CFLAGS = -Wall -fopenmp

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

study_3 : parallel_sum parallel_sum.sge process_data.py plot_results_mm.gnu plot_results_mm2.gnu
	bash get_data.sh
	bash wait_jobs.sh
	python process_data.py
	/share/apps/gnuplot/bin/gnuplot plot_results_mm.gnu
	/share/apps/gnuplot/bin/gnuplot plot_results_mm2.gnu

.PHONY : clean
clean :
	rm -f parallel_sum