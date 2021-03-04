#!/bin/bash
apt -y update
apt -y install wget curl git unzip
curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt -y install nodejs
npm install --global yarn
file_name=$(find . -type f -name '*.zip')
unzip file_name -d .
yarn install
exit 0
