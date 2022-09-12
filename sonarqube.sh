#!/bin/bash

# Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
apt-cache policy docker-ce
sudo apt-get install -y docker-ce -y
sudo usermod -aG docker ubuntu
# sudo systemctl status docker
#Press CTRL+C or CTRL+Z to exit from the above command
#Install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#Change permissions
sudo chmod +x /usr/local/bin/docker-compose
#Check the version
docker-compose --version
#Install sonar
sudo sysctl -w vm.max_map_count=262144
mkdir sonar
cd sonar
wget https://raw.githubusercontent.com/awstechguide/devops/master/docker-compose.yml
sudo docker-compose up
