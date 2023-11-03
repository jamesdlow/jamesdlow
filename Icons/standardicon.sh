#!/bin/sh
filename="${1%.*}"
extension="${filename##*.}"
output=appicon

sizes=(128 256 512 1024)
for size in ${sizes[@]}
do
	cp $1 "$output"-"$size".png
	sips -Z $size "$output"-"$size".png
done