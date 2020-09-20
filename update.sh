if [ -d "/etc/nginx/conf.d/" ];then
  cd /etc/nginx/conf.d/
else
  if [ -d "/www/server/panel/vhost/nginx/" ];then
    cd /www/server/panel/vhost/nginx/
  else
    echo "You don't have installed nginx on the machine!"
    exit 0
  fi
fi

rm -f ./proxy.conf
wget "http://jp.cdn.rommhui.com/https/raw.githubusercontent.com/tansoz/NodeConf/master/proxy.conf"
sed -i "s/listen 80;/listen $1;/g" ./proxy.conf
nginx -s reload
