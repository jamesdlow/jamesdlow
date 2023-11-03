#!/bin/sh
filename="${1%.*}"
extension="${filename##*.}"
output=icon_
folder=icon.iconset

mkdir $folder
sizes=(16 32 64 128 256 512 1024)
for size in ${sizes[@]}
do
	cp $1 "$folder/""$output""$size".png
	sips -Z $size "$folder/""$output""$size".png
	#cp $1 "$output"-"$size"@2x.png
	#sips -Z `expr $size \\* 2` "$output"-"$size"@2x.png
done

iconutil -c icns $folder -o icon.icns