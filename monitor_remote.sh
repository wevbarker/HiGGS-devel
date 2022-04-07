#!/bin/bash
#	this file prepares a kernel report and sends it to the tower by ssh 

#watch -n 10 ./plot_cores.py > jobs.log

while sleep 1; do
  echo "replotting"
  ./plot_cores.py
  scp ./jobs.png tower:/home/williamb/Documents/physics/projects/HiGGS_development/jobs.png
done

#FILE=$1
#while inotifywait -e close_write $FILE; do yes | cp $FILE zathurax_$FILE; done
