#!/bin/bash

FILE=$1

while inotifywait -e close_write $FILE; do yes | cp $FILE zathurax_$FILE; done
