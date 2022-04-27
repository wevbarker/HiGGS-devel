#!/bin/bash
#	this file runs the jobs specified in jobs.m 
#	first make sure everything else is dead, slightly overkill...
pkill -9 "Mathematica"
pkill -9 "Wolfram"
pkill -9 "xperm"
#	also kill the monitor
pkill -9 "peta4_jobs_monitor.sh"
pkill -9 "peta4_jobs_plot.py"

#	first make sure we are in the correct directory
cd /home/wb263/HiGGS_development

#	start the plotting script
./peta4_jobs_monitor.sh &

#	run the job	
math -run < peta4_jobs.m

#	first make sure everything else is dead, slightly overkill...
pkill -9 "Mathematica"
pkill -9 "Wolfram"
pkill -9 "xperm"
#	also kill the monitor
pkill -9 "peta4_jobs_monitor.sh"
pkill -9 "peta4_jobs_plot.py"

exit 0
