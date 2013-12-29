#!/bin/sh

NW_VER=0.8.3
NW_ZIP=node-webkit-v$NW_VER-osx-ia32.zip
NW_URL=https://s3.amazonaws.com/node-webkit/v$NW_VER/$NW_ZIP
APP_DIR=trello.app
INNER_APP_DIR="$APP_DIR"/Contents/Resources/app.nw

if [ ! -e "$NW_ZIP" ]; then
	curl -o "$NW_ZIP" $NW_URL || exit 1
fi

if [ ! -e "$APP_DIR" ]; then
	unzip "$NW_ZIP" 'node-webkit.app/*' || exit 1
	mv node-webkit.app "$APP_DIR" || exit 1
fi

cp trello.icns "$APP_DIR"/Contents/Resources/nw.icns
cp Info.plist "$APP_DIR/Contents/"
mkdir -p "$INNER_APP_DIR"
cp index.html package.json trello-status.png "$INNER_APP_DIR"
