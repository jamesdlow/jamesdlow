#!/bin/sh
filename="${1%.*}"
extension="${filename##*.}"
output=icon

sizes=(16 29 32 36 48 57 72 128)
for size in ${sizes[@]}
do
	cp $1 "$output""$size".png
	sips -s format png -Z $size "$output""$size".png
done