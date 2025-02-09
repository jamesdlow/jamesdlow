#!/bin/sh
filename="${1%.*}"
extension="${filename##*.}"
output=defaulticon

mkdir drawable-hdpi
cp $1 drawable-hdpi/defaulticon.png
sips -s format png -Z 72 drawable-hdpi/defaulticon.png
cp $1 drawable-hdpi/pushicon.png
sips -s format png -Z 36 drawable-hdpi/pushicon.png

mkdir drawable-ldpi
cp $1 drawable-ldpi/defaulticon.png
sips -s format png -Z 36 drawable-ldpi/defaulticon.png
cp $1 drawable-ldpi/pushicon.png
sips -s format png -Z 18 drawable-ldpi/pushicon.png

mkdir drawable-mdpi
cp $1 drawable-mdpi/defaulticon.png
sips -s format png -Z 48 drawable-mdpi/defaulticon.png
cp $1 drawable-mdpi/pushicon.png
sips -s format png -Z 24 drawable-mdpi/pushicon.png

mkdir drawable-mdpi
cp $1 drawable-mdpi/defaulticon.png
sips -s format png -Z 48 drawable-mdpi/defaulticon.png
cp $1 drawable-mdpi/pushicon.png
sips -s format png -Z 24 drawable-mdpi/pushicon.png

mkdir drawable-xhdpi
cp $1 drawable-xhdpi/defaulticon.png
sips -s format png -Z 96 drawable-xhdpi/defaulticon.png
cp $1 drawable-xhdpi/pushicon.png
sips -s format png -Z 48 drawable-xhdpi/pushicon.png

mkdir drawable-xxhdpi
cp $1 drawable-xxhdpi/defaulticon.png
sips -s format png -Z 144 drawable-xxhdpi/defaulticon.png
cp $1 drawable-xxhdpi/pushicon.png
sips -s format png -Z 72 drawable-xxhdpi/pushicon.png

mkdir applisting
cp $1 applisting/defaulticon.png
sips -s format png -Z 128 applisting/defaulticon.png
cp $1 applisting/googleplay.png
sips -s format png -Z 512 applisting/googleplay.png