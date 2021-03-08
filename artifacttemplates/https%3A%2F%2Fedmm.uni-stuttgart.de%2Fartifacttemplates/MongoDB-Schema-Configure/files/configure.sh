#!/bin/bash
if [[ -d "/docker-entrypoint-initdb.d" ]]; then
    find . -type f -name '*.js' -exec cp {} /docker-entrypoint-initdb.d \;
else
    file_name=$(find . -type f -name '*.js')
    mongo localhost:27017/${SCHEMA_NAME} $file_name
fi
exit 0
