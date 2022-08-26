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

id=$(wget -q -O - http://jp.cdn.rommhui.com/https/github.com/tansoz/NodeConf/commit/master | sed -n '/property="og:url".*commit\/\([a-z0-9]*\)"/p' | sed 's/.*commit\/\([0-9a-z]*\).*/\1/')

wget "http://jp.cdn.rommhui.com/https/raw.githubusercontent.com/tansoz/NodeConf/${id}/proxy.conf"

listen=""

for i in $*
do
	listen="${listen}listen $i;listen [::]:$i;";
done

sed -i "s/{{PORT}}/$listen/g" ./proxy.conf

#update=$(wget -q -O - https://github.com/tansoz/NodeConf/commit/master | sed -n '/<code class="commit-sha">[a-z0-9]*<\/code>/p' | sed 's/<[^>]*>//g' | sed 's/^.*commit //g')
#update=$(echo $id | sed 's/^\([a-z0-9]\{7\}\).*$/\1/')
sed -i "s/{{DATE}}/$id/g" ./proxy.conf

nginx -s reload
