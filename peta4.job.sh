#!/bin/bash
#	this file runs the jobs specified in jobs.m 

#	first make sure we are in the correct directory
cd /home/wb263/HiGGS_development

#	flush the stats directory
rm -rf ./bin/node-*/stats/*
rm ./bin/node-*/BuildTime.mx

#	run the job	
math -run < peta4.job.m $1

echo "script peta4.job.m has exited and returned to peta4.job.sh"

pkill -9 "Mathematica"
pkill -9 "Wolfram"
pkill -9 "xPert"
pkill -9 "xperm"

echo "the following processes are still running on this node:"

ps -u wb263

exit 0
