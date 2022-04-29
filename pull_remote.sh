#!/bin/bash
#	this file pulls jobs.png from remote 
while sleep 1; do
  echo "			(...pulling jobs.png from remote...)"
  scp -J appcs peta4-math:~/HiGGS_development/peta4_jobs_trace.png ./peta4_jobs_trace.png
done

exit 0
