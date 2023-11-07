#!/bin/bash

ip=$(curl -Ls https://speed.cloudflare.com/cdn-cgi/trace $1 | grep ip= | sed "s/ip=//")

echo IP: $ip

download_speed=$(curl "https://speed.cloudflare.com/__down?bytes=50000000" $1 -w "%{speed_download}" -s -o /dev/null | sed "s/\.0*//")

echo Download Speed: $(( $download_speed / 1024 / 1024)) MB/s

upload_speed=$(dd if=/dev/zero bs=10M count=5 status=none | curl "https://speed.cloudflare.com/__up" $1 -X POST --data-binary "@-" -s -w "%{speed_upload}" | sed "s/\.0*//")

echo Upload Speed:  $(( $upload_speed / 1024 / 1024 )) MB/s
