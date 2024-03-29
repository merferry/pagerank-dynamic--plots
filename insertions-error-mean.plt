set term pdf
set terminal pdf size 4in,3.6in
set output 'insertions-error-mean.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 45 right
set format x "10^{%L}"
set grid y
set key above font ",12"


## Set line styles
set style line  1 linewidth 2 linetype 7 pointtype 5 dashtype 1
set style line  2 linewidth 2 linetype 6 pointtype 9 dashtype 1
set style line  3 linewidth 2 linetype 1 pointtype 2 dashtype 1
set style line  4 linewidth 2 linetype 8 pointtype 3 dashtype 1


## Draw plot
set logscale x 10
set logscale y 10
set xlabel  '{/:Bold Batch fraction}'
set ylabel  '{/:Bold Error}'
plot 'insertions.csv' \
     using 4:($13) title 'Static'            linestyle  1 with linespoints, \
  '' using 4:($15) title 'Naive-dynamic'     linestyle  2 with linespoints, \
  '' using 4:($17) title 'Dynamic Traversal' linestyle  3 with linespoints, \
  '' using 4:($19) title 'Dynamic Frontier'  linestyle  4 with linespoints




## Columns in CSV file.
# 01. graph
# 02. batch_deletions_fraction
# 03. batch_insertions_fraction
# 04. batch_fraction
# 05. sta-t
# 06. stap-t
# 07. nai-t
# 08. naip-t
# 09. tra-t
# 10. trap-t
# 11. fro-t
# 12. frop-t
# 13. sta-e
# 14. stap-e
# 15. nai-e
# 16. naip-e
# 17. tra-e
# 18. trap-e
# 19. fro-e
# 20. frop-e
