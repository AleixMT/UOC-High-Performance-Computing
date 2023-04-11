set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 600, 400 
set output 'errorbars1.png'
set title "error represented by yerrorbars"
set style data lines
set xlabel "Resistance [Ohm]" 
set ylabel "Power [W]" 
n(x)=1.53**2*x/(5.67+x)**2
plot [0:50] "data1000.txt" using 1:2:4 title "Execution time" with yerrorbars, n(x) t "Theory" with boxes
