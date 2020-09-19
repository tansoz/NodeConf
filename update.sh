cd /etc/nginx/conf.d/
rm -f ./proxy.conf
wget "http://jp.cdn.rommhui.com/https/raw.githubusercontent.com/tansoz/NodeConf/master/proxy.conf"
sed -i "s/listen 80;/listen $1;/g" ./proxy.conf
nginx -s reload
