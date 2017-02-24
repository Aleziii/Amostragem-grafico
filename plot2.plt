
# Clear any previous plots.
clear

# Reset all plotting variables to their default values.
reset
set colorbox vertical origin screen 0.9, 0.2, 0 size screen 0.05, 0.6, 0 front  noinvert bdefault
set fit brief errorvariables nocovariancevariables errorscaling noprescale nowrap v5

# We don't need a key (or legend) for this simple graph.
#set key off

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
#set yrange [-1:1]

# No tick-marks are needed for the Y-axis .
#unset ytics

# The wxt terminal is the default, but we need to turn on
# the enhanced feature in order to get the Greek symbols.
set terminal wxt enhanced


#set xrange [-2*pi:2*pi]

#Estilizacao das linhas
set style line 5 lt rgb "cyan" lw 3 pt 6
set style line 6 lt rgb "red" lw 2 pt 6

plot "grafico.txt" using 1:2 with circle  title 'amostragem'
replot "funcao.txt" using 1:2 with lines ls 6 #ls é o line style
#replot "funcao.txt" using 1:2 with boxes
set xlabel 'xlabel'

set title "Simple Plots" font ",20"
set key left box
set samples 50
set style data points

plot [-10:10] sin(x),atan(x),cos(atan(x))

#replot "grafico.txt" using 1:5 with boxes title 'nível de quantização'

