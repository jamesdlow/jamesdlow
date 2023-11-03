#!/bin/sh
filename="${1%.*}"
extension="${filename##*.}"
output=app_icon_

sizes=(16 32 64 128 256 512 1024)
for size in ${sizes[@]}
do
	cp $1 "$output""$size".png
	sips -Z $size "$output""$size".png
done