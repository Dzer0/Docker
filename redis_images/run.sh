#!/bin/sh
# 进入目录
cd /usr/local/redis
# 替换端口
[ "x" !=  "x$PORT" ] && sed -i "s/7000/$PORT/g" redis.conf
# 替换bind
[ "x" !=  "x$BIND" ] && sed -i "s/bind 127.0.0.1/bind $IP/g" redis.conf
# 启用节点
sed -i 's/# cluster-enabled yes/cluster-enabled yes/g' redis.conf
# 设置超时时间
sed -i 's/# cluster-node-timeout 15000/cluster-node-timeout 5000/g' redis.conf
# 设置配置文件
[ "x" !=  "x$PORT" ] && sed -i "s/# cluster-config-file nodes.*/cluster-config-file nodes-$PORT.conf/g" redis.conf
# 启动 redis服务
/usr/local/redis/redis-server /usr/local/redis/redis.conf
# 启动后方式镜像自动退出
while :;
do
        sleep 10
        trap exit 1  2
done
