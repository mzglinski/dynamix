#!/bin/bash

script_dir=$(dirname $(realpath "$0"))

set -x

rm -rf /tmp/pkg-s3-sleep
mkdir -p /tmp/pkg-s3-sleep/usr/local/emhttp/plugins/dynamix.s3.sleep
cp -r source/s3-sleep/* /tmp/pkg-s3-sleep/usr/local/emhttp/plugins/dynamix.s3.sleep

cd /tmp/pkg-s3-sleep
tar -cJf $script_dir/archive/dynamix.s3.sleep.txz .
cd -

rm -rf /tmp/pkg-s3-sleep
