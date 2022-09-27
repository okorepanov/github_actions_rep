#!/bin/bash

set -e # exit on first exception
set -x # enable debug

MINIMUM_AVAILABLE_DATE=$(date -d '-1 month' +'%Y%m%d') # macos: $(date -v -1m +'%Y%m%d')

for file in "$@"
do
  timestamp=$(basename $file | cut -c 1-8)
  if [ $timestamp -lt $MINIMUM_AVAILABLE_DATE ];
  then
    echo $file: timestamp is older than one month!
    exit 1;
  fi
done
