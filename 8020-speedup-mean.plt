set term pdf
set terminal pdf size 4in,3.6in
set output '8020-speedup-mean.pdf'


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
# set logscale y 10
set xlabel  '{/:Bold Batch fraction}'
set ylabel  '{/:Bold Speedup}'
plot '8020.csv' \
     using 4:($5 /$11) title 'Static'            linestyle  1 with linespoints, \
  '' using 4:($7 /$11) title 'Naive-dynamic'     linestyle  2 with linespoints, \
  '' using 4:($9 /$11) title 'Dynamic Traversal' linestyle  3 with linespoints, \
  '' using 4:($5 /$11):($4==1e-7? sprintf("%.1f", $5 /$11) : "") with labels notitle offset character 2.8,character -0.6 textcolor linetype 7, \
  '' using 4:($5 /$11):($4==1e-6? sprintf("%.1f", $5 /$11) : "") with labels notitle offset character 2.8,character 0 textcolor linetype 7, \
  '' using 4:($5 /$11):($4==1e-5? sprintf("%.1f", $5 /$11) : "") with labels notitle offset character 2.8,character 0 textcolor linetype 7, \
  '' using 4:($5 /$11):($4>=1e-4 && $4 <1e-3? sprintf("%.1f", $5 /$11) : "") with labels notitle offset character 0,character 0.8 textcolor linetype 7, \
  '' using 4:($9 /$11):($4>=1e-3 && $4 <1e-2? sprintf("%.1f", $5 /$11) : "") with labels notitle offset character 0,character 3.0 textcolor linetype 7, \
  '' using 4:($5 /$11):($4==1e-2? sprintf("%.1f", $5 /$11) : "") with labels notitle offset character 2.0,character 0.5 textcolor linetype 7, \
  '' using 4:($5 /$11):($4==1e-1? sprintf("%.1f", $5 /$11) : "") with labels notitle offset character -1.4,character 0.8 textcolor linetype 7, \
  '' using 4:($7 /$11):($4==1e-7? sprintf("%.1f", $7 /$11) : "") with labels notitle offset character 2.2,character -0.6 textcolor linetype 6, \
  '' using 4:($7 /$11):($4>=1e-6 && $4 <1e-3? sprintf("%.1f", $7 /$11) : "") with labels notitle offset character -1.2,character -0.6 textcolor linetype 6, \
  '' using 4:($9 /$11):($4>=1e-3 && $4 <1e-2? sprintf("%.1f", $7 /$11) : "") with labels notitle offset character 0,character 1.0 textcolor linetype 6, \
  '' using 4:($9 /$11):($4==1e-7? sprintf("%.1f", $9 /$11) : "") with labels notitle offset character 1.8,character 0.6 textcolor linetype 1, \
  '' using 4:($9 /$11):($4==1e-6? sprintf("%.1f", $9 /$11) : "") with labels notitle offset character 0.6,character 0.7 textcolor linetype 1, \
  '' using 4:($9 /$11):($4>=1e-5 && $4 <1e-3? sprintf("%.1f", $9 /$11) : "") with labels notitle offset character -0.6,character 0.6 textcolor linetype 1, \
  '' using 4:($9 /$11):($4>=1e-3 && $4 <1e-2? sprintf("%.1f", $9 /$11) : "") with labels notitle offset character 0,character 2.0 textcolor linetype 1, \
  '' using 4:($9 /$11):($4==1e-2? sprintf("%.1f", $9 /$11) : "") with labels notitle offset character 0,character 0.8 textcolor linetype 1, \
  '' using 4:($9 /$11):($4==1e-1? sprintf("%.1f", $9 /$11) : "") with labels notitle offset character -2.0,character 0.3 textcolor linetype 1




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
