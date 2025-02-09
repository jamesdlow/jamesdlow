#!/bin/sh
filename="${1%.*}"
extension="${filename##*.}"
output=Icon-App-


sizes=(20 29 40)
for size in ${sizes[@]}
do
	cp $1 "$output""$size""x""$size"@1x.png
	sips -s format png -Z $size "$output""$size""x""$size"@1x.png
	cp $1 "$output""$size""x""$size"@2x.png
	sips -s format png -Z `expr $size \\* 2` "$output""$size""x""$size"@2x.png
	cp $1 "$output""$size""x""$size"@3x.png
	sips -s format png -Z `expr $size \\* 3` "$output""$size""x""$size"@3x.png
done

sizes=(60)
for size in ${sizes[@]}
do
	cp $1 "$output""$size""x""$size"@2x.png
	sips -s format png -Z `expr $size \\* 2` "$output""$size""x""$size"@2x.png
	cp $1 "$output""$size""x""$size"@3x.png
	sips -s format png -Z `expr $size \\* 3` "$output""$size""x""$size"@3x.png
done

sizes=(76)
for size in ${sizes[@]}
do
	cp $1 "$output""$size""x""$size"@1x.png
	sips -s format png -Z $size "$output""$size""x""$size"@1x.png
	cp $1 "$output""$size""x""$size"@2x.png
	sips -s format png -Z `expr $size \\* 2` "$output""$size""x""$size"@2x.png
done

sizes=(83.5)
for size in ${sizes[@]}
do
	cp $1 "$output""$size""x""$size"@2x.png
	sips -s format png -Z `expr 167` "$output""$size""x""$size"@2x.png
done

sizes=(1024)
for size in ${sizes[@]}
do
	cp $1 "$output""$size""x""$size"@1x.png
	sips -s format png -Z $size "$output""$size""x""$size"@1x.png
done