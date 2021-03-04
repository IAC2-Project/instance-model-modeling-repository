#!/bin/bash
apt -y update
apt -y install wget curl git unzip
# https://github.com/canha/golang-tools-install-script
wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash -s -- --version 1.7.6
source ~/.bashrc
go get -v github.com/Masterminds/glide
go get -u github.com/FiloSottile/gvt
file_name=$(find . -type f -name '*.zip')
mkdir -d ~/go/src/${WORKDIR}
unzip file_name -d ~/go/src/${WORKDIR}
cd ~/go/src/${WORKDIR}
glide install
gvt restore
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /app ${ENTRYPOINT}
exit 0
