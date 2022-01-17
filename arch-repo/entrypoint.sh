#!/bin/bash

mkdir -p /packages/webdav /packages/webdav/aarch64 /packages/webdav/x86_64
mkdir -p /packages/http /packages/http/aarch64 /packages/http/x86_64

rclone serve webdav /packages/webdav --user=$WEBDAB_USER --pass=$WEBDAV_PASS --addr=:8081 &
darkhttpd /packages/http --port 8080 &

while true
do
  echo "Running the package scraper"
  for file in /packages/webdav/*/*
  do
    /add-package.sh $file
  done
  echo "Scraper sleeping for 30 minutes"
  sleep 1800
done
