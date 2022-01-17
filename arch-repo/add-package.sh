#!/bin/bash

arch=$(echo $1 | cut -d"/" -f4)
filename=$(echo $1 | cut -d"/" -f5)

if [ -f /packages/webdav/$arch/$filename ]
then
echo "Moving $filename from DAV to HTTP"
mv /packages/webdav/$arch/$filename /packages/http/$arch/$filename
repo-add /packages/http/$arch/$REPO_NAME.db.tar /packages/http/$arch/$filename
fi
