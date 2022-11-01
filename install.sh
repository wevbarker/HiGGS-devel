#!/bin/bash

#==================================#
#  This file is a local installer  #
#==================================#

if [ "$1" = "--pull" ]; then
	rsync -avh ~/.Mathematica/Applications/xAct/HiGGS/Binaries/* ./xAct/HiGGS/Binaries/ --delete
elif [ "$1" = "--push" ]; then
	rsync -avh ./xAct/* ~/.Mathematica/Applications/xAct/ --delete
else
	rsync -avh --exclude '*.mx' ./xAct/* ~/.Mathematica/Applications/xAct/ --delete
fi

tree xAct > ./.direcory_tree

exit 0
