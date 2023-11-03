#!/bin/sh
filename="${1%.*}"
extension="${filename##*.}"
output=launcher_foreground

mkdir mipmap-hdpi
cp $1 mipmap-hdpi/launcher_foreground.png
sips -Z 162 mipmap-hdpi/launcher_foreground.png

mkdir mipmap-mdpi
cp $1 mipmap-mdpi/launcher_foreground.png
sips -Z 108 mipmap-mdpi/launcher_foreground.png

mkdir mipmap-xhdpi
cp $1 mipmap-xhdpi/launcher_foreground.png
sips -Z 216 mipmap-xhdpi/launcher_foreground.png

mkdir mipmap-xxhdpi
cp $1 mipmap-xxhdpi/launcher_foreground.png
sips -Z 324 mipmap-xxhdpi/launcher_foreground.png

mkdir mipmap-xxxhdpi
cp $1 mipmap-xxxhdpi/launcher_foreground.png
sips -Z 432 mipmap-xxxhdpi/launcher_foreground.png