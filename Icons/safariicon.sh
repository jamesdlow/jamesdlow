#!/bin/sh
filename="${1%.*}"
extension="${filename##*.}"
output=Icon
#output=appicon

cp $1 apple-touch-icon.png
sips -s format png -Z 180 apple-touch-icon.png
cp $1 apple-touch-icon-precomposed.png
sips -s format png -Z 180 apple-touch-icon-precomposed.png
cp $1 apple-touch-icon-120x120.png
sips -s format png -Z 120 apple-touch-icon-120x120.png
cp $1 apple-touch-icon-120x120-precomposed.png
sips -s format png -Z 120 apple-touch-icon-120x120-precomposed.png
cp $1 apple-touch-icon-152x152.png
sips -s format png -Z 120 apple-touch-icon-152x152.png
cp $1 apple-touch-icon-152x152-precomposed.png
sips -s format png -Z 120 apple-touch-icon-152x152-precomposed.png