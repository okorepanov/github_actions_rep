#!/bin/bash

set -e # exit on first exception
set -x # enable debug

#MINIMUM_AVAILABLE_DATE=$(date -d '-1 month' +'%Y%m%d') #macos $(date -v -1m +'%Y%m')
MINIMUM_AVAILABLE_DATE=$(date -v -1m +'%Y%m%d')

for file in "$@"
do
  filename=$(basename file)
  if (( ${filename:0:8} < $MINIMUM_AVAILABLE_DATE ))
  then
    echo filename is older than one month!
    exit 1;
  fi
done
