#!/bin/bash
#	this file runs the jobs specified in jobs.m 
#	first make sure everything else is dead, slightly overkill...
pkill -9 "Mathematica"
pkill -9 "Wolfram"
pkill -9 "xperm"
pkill -9 "monitor_remote.py"
pkill -9 "monitor_remote"

#	start the plotting script
./monitor_remote.sh &

#	run the job	
math -run < jobs.m

#	kill the plotting script
pkill -9 "monitor_remote.py"
pkill -9 "monitor_remote"
exit 0
