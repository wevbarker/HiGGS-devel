#!/bin/bash

#	copy everything under the xAct directory into the local Mathematica install

rsync -avh --exclude '*.mx' ./xAct/* ~/.Mathematica/Applications/xAct/ --delete

exit 0
