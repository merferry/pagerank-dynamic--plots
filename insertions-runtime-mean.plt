set term pdf
set terminal pdf size 4in,3in
set output 'insertions-runtime-mean.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 45 right
set format x "10^{%L}"
set grid y
set key off


## Set line styles
set style line  1 linewidth 2 linetype 7 pointtype 5 dashtype 1
set style line  2 linewidth 2 linetype 6 pointtype 9 dashtype 1
set style line  3 linewidth 2 linetype 1 pointtype 2 dashtype 1
set style line  4 linewidth 2 linetype 8 pointtype 3 dashtype 1


## Draw plot
set logscale x 10
set logscale y 10
set xlabel  '{/:Bold Batch fraction}'
set ylabel  '{/:Bold Runtime (s)}'
plot 'insertions.csv' \
     using 4:($5 /1000) title 'Static'        linestyle  1 with linespoints, \
  '' using 4:($7 /1000) title 'Naive-dyn'     linestyle  2 with linespoints, \
  '' using 4:($9 /1000) title 'Dyn Traversal' linestyle  3 with linespoints, \
  '' using 4:($11/1000) title 'Dyn Frontier'  linestyle  4 with linespoints, \
  '' using 4:($5 /1000):($4==1e-7? sprintf("%.1f", $5 /1000) : "") with labels notitle offset character 2.2,character 0.6 textcolor linetype 7, \
  '' using 4:($5 /1000):($4>=1e-6 && $4 <1e-2? sprintf("%.1f", $5 /1000) : "") with labels notitle offset character -1.2,character 0.8 textcolor linetype 7, \
  '' using 4:($7 /1000):($4==1e-7? sprintf("%.1f", $7 /1000) : "") with labels notitle offset character 2.2,character -0.6 textcolor linetype 6, \
  '' using 4:($7 /1000):($4>=1e-6 && $4 <1e-3? sprintf("%.1f", $7 /1000) : "") with labels notitle offset character -1.2,character -0.6 textcolor linetype 6, \
  '' using 4:($7 /1000):($4==1e-2? sprintf("%.1f", $7 /1000) : "") with labels notitle offset character -1.2,character -0.6 textcolor linetype 6, \
  '' using 4:($7 /1000):($4==1e-1? sprintf("%.1f", $7 /1000) : "") with labels notitle offset character -2.2,character -0.6 textcolor linetype 6, \
  '' using 4:($9 /1000):($4==1e-7? sprintf("%.1f", $9 /1000) : "") with labels notitle offset character 2.2,character 0.6 textcolor linetype 1, \
  '' using 4:($9 /1000):($4>=1e-6 && $4 <1e-3? sprintf("%.1f", $9 /1000) : "") with labels notitle offset character -1.2,character 0.6 textcolor linetype 1, \
  '' using 4:($9 /1000):($4==1e-2? sprintf("%.1f", $9 /1000) : "") with labels notitle offset character -1.2,character 1.6 textcolor linetype 1, \
  '' using 4:($9 /1000):($4==1e-1? sprintf("%.1f", $9 /1000) : "") with labels notitle offset character -2.2,character 0.4 textcolor linetype 1, \
  '' using 4:($11/1000):($4 <1e-2? sprintf("%.1f", $11/1000) : "") with labels notitle offset character 2.2,character -0.4 textcolor linetype 8, \
  '' using 4:($11/1000):($4==1e-2? sprintf("%.1f", $11/1000) : "") with labels notitle offset character -2.2,character 1.2 textcolor linetype 8, \
  '' using 4:($11/1000):($4==1e-1? sprintf("%.1f", $11/1000) : "") with labels notitle offset character -2.4,character 0.6 textcolor linetype 8




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
