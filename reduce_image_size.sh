#!/bin/bash

# Argv1 is path to image
img=$1 

# Get Height of image
height=$(sips -g pixelHeight "$img" | tail -1 | awk '{print $2}')
width=$(sips -g pixelWidth "$img" | tail -1 | awk '{print $2}')

if [ "$height" -gt "$width" ]
then
	newsize="$((height / 2))"
else
	newsize="$((width / 2))"
fi

sips -Z $newsize "$img"
