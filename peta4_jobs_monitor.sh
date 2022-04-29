#!/bin/bash
#	this file prepares a kernel report and sends it to the tower by ssh 
while true; do
  echo "			(...replotting...)"
  ./peta4_jobs_plot.py > /dev/null 2>&1
done
