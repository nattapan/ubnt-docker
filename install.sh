echo "need Super User Level before run this script"
sudo apt update && sudo apt upgrade -y
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    mc
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
   sudo apt-get update
   sudo apt-get install -y docker-ce docker-ce-cli containerd.io
   
   sudo curl -L "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   sudo chmod +rx /usr/local/bin/docker-compose
   sudo docker pull portainer/portainer
   sudo docker volume create portainer_data 
   sudo docker run -d -p 8000:8000 -p 80:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data --restart  always portainer/portainer
   sudo docker ps
