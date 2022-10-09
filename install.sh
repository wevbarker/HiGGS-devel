#!/bin/bash

#	copy everything under the xAct directory into the local Mathematica install


if [ "$1" = "--pull" ]; then
	rsync -avh ~/.Mathematica/Applications/xAct/HiGGS/bin/* ./xAct/HiGGS/bin/ --delete
elif [ "$1" = "--push" ]; then
	rsync -avh ./xAct/* ~/.Mathematica/Applications/xAct/ --delete
else
	rsync -avh --exclude '*.mx' ./xAct/* ~/.Mathematica/Applications/xAct/ --delete
fi


exit 0
