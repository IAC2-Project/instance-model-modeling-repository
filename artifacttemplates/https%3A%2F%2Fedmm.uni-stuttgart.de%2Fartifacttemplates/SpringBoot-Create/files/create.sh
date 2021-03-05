#!/bin/bash
apt -y update
# apt -y install openjdk-11-jre-headless
apt -y install openjdk-8-jre-headless
file_name=$(find . -type f -name '*.jar')
mv $file_name ./app.jar
exit 0
