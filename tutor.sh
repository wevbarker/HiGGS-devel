#!/bin/bash
#	this file runs the jobs specified in jobs.m 
#	first make sure everything else is dead, slightly overkill...
pkill -9 "Mathematica"
pkill -9 "Wolfram"
pkill -9 "xperm"

#	make the figures directory again
mkdir figures

#	run the job	
math -run < examples.m

exit 0
