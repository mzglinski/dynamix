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

# Calculate MD5 checksum
MD5=$(md5sum $script_dir/archive/dynamix.s3.sleep.txz | awk '{print $1}')

# Update the MD5 in the PLG file
sed -i "s/<!ENTITY MD5       \"[^\"]*\">/<!ENTITY MD5       \"$MD5\">/" $script_dir/unRAIDv6/dynamix.s3.sleep.plg

echo "Updated MD5 checksum to $MD5"
