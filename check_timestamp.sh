#!/bin/bash

set -e # exit on first exception
#set -x # enable debug

#MINIMUM_AVAILABLE_DATE=$(date -d '-1 month' +'%Y%m') #macos $(date -v -1m +'%Y%m')

for file in "$@"
do
  if (( ${file:0:8} > $MINIMUM_AVAILABLE_DATE ))
  then
    echo Migration is older than one month!
    exit 1;
  fi
done
