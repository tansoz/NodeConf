# NodeConf

## 新配置命令

```
rm -f ./update.sh && wget "http://jp.cdn.rommhui.com/https/raw.githubusercontent.com/tansoz/NodeConf/master/update.sh" && chmod +x update.sh && bash ./update.sh 80
```

## 旧配置命令
```
~~rm -f ./update.sh && wget "http://jp.cdn.rommhui.com/https/raw.githubusercontent.com/tansoz/NodeConf/master/update.sh" && chmod +x update.sh && ./update.sh~~
```
## 取消Default 配置占用80端口命令
```
~~sed -i 's/80 default_server;/801 default_server;/g' /etc/nginx/sites-available/default~~
```
