#!/bin/bash

APP=/Library/Application\ Support/WLAN/StatusBarApp.app/
CONF="$APP"Contents/conf/
HOSTS="$APP"Contents/conf/hosts

mkdir -p "$HOSTS"/log/
cd "$CONF"
git clone "https://github.com/envieid0c/hosts.git"
cd hosts
git fetch --all
git reset --hard origin/master

python updateHostsFile.py -a -r