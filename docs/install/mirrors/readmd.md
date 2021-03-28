
# 镜像

## aliyun
> https://esjoty1m.mirror.aliyuncs.com

```shell script
mkdir -p /etc/docker
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://esjoty1m.mirror.aliyuncs.com"]
}
EOF
systemctl daemon-reload
systemctl restart docker
```

# tencent cloud
> https://mirror.ccs.tencentyun.com

## docker center
> https://registry-1.docker.io
