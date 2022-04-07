#!/bin/bash
#	this file prepares a kernel report and sends it to the tower by ssh 

#	flush the stats directory
rm -rf ./bin/stats
#	make a new stats directory
mkdir ./bin/stats
#	wait five seconds for the first kernel logs to come through
sleep 5
#	plot loop
while sleep 1; do
  echo "replotting"
  ./plot_cores.py > /dev/null
  scp ./jobs.png tower:/home/williamb/Documents/physics/projects/HiGGS_development/jobs.png
done

#FILE=$1
#while inotifywait -e close_write $FILE; do yes | cp $FILE zathurax_$FILE; done
