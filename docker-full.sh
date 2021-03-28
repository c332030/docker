

systemctl start docker.service
service docker start

# docker 开机自启
# 使用ststemctl命令
systemctl enable docker

# 将Docker的docker.service服务移动到系统服务中

cp /usr/lib/systemd/system/docker.service /etc/systemd/system/
systemctl daemon-reload
systemctl restart docker

# 重启Docker后，会在/etc/systemd/system/multi-user.target.wants下自动生成符号链接
ll /etc/systemd/system/multi-user.target.wants/docker.service

# 避免时间不对 -v /etc/localtime:/etc/localtime




# 脚本手动生成
docker pull centos

wget http://nginx.org/download/nginx-1.15.6.tar.gz

docker build -t centos/c332030:v1 .
docker build -t centos/c332030:v1 /root/docker/images

docker run -d -p 80:80 \
        --name c332030 \
        -v /etc/localtime:/etc/localtime \
        centos/c332030:v1 /usr/local/nginx/sbin/nginx \
        -g "daemon off;"


# 定制容器，-d 一直运行
docker run -it \
        --name c332030 \
        --privileged \
        -v /sys/fs/cgroup:/sys/fs/cgroup \
        -p 80:80 \
        -p 8080:8080 \
        -p 443:443 \
        -p 21:21 \
        -p 22:22 \
        -p 6379:6379 \
        -p 3306:3306 \
        -p 8388:8388 \
        -d c332030/centos7:v1.0 \
        /usr/sbin/init \

docker run -it \
        --name c332030 \
        --privileged \
        -v /sys/fs/cgroup:/sys/fs/cgroup \
        -p 80:80 \
        -p 8080:8080 \
        -p 443:443 \
        -p 21:21 \
        -p 22:22 \
        -p 6379:6379 \
        -p 3306:3306 \
        -p 8388:8388 \
        -d centos \
        /usr/sbin/init \

docker run --name java -d java:latest /usr/sbin/init

docker exec -it c332030 /bin/bash


yum install -y \
		openssl* \
		openssh* \
		initscripts \

vi /etc/ssh/sshd_config

	PermitRootLogin yes  
	UsePAM no

systemctl enable sshd
systemctl start sshd

# systemctl enable ssh.service

chkconfig ssh on


#docker commit -m "change somth" -a "somebody info" container_id(docker ps -a获取id) 新镜像名字
docker commit -m "Base centos7 environment" -a "c332030 <c332030@gmail.com>" c332030 c332030/centos7:v1.0

sha256:c7bf218750c7c708b2797d7ef3a848ed1b2de0e0250145b78a97d45760741e77






# 镜像
docker search centos7
docker images
docker pull nginx

docker rmi nginx




# 创建容器
docker run -p 80:80 --name c332030 \
        -v $PWD/www:/www \
        -v $PWD/conf/nginx.conf:/etc/nginx/nginx.conf \
        -v $PWD/conf/c332030.com.crt:/etc/nginx/c332030.com.crt \
        -v $PWD/conf/c332030.com.key:/etc/nginx/c332030.com.key \
        -v $PWD/logs:/logs \
        -d nginx

image/overlay2/layerdb/mounts/b8ae4b5091119fdb452f5510ac8ba6fe287cfbccd596ecdb6d209c7158536bd5


# 日志
docker logs c332030

# 操作
docker start c332030
docker stop c332030
docker rm c332030



# 运行 bash
docker exec -it c332030 bash

docker cp conf/nginx.conf c332030:/etc/nginx/

docker cp c332030:/etc/nginx/ /etc/nginx/


# 退出的 container 中修改文件
docker inspect c332030
# 切换到 MergedDir 中的路径




docker container start 'c332030'
docker container stop 'c332030'



# 进入容器内部
docker attach c332030
