set term pdf
set terminal pdf size 4in,3in
set output 'insertions-runtime-mean.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 30 right
set key autotitle columnhead
set key above font ",12"
set ylabel  '{/:Bold Runtime (s)}'
set logscale y
set grid y
set format x "10^{%L}"


## Draw plot
plot "insertions.csv" \
     using ( $5/1000):xtic(4) title 'Static'            with histogram fill pattern 3, \
  '' using ( $7/1000):xtic(4) title 'Naive-dynamic'     with histogram fill pattern 3, \
  '' using ( $9/1000):xtic(4) title 'Dynamic Traversal' with histogram fill pattern 3, \
  '' using ($11/1000):xtic(4) title 'Dynamic Frontier'  with histogram fill pattern 3 ls 8, \
  '' using ($0-5.0/20):( $5/1000):(sprintf("%.0f",  $5/1000)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1 title '', \
  '' using ($0-1.5/20):( $7/1000):(sprintf("%.0f",  $7/1000)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1 title '', \
  '' using ($0+1.5/20):( $9/1000):(sprintf("%.0f",  $9/1000)) with labels rotate by 90 offset character 0,-1 title '', \
  '' using ($0+5.0/20):($11/1000):(sprintf("%.1f", $11/1000)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1 title ''
  # '' using 2 title '' ls 1 lw 3 with linespoints axes x1y2, \
  # '' using 4 title '' ls 2 lw 3 with linespoints axes x1y2, \
  # '' using 6 title '' ls 3 lw 3 with linespoints axes x1y2, \
  # '' using 9 title '' ls 4 lw 3 lc 0 with linespoints axes x1y2




## Columns in CSV file.
# 01. graph
# 02. vtraag-m
# 03. vtraag-t
# 04. vtraag-d
# 05. igraph-m
# 06. igraph-t
# 07. igraph-d
# 08. networkit-m
# 09. networkit-t
# 10. networkit-d
# 11. sahu-m
# 12. sahu-t
# 13. sahu-d
