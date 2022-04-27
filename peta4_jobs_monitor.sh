#!/bin/bash
#	this file prepares a kernel report and sends it to the tower by ssh 

#	flush the stats directory
rm -rf ./bin/stats
rm -rf ./bin/samples
#	make a new stats directory
mkdir ./bin/stats
mkdir ./bin/samples

#	wait five seconds for the first kernel logs to come through
sleep 5
#	plot loop
while sleep 5; do
  echo "			(...replotting...)"
  ./peta4_jobs_plot.py > /dev/null 2>&1
  #scp ./peta4_jobs_trace.png tower:/home/williamb/Documents/physics/projects/HiGGS_development/peta4_jobs_trace.png
done

exit 0

#FILE=$1
#while inotifywait -e close_write $FILE; do yes | cp $FILE zathurax_$FILE; done
