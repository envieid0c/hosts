#!/bin/bash

cd /tmp/
echo "cd tmp"
git clone "https://github.com/envieid0c/hosts.git" /tmp/update_hosts
echo "clone source"
mkdir -p /var/log/io_wnu/
echo "create dir"
rm -rf /tmp/update_hosts
echo "clean all!)"
