#!/bin/sh
filename="${1%.*}"
extension="${filename##*.}"
output=Icon

mkdir mipmap-hdpi
cp $1 mipmap-hdpi/ic_launcher.png
sips -s format png -Z 72 mipmap-hdpi/ic_launcher.png

mkdir mipmap-mdpi
cp $1 mipmap-mdpi/ic_launcher.png
sips -s format png -Z 48 mipmap-mdpi/ic_launcher.png

mkdir mipmap-xhdpi
cp $1 mipmap-xhdpi/ic_launcher.png
sips -s format png -Z 96 mipmap-xhdpi/ic_launcher.png

mkdir mipmap-xxhdpi
cp $1 mipmap-xxhdpi/ic_launcher.png
sips -s format png -Z 144 mipmap-xxhdpi/ic_launcher.png

mkdir mipmap-xxxhdpi
cp $1 mipmap-xxxhdpi/ic_launcher.png
sips -s format png -Z 192 mipmap-xxxhdpi/ic_launcher.png

mkdir applisting
cp $1 applisting/icon.png
sips -s format png -Z 128 applisting/icon.png
cp $1 applisting/googleplay.png
sips -s format png -Z 512 applisting/googleplay.png