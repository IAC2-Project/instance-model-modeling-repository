#!/bin/bash
apt -y update
apt -y install wget curl git unzip
# https://github.com/canha/golang-tools-install-script
wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash -s -- --version 1.7.6
source /root/.bashrc
export GOROOT=/root/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/root/go
export PATH=$GOPATH/bin:$PATH
go get -v github.com/Masterminds/glide
go get -u github.com/FiloSottile/gvt
file_name=$(find . -type f -name '*.zip')
mkdir -p /root/go/src/${WORKDIR}
unzip $file_name -d /root/go/src/${WORKDIR}
images=$(find /root/go/src/${WORKDIR} -type d -name images)
[[ ! -z "$images" ]] && cp -R $images .
cd /root/go/src/${WORKDIR}
glide install
gvt restore
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /app ${ENTRYPOINT}
exit 0
