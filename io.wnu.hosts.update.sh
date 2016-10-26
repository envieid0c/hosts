#!/bin/bash

mkdir -p ~/.io_wnu/log/
cd ~/.io_wnu/
git clone "https://github.com/envieid0c/hosts.git"
cd hosts
git fetch --all
git reset --hard origin/master

python3 updateHostsFile.py -a -r