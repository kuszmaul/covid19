#!/usr/bin/gnuplot -persist
#
#    
#    	G N U P L O T
#    	Version 5.2 patchlevel 8    last modified 2019-12-01 
#    
#    	Copyright (C) 1986-1993, 1998, 2004, 2007-2019
#    	Thomas Williams, Colin Kelley and many others
#    
#    	gnuplot home:     http://www.gnuplot.info
#    	faq, bugs, etc:   type "help FAQ"
#    	immediate help:   type "help"  (plot window: hit 'h')
# set terminal qt 0 font "Sans,9"
# set output
unset clip points
set clip one
unset clip two
set errorbars front 1.000000 
set border 31 front lt black linewidth 1.000 dashtype solid
set zdata 
set ydata 
set xdata 
set y2data 
set x2data 
set boxwidth
set style fill  empty border
set style rectangle back fc  bgnd fillstyle   solid 1.00 border lt -1
set style circle radius graph 0.02 
set style ellipse size graph 0.05, 0.03 angle 0 units xy
set dummy x, y
set format x "% h" 
set format y "% h" 
set format x2 "% h" 
set format y2 "% h" 
set format z "% h" 
set format cb "% h" 
set format r "% h" 
set ttics format "% h"
set timefmt "%d/%m/%y,%H:%M"
set angles radians
set tics back
unset grid
unset raxis
set theta counterclockwise right
set style parallel front  lt black linewidth 2.000 dashtype solid
set key title "" center
set key fixed right bottom vertical Right noreverse enhanced autotitle nobox
set key noinvert samplen 4 spacing 1 width 0 height 0 
set key maxcolumns 0 maxrows 0
set key noopaque
unset label
unset arrow
set style increment default
unset style line
unset style arrow
set style histogram clustered gap 2 title textcolor lt -1
unset object
set style textbox transparent margins  1.0,  1.0 border  lt -1 linewidth  1.0
set offsets 0, 0, 0, 0
set pointsize 1
set pointintervalbox 1
set encoding default
unset polar
unset parametric
unset decimalsign
unset micro
unset minussign
set view 60, 30, 1, 1
set view azimuth 0
set rgbmax 255
set samples 100, 100
set isosamples 10, 10
set surface 
unset contour
set cntrlabel  format '%8.3g' font '' start 5 interval 20
set mapping cartesian
set datafile separator whitespace
unset hidden3d
set cntrparam order 4
set cntrparam linear
set cntrparam levels 5
set cntrparam levels auto
set cntrparam firstlinetype 0 unsorted
set cntrparam points 5
set size ratio 0 1,1
set origin 0,0
set style data points
set style function lines
unset xzeroaxis
unset yzeroaxis
unset zzeroaxis
unset x2zeroaxis
unset y2zeroaxis
set xyplane relative 0.5
set tics scale  1, 0.5, 1, 1, 1
set mxtics default
set mytics default
set mztics default
set mx2tics default
set my2tics default
set mcbtics default
set mrtics default
set nomttics
set xtics border in scale 1,0.5 mirror norotate  autojustify
set xtics  norangelimit 
set ytics border in scale 1,0.5 mirror norotate  autojustify
set ytics  norangelimit autofreq 
set ztics border in scale 1,0.5 nomirror norotate  autojustify
set ztics  norangelimit autofreq 
unset x2tics
unset y2tics
set cbtics border in scale 1,0.5 mirror norotate  autojustify
set cbtics  norangelimit autofreq 
set rtics axis in scale 1,0.5 nomirror norotate  autojustify
set rtics  norangelimit autofreq 
unset ttics
set title "" 
set title  font "" textcolor lt -1 norotate
set timestamp bottom 
set timestamp "" 
set timestamp  font "" textcolor lt -1 norotate
set trange [ * : * ] noreverse nowriteback
set urange [ * : * ] noreverse nowriteback
set vrange [ * : * ] noreverse nowriteback
set xlabel "" 
set xlabel  font "" textcolor lt -1 norotate
set x2label "" 
set x2label  font "" textcolor lt -1 norotate
set x2range [ * : * ] noreverse writeback
set ylabel "" 
set ylabel  font "" textcolor lt -1 rotate
set y2label "" 
set y2label  font "" textcolor lt -1 rotate
set yrange [ .9 : 4000.00 ] noreverse writeback
set y2range [ * : * ] noreverse writeback
set zlabel "" 
set zlabel  font "" textcolor lt -1 norotate
set zrange [ * : * ] noreverse writeback
set cblabel "" 
set cblabel  font "" textcolor lt -1 rotate
set cbrange [ * : * ] noreverse writeback
set rlabel "" 
set rlabel  font "" textcolor lt -1 norotate
set rrange [ * : * ] noreverse writeback
unset logscale
unset jitter
set zero 1e-08
set lmargin  -1
set bmargin  -1
set rmargin  -1
set tmargin  -1
set locale "en_US.UTF-8"
set pm3d explicit at s
set pm3d scansautomatic
set pm3d interpolate 1,1 flush begin noftriangles noborder corners2color mean
set pm3d nolighting
set palette positive nops_allcF maxcolors 0 gamma 1.5 color model RGB 
set palette rgbformulae 7, 5, 15
set colorbox default
set colorbox vertical origin screen 0.9, 0.2 size screen 0.05, 0.6 front  noinvert bdefault
set style boxplot candles range  1.50 outliers pt 7 separation 1 labels auto unsorted
set loadpath 
set fontpath 
set psdir
set fit brief errorvariables nocovariancevariables errorscaling prescale nowrap v5
f(x) = a*x+b
GNUTERM = "qt"
a = -40.5675675676834
b = 3835.26276277019
FIT_CONVERGED = 1
FIT_NDF = 34
FIT_STDFIT = 284.701946094288
FIT_WSSR = 2755876.73573574
FIT_P = 0.0
FIT_NITER = 4
a_err = 4.56767214860312
b_err = 293.902876372366
## Last datafile plotted: "< ./trailing-average < ../covid.data"
fit [46:*] f(x) "< ./trailing-average < ../covid.data" using 2:4 via a,b
g(x) = c*x+d
fit [46:*] g(x) "< ./trailing-average < ../covid.data" using 2:(log($4)) via c,d

june_zero = -b/a-82
hour_zero = 24*(june_zero-floor(june_zero))
minute_zero = 60*(hour_zero-floor(hour_zero))

n_cases_target = 42
day_of_target = 112+(log(n_cases_target)-g(112))/c
set xrange [ 0 : day_of_target+1 ] noreverse writeback
set xtics   ("3/11" 1.00000, "4/25" 46.0000, "5/30" 81.0000, "6/12" 94.0000, sprintf("7/%d", day_of_target-112) day_of_target)

#set ytics mirror
#set y2tics (1, "42" 42)
# set arrow 1 from day_of_target-10,10 to day_of_target,42 lt 4
# set label 99 "42 cases/day" at day_of_target-10,10 center offset character -2,-0.5

set log y
set log y2
#set label 1 sprintf("Linear:\n zero intercept June %d %02d:%02d EDT.\nExponential:\n predicts %.0f cases 6/12.\n predicts %d cases/day on July %d\n",\
#   floor(june_zero), floor(hour_zero), floor(minute_zero), exp(g(94)),\
#   n_cases_target, floor((log(n_cases_target)-g(112))/c)\
#   ) at  36, 30 offset character 0,1
#set label 1 sprintf("Exponential:\n predicts %.0f cases 6/12.\n predicts %d cases/day on July %d\n",\
#   exp(g(94)),\
#   n_cases_target, floor((log(n_cases_target)-g(112))/c)\
#   ) at  36, 30 offset character 0,1
# set label 1 sprintf("Exponential predicts %d cases/day on July %d\n",\
#    n_cases_target, floor((log(n_cases_target)-g(112))/c)\
#   ) at  36, 30 offset character 0,1

#set label 1 sprintf("Linear: zero intercept June %d %02d:%02d EDT", floor(june_zero), floor(hour_zero), floor(minute_zero)) at  5, 3000
#set label 2 sprintf("Exponential: predicts %.0f cases on June %d", floor(june_zero), exp(g(-b/a))) at 5,2700
plot "< ./trailing-average < ../covid.data" using 2:22 with lines title "new cases 7-day geometric average",  \
     "" using 2:4 notitle                                                                              
#     ,[46:*] exp(g(x)) title sprintf("exponential decay best fit %.2f%%/day", 100*(1-exp(c))) lt 4



#    EOF
