#!/bin/bash
apt-get update
apt-get -y install wget curl git
curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt install nodejs
npm install --global yarn
file_name=$(find . -type f -name '*.zip')
unzip file_name -d .
yarn install
exit 0
