#!/bin/sh

NW_VER=0.11.5
NW_BASENAME=node-webkit-v$NW_VER-osx-x64
NW_ZIP=$NW_BASENAME.zip
NW_URL=http://dl.node-webkit.org/v$NW_VER/$NW_ZIP
APP_DIR=Trello.app
INNER_APP_DIR="$APP_DIR"/Contents/Resources/app.nw

if [ ! -e "$NW_ZIP" ]; then
	curl -L -o "$NW_ZIP" $NW_URL || exit 1
fi

if [ ! -e "$APP_DIR" ]; then
	unzip "$NW_ZIP" "$NW_BASENAME/node-webkit.app/*" || exit 1
	mv "$NW_BASENAME/node-webkit.app" "$APP_DIR" || exit 1
fi

cp trello.icns "$APP_DIR"/Contents/Resources/nw.icns
cp Info.plist "$APP_DIR/Contents/"
mkdir -p "$INNER_APP_DIR"
cp index.html package.json trello-status.png "$INNER_APP_DIR"
