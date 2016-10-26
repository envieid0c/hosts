#!/bin/bash

APP=/Library/Application\ Support/WLAN/StatusBarApp.app/
CONTENT="$APP"Contents/
HOSTS="$APP"Contents/hosts

sudo -v
# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo rm -rf "$HOSTS" /Library/LaunchAgents/io.wnu.hosts.update.plist 

mkdir -p "$CONTENT"/log/
cd "$CONTENT"
git clone "https://github.com/envieid0c/hosts.git"
cd "$HOSTS"
git fetch --all
git reset --hard origin/master

python updateHostsFile.py -a -r

sudo cp io.wnu.hosts.update.plist /Library/LaunchAgents/
sudo chmod 600 /Library/LaunchAgents/io.wnu.hosts.update.plist 
sudo chown root /Library/LaunchAgents/io.wnu.hosts.update.plist
sudo launchctl unload /Library/LaunchAgents/io.wnu.hosts.update.plist
sudo launchctl load /Library/LaunchAgents/io.wnu.hosts.update.plist
