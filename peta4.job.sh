#!/bin/bash
#	this file runs the jobs specified in jobs.m 

#	first make sure we are in the correct directory
cd /home/wb263/HiGGS_development

#	flush the stats directory
rm -rf ./bin/stats
rm ./bin/BuildTime.mx

#	make a new stats directory
mkdir ./bin/stats

#	run the job	
math -run < peta4.job.m peta4.nd$1.mx

echo "return to sh"

pkill -9 "Mathematica"
pkill -9 "Wolfram"
pkill -9 "xPert"

exit 0
