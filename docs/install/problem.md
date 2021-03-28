
# docker 安装问题

## 无法访问内网 Host is unreachable
firewall 添加 docker 网段信任

```shell script
docker exec -it nginx ip addr

firewall-cmd --permanent --zone=trusted --add-interface=docker0
firewall-cmd --reload

```
