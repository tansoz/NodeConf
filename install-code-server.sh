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

sed -i "s/-src 'self'/-src 'self' main.vscode-cdn.net/g" code-server/out/vs/server/node/server.main.js
sed -i "s/\([^:,]*\),WORK/\1,MS_STATIC_CDN:\1.replace(\/^.([a-z]+)-([a-z0-9]+).+$\/,\"\/\/main.vscode-cdn.net\/\$1\/\$2\"),WORK/g" code-server/out/vs/server/node/server.main.js

sed -i "s/src=\"{{WORKBENCH_WEB_BASE_URL}}/src=\"{{MS_STATIC_CDN}}/g" code-server/out/vs/code/browser/workbench/workbench.html

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
