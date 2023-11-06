#!/bin/bash

download_speed=$(curl "https://speed.cloudflare.com/__down?bytes=50000000" -w "%{speed_download}" -s -o /dev/null)

echo Download Speed: $(( $download_speed / 1024 / 1024)) MB/s

upload_speed=$(dd if=/dev/zero bs=10M count=5 status=none | curl "https://speed.cloudflare.com/__up" -X POST --data-binary "@-" -s -w "%{speed_upload}")

echo Upload Speed:  $(( $upload_speed / 1024 / 1024 )) MB/s
