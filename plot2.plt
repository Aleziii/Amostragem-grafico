
# Clear any previous plots.
clear

# Reset all plotting variables to their default values.
reset
set colorbox vertical origin screen 0.9, 0.2, 0 size screen 0.05, 0.6, 0 front  noinvert bdefault
set fit brief errorvariables nocovariancevariables errorscaling noprescale nowrap v5

# We don't need a key (or legend) for this simple graph.
set key off

#Estilo dos pontos
set style circle radius graph 0.005, first 0.00000, 0.00000 

# 6.18 e equivalente a 2*PI
#set xrange [0:6.28]


# Set the tick-marks for the X-axis. Use the Postscript
# symbol for Pi.
#set xtics ("0" 0,"0.5{/Symbol p}" pi/2, "{/Symbol p}" pi, \
#	"1.5{/Symbol p}" 1.5*pi, "2{/Symbol p}" 2*pi)

# Desenho eixo horizontal
set xzeroaxis

# Amplitude
set yrange [-1:1]

# No tick-marks are needed for the Y-axis .
unset ytics

# The wxt terminal is the default, but we need to turn on
# the enhanced feature in order to get the Greek symbols.
set terminal wxt enhanced


set xrange [-2*pi:2*pi]

plot "grafico.txt" using 1:2 with circle  title 'amostragem'
set xlabel 'xlabel'

replot "grafico.txt" using 1:5 with boxes title 'nível de quantização'


#Teste
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
