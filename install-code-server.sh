#!/bin/bash/

ROOT=/server

apt-get install -y wget tar

mkdir -p $ROOT
cd $ROOT

wget -O code-server.tar "https://update.code.visualstudio.com/1.71.2/server-linux-x64-web/stable"
tar -xvf code-server.tar
rm -rf code-server.tar

rm -rf ./code-server
mv ./vscode-server-linux-x64-web ./code-server

mkdir -p ./code-server-data

rm -f run-code-server.sh
curl https://purge.jsdelivr.net/gh/tansoz/NodeConf@master/run-code-server.sh > /dev/null
wget https://cdn.jsdelivr.net/gh/tansoz/NodeConf@master/run-code-server.sh
chmod +x run-code-server.sh
curl https://purge.jsdelivr.net/gh/tansoz/NodeConf@master/code-server.code-server > /dev/null
wget https://cdn.jsdelivr.net/gh/tansoz/NodeConf@master/code-server.service

mv code-server.service /etc/systemd/system/code-server.service
systemctl daemon-reload
systemctl enable code-server.service
systemctl start code-server.service
