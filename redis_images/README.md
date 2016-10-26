###  制作镜像以及使用方法

-  基础镜像基于最新版的centos
-  redis基于3.0.7（已经将build好的redis上传到github中）
-  可以传递俩个参数分别是PORT、BIND，具体详情可以看相关的run.sh

    docker build -f Dockerfile -t redis:3.0.7 .
    docker run -itd --net=host -e PORT=9000 --name=redis_1 redis:3.0.7
    or
    docker run -itd --net=host -e PORT=9000 -e BIND=10.10.10.123 --name=redis_1 redis:3.0.7
    
    for i in {9001..9006};do
        docker run -itd --name=redis_$i --net=host -e PORT=$1 redis:3.0.7
    done