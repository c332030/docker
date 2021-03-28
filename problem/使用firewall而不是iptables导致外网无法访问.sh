
nmcli connection modify docker0 connection.zone trusted

systemctl stop NetworkManager.service

firewall-cmd --permanent --zone=trusted --change-interface=docker0

systemctl start NetworkManager.service

nmcli connection modify docker0 connection.zone trusted

systemctl restart docker.service
