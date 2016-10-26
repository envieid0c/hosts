#!/bin/bash

APP=/Library/Application\ Support/WLAN/StatusBarApp.app/
CONTENT="$APP"Contents/
HOSTS="$APP"Contents/hosts

mkdir -p "$CONTENT"/log/
cd "$CONTENT"
git clone "https://github.com/envieid0c/hosts.git"
cd "$HOSTS"
git fetch --all
git reset --hard origin/master

python updateHostsFile.py -a -r