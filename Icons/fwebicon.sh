#!/bin/sh
filename="${1%.*}"
extension="${filename##*.}"
output=Icon-

sizes=(192 512)
for size in ${sizes[@]}
do
	cp $1 "$output""$size".png
	sips -s format png -Z $size "$output""$size".png
	cp $1 "$output"maskable-"$size".png
	sips -s format png -Z $size "$output"maskable-"$size".png
done

sizes=(16)
for size in ${sizes[@]}
do
	cp $1 favicon.png
	sips -s format png -Z $size favicon.png
done