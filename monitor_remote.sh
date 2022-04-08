#!/bin/bash
#	this file prepares a kernel report and sends it to the tower by ssh 
#	if python is not loaded, load it
module load anaconda/python3
#	flush the stats directory
rm -rf ./bin/stats
rm -rf ./bin/samples
#	make a new stats directory
mkdir ./bin/stats
mkdir ./bin/samples


#	wait five seconds for the first kernel logs to come through
sleep 5
#	plot loop
while sleep 30; do
  echo "			(...replotting...)"
  #./plot_cores.py
  ./plot_cores.py > /dev/null 2>&1
  scp ./jobs.png tower:/home/williamb/Documents/physics/projects/HiGGS_development/jobs.png
done

#FILE=$1
#while inotifywait -e close_write $FILE; do yes | cp $FILE zathurax_$FILE; done
