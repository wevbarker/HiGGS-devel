#!/bin/bash
#	if this is run as a standalone, then load the modules
module load anaconda/3.2019-10
module load texlive/2015
#	this file prepares a kernel report and sends it to the tower by ssh 
while true; do
  echo "			(...replotting...)"
  ./peta4_jobs_plot.py
  scp -J appcs ./peta4_jobs_trace.png tower:~/Documents/physics/projects/HiGGS_development/ 
  #./peta4_jobs_plot.py > /dev/null 2>&1 	#	 for quiet plotting
done
