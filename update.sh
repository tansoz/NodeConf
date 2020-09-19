cd /etc/nginx/conf.d/
rm -f proxy.conf
wget "http://jp.cdn.rommhui.com/https/raw.githubusercontent.com/tansoz/NodeConf/master/proxy.conf"
nginx -s reload
