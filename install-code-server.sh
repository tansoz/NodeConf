#!/bin/bash/

ROOT=/server

apt-get -y install wget tar apache2-utils

mkdir -p $ROOT
cd $ROOT

wget -O code-server.tar "https://update.code.visualstudio.com/latest/server-linux-x64-web/stable"
tar -xvf code-server.tar
rm -rf code-server.tar

rm -rf ./code-server
mv ./vscode-server-linux-x64-web ./code-server

sed -i "s/script-src 'self'/script-src 'self' main.vscode-cdn.net/g" code-server/out/vs/server/node/server.main.js
sed -i "s/this.__staticRoute,WORK/this.__staticRoute,MS_STATIC_CDN:this.__staticRoute.replace(\/^.([a-z]+)-([a-z0-9]+).+$\/,\"\/\/main.vscode-cdn.net\/$1\/$2\"),WORK/g" code-server/out/vs/server/node/server.main.js

sed -i "s/{{WORKBENCH_WEB_BASE_URL}}\/out/{{MS_STATIC_CDN}}\/out/g" code-server/out/vs/code/browser/workbench/workbench.html

mkdir -p ./code-server-data

rm -f run-code-server.sh
curl https://purge.jsdelivr.net/gh/tansoz/NodeConf@master/run-code-server.sh > /dev/null
wget https://cdn.jsdelivr.net/gh/tansoz/NodeConf@master/run-code-server.sh
chmod +x run-code-server.sh
curl https://purge.jsdelivr.net/gh/tansoz/NodeConf@master/code-server.code-server > /dev/null
wget https://cdn.jsdelivr.net/gh/tansoz/NodeConf@master/code-server.service

mv code-server.service /etc/systemd/system/code-server.service
systemctl enable code-server.service
systemctl daemon-reload
systemctl enable code-server.service
systemctl start code-server.service

if ! [ -f ./code-server.user ]; then
  touch ./code-server.user
  htpasswd ./code-server.user admin
fi
