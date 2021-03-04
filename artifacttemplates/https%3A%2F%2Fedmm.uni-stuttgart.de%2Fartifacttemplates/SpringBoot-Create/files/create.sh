#!/bin/bash
apt -y update
apt -y install openjdk-11-jre-headless
file_name=$(find . -type f -name '*.jar')
cp file_name ./app.jar
exit 0
