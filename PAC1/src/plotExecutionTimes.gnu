set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 600, 400 
set output 'executionTimes.png'
set title "App execution time by array dimension"
set style fill solid 0.5
set style line 1 lc rgb '#404040' lw 1
set xlabel "Array dimension (double)"
set ylabel "Execution time (seconds)"
set style fill solid
set boxwidth 0.8
set boxwidth 0.9
set style fill solid 1.00 border 0
set style histogram errorbars gap 2 lw 1
set style data histograms
set xtics rotate by -45
set bars 0.5

set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb "white" behind

plot "results.csv" using 2:3:xtic(1) lc 'gray70' notitle, \

