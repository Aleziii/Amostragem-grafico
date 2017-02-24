 set datafile separator ","
 set datafile commentschars "!"
 unset logscale x
 #set logscale x
 set logscale y
 set grid
 # customise positions of labelled tics on the x and y axes

 set xtics add ("20" 20,"25" 25,"30" 30,"35" 35,"40" 40, "45" 45)
 set ytics add ("5" 5,"6" 6,"7" 7,"8" 8, "9" 9)

 set xlabel "Temperature (deg. C)"
 set ylabel "Transmitted intensity (arbitrary)"

 #f(x) = Amplitude*sin(Frequency*T+Phase)+ Offset
 f(x) = x*A*sin((F*x)+P) + O

 A=-1 ; # Amplitude of sinusoidal variation
 O=6 ; # Offset
 F=2 ; # Frequency
 P=3 ; # Phase

 fit f(x) "Data3.csv" using 1:2 via A,O,F,P

 plot [22:45][5:8.5] "Data3.csv" using 1:2, f(x)