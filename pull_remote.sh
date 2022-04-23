#!/bin/bash
#	this file pulls jobs.png from remote 

#	wait five seconds for the first kernel logs to come through
sleep 5
#	plot loop
while sleep 5; do
  echo "			(...pulling jobs.png from remote...)"
  scp -J appcs appcg:~/HiGGS_development/jobs.png ./jobs.png
done

exit 0
