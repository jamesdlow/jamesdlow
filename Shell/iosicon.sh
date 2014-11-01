#!/bin/sh
filename="${1%.*}"
extension="${filename##*.}"
output=appicon

cp $1 "$output".png
sips -Z 57 "$output".png
cp $1 "$output"@2x.png
sips -Z 114 "$output"@2x.png

sizes=(60 72 76)
for size in ${sizes[@]}
do
	cp $1 "$output"-"$size".png
	sips -Z $size "$output"-"$size".png
	cp $1 "$output"-"$size"@2x.png
	sips -Z `expr $size \\* 2` "$output"-"$size"@2x.png
done