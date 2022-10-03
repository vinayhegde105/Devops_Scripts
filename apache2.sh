#!/bin/bash

sudo apt update
sudo apt install apache2 -y
sudo ufw app list
sudo ufw allow 'Apache'
sudo systemctl status apache2
sudo chown azureuser:azureuser /var/www/html
# cd /var/www/html
# rm index.html
