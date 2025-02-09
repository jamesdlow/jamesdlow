#!/bin/sh
filename="${1%.*}"
extension="${filename##*.}"
output=Icon

mkdir mipmap-hdpi
cp $1 mipmap-hdpi/icon.png
sips -s format png -Z 72 mipmap-hdpi/icon.png
cp $1 mipmap-hdpi/pushicon.png
sips -s format png -Z 36 mipmap-hdpi/pushicon.png
cp $1 mipmap-hdpi/launcher_foreground.png
sips -s format png -Z 162 mipmap-hdpi/launcher_foreground.png

mkdir mipmap-mdpi
cp $1 mipmap-mdpi/icon.png
sips -s format png -Z 48 mipmap-mdpi/icon.png
cp $1 mipmap-mdpi/pushicon.png
sips -s format png -Z 24 mipmap-mdpi/pushicon.png
cp $1 mipmap-mdpi/launcher_foreground.png
sips -s format png -Z 108 mipmap-mdpi/launcher_foreground.png

mkdir mipmap-xhdpi
cp $1 mipmap-xhdpi/icon.png
sips -s format png -Z 96 mipmap-xhdpi/icon.png
cp $1 mipmap-xhdpi/pushicon.png
sips -s format png -Z 48 mipmap-xhdpi/pushicon.png
cp $1 mipmap-xhdpi/launcher_foreground.png
sips -s format png -Z 216 mipmap-xhdpi/launcher_foreground.png

mkdir mipmap-xxhdpi
cp $1 mipmap-xxhdpi/icon.png
sips -s format png -Z 144 mipmap-xxhdpi/icon.png
cp $1 mipmap-xxhdpi/pushicon.png
sips -s format png -Z 72 mipmap-xxhdpi/pushicon.png
cp $1 mipmap-xxhdpi/launcher_foreground.png
sips -s format png -Z 324 mipmap-xxhdpi/launcher_foreground.png

mkdir mipmap-xxxhdpi
cp $1 mipmap-xxxhdpi/icon.png
sips -s format png -Z 192 mipmap-xxxhdpi/icon.png
cp $1 mipmap-xxxhdpi/pushicon.png
sips -s format png -Z 96 mipmap-xxxhdpi/pushicon.png
cp $1 mipmap-xxxhdpi/launcher_foreground.png
sips -s format png -Z 432 mipmap-xxxhdpi/launcher_foreground.png

mkdir applisting
cp $1 applisting/icon.png
sips -s format png -Z 128 applisting/icon.png
cp $1 applisting/googleplay.png
sips -s format png -Z 512 applisting/googleplay.png

mkdir amazon
cp $1 amazon/icon114.png
sips -s format png -Z 114 amazon/icon114.png
cp $1 amazon/icon512.png
sips -s format png -Z 512 amazon/icon512.png