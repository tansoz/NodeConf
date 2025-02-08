#!/bin/bash

ip=$(curl -Ls https://speed.cloudflare.com/cdn-cgi/trace $1 | grep ip= | sed "s/ip=//")

echo IP: $ip

loc=$(curl -Ls https://speed.cloudflare.com/cdn-cgi/trace $1 | grep loc= | sed "s/loc=//")

echo Location: $loc

download_speed=0

if [ "$loc" = 'CN' ]; then
    download_speed=$(curl "https://test.ustc.edu.cn/backend/garbage.php?r=0.6936259661060729&ckSize=100" -H "cookie: ustc=1" $1 -w "%{speed_download}" -s -o /dev/null | sed "s/\.0*//")
else
    download_speed=$(curl "https://speed.cloudflare.com/__down?bytes=50000000" $1 -w "%{speed_download}" -s -o /dev/null | sed "s/\.0*//")
fi
echo Download Speed: $(( $download_speed / 1024 / 1024)) MB/s

upload_speed=0
if [ "$loc" = 'CN' ]; then
    upload_speed=$(dd if=/dev/zero bs=10M count=5 status=none | curl "https://test.ustc.edu.cn/backend/empty.php?r=0.28971257636843784" -H "cookie: ustc=1" $1 -X POST --data-binary "@-" -s -w "%{speed_upload}" | sed "s/\.0*//")
else
    upload_speed=$(dd if=/dev/zero bs=10M count=5 status=none | curl "https://speed.cloudflare.com/__up" $1 -X POST --data-binary "@-" -s -w "%{speed_upload}" | sed "s/\.0*//")
fi
echo Upload Speed:  $(( $upload_speed / 1024 / 1024 )) MB/s
