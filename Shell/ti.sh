#!/bin/sh
TI_HOME="/Library/Application Support/Titanium"
TI_SDK="$TI_HOME/mobilesdk/osx/0.8.1"
DIR=`pwd`
"$TI_SDK/tiapp.py" -d . -s "$TI_HOME" -a "$TI_SDK" "$DIR"