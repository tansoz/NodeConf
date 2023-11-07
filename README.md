# NodeConf

## 安装 Code-Server
```
curl https://ghproxy.com/https://raw.githubusercontent.com/tansoz/NodeConf/master/install-code-server.sh | bash
```
## 网络测速
```
curl -Ls https://ghproxy.com/https://raw.githubusercontent.com/tansoz/NodeConf/master/speedtest.sh | bash
```

IPv4
```
curl -Ls https://ghproxy.com/https://raw.githubusercontent.com/tansoz/NodeConf/master/speedtest.sh | bash -s -- -4
```

IPv6
```
curl -Ls https://ghproxy.com/https://raw.githubusercontent.com/tansoz/NodeConf/master/speedtest.sh | bash -s -- -6
```

## 安装xray
```
bash <(curl -Ls https://ghproxy.com/https://raw.githubusercontent.com/tansoz/NodeConf/master/install.sh)
```

## 测速
```
curl -so- 86.re/bench.sh | bash
```

## 新配置命令

```
rm -f ./update.sh && wget "https://ghproxy.com/https://raw.githubusercontent.com/tansoz/NodeConf/master/update.sh" && chmod +x update.sh && bash ./update.sh 80
```

## 旧配置命令
```
~~rm -f ./update.sh && wget "https://ghproxy.com/https://raw.githubusercontent.com/tansoz/NodeConf/master/update.sh" && chmod +x update.sh && ./update.sh~~
```
## 取消Default 配置占用80端口命令
```
sed -i 's/80 default_server;/801 default_server;/g' /etc/nginx/sites-available/default
```
