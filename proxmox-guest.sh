echo "need Super User Level before run this script"
echo "set TimeZone to Bangkok and force NTP client to Thai server"
sudo timedatectl set-timezone Asia/Bangkok
sudo cp -f timesyncd.conf /etc/systemd/timesyncd.conf
sudo systemctl restart systemd-timesyncd
sudo date 
echo "set to not ask for restart service after install or upgrade"
sudo echo '$nrconf{restart} = 'a';' >>   /etc/needrestart/needrestart.conf 
#----------------------------------------------------
echo "send dhcp-client-identifier = hardware;" >>/etc/dhcp/dhclient.conf
rm /var/lib/dhcp/*
systemctl restart systemd-networkd
#----------------------------------------------------
echo "upgrade and install docker" 
sudo apt update && sudo apt dist-upgrade -y
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    mc \
    ncdu \
    nmon \
    qemu-guest-agent
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
   sudo apt-get update
   sudo apt-get install -y docker-ce docker-ce-cli containerd.io
   
   sudo curl -L "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   sudo chmod +rx /usr/local/bin/docker-compose
   sudo docker pull portainer/portainer-ce:latest
   sudo docker volume create portainer_data 
   sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
   #sudo docker run -d -p 8000:8000 -p 8080:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data --restart  always portainer/portainer-ce
   sudo docker ps
