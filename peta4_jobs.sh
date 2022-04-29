#!/bin/bash
#	this file runs the jobs specified in jobs.m 
#	kill all processes
pkill -9 "Mathematica"
pkill -9 "Wolfram"
pkill -9 "xperm"
pkill -9 "peta4_jobs_monitor.sh"
pkill -9 "peta4_jobs_plot.py"

#	first make sure we are in the correct directory
cd /home/wb263/HiGGS_development

#	flush the stats directory
rm -rf ./bin/stats
rm ./bin/BuildTime.mx

#	make a new stats directory
mkdir ./bin/stats

#	start the plotting script
#./peta4_jobs_monitor.sh & 	#	try to run this on the login node

#	run the job	
math -run < peta4_jobs.m

#	kill all processes
pkill -9 "Mathematica"
pkill -9 "Wolfram"
pkill -9 "xperm"
pkill -9 "peta4_jobs_monitor.sh"
pkill -9 "peta4_jobs_plot.py"

exit 0
