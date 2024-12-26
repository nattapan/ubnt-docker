echo "send dhcp-client-identifier = hardware;" >>/etc/dhcp/dhclient.conf
rm /var/lib/dhcp/*
systemctl restart systemd-networkd
