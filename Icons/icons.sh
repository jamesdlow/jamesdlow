#!/bin/sh
filename="${1%.*}"
extension="${filename##*.}"
output=$filename

sizes=(32 64 128 256 512 1024)
for size in ${sizes[@]}
do
	cp $1 "$output""$size".png
	sips -s format png -Z $size "$output""$size".png
done