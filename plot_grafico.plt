clear
reset
set colorbox vertical origin screen 0.9, 0.2, 0 size screen 0.05, 0.6, 0 front  noinvert bdefault
set fit brief errorvariables nocovariancevariables errorscaling noprescale nowrap v5

# Estilo dos pontos
set style circle radius graph 0.005, first 0.00000, 0.00000 

# Desenho eixo horizontal
set xzeroaxis

# Auto escala
set autoscale

# Definicao de titulos
set title "Gráfico DSP" font ",20"
set key below
set samples 50
set style data points

# Estilizacao das linhas
set style line 5 lt rgb "black" lw 3 pt 7
set style line 6 lt rgb "red" lw 1 pt 7
set style line 7 lt rgb "blue" lw 1 pt 7

# Definicao de variaveis
style1 = "lines lt 4 lw 1"
style2 = "points lt 3 pt 8 ps 2"
range1 = "using 1:2"
range2 = "using 1:3"

# Configuracao da data
print strftime("%H:%M:%.3S %d-%b-%Y",time(0.0))

# The wxt terminal is the default, but we need to turn on
# the enhanced feature in order to get the Greek symbols.
set terminal wxt enhanced


plot "grafico.txt" @range1 with circle ls 5 title 'amostras'
replot "grafico.txt" @range2 with points ls 7 title 'quantizado'
replot "funcao.txt" @range1 with lines ls 6 title 'funcao' #ls é o line style 

#replot [0:6] "grafico.txt" notitle with histeps
#replot "funcao.txt" using 1:2 with boxes
#replot "grafico.txt" using 1:5 with boxes title 'nível de quantização'

# Exportar imagem
#set terminal png
#set output "grafico.png"
#replot
pause -1 "Grafico gerado com sucesso!"

