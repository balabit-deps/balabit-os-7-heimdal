#!/bin/sh

srcdir=$(dirname "$0")
version=$2
tgz="$(realpath "../heimdal_$version.orig.tar.gz")"
tmp=$(mktemp -d)

cd "$tmp"
tar xzf "$tgz"
awk '/End Table/{flag=0;print}flag;/Start Table/{flag=1;print}' \
    heimdal-*/lib/wind/rfc3454.txt >rfc3454.txt
mv rfc3454.txt heimdal-*/lib/wind/
tar czf "$tgz" heimdal-*
