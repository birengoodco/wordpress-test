#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install augeas-tools
sudo apt-get -y install ufw
sudo apt-get -y install unattended-upgrades
sudo apt-get -y install apache2
sudo apt-get -y install mysql-client php5 php5-gd php5-mysql

#sudo augtool -bs set /files/etc/ssh/sshd_config/PermitRootLogin no
#sudo augtool -s set /files/etc/ssh/sshd_config/Port 223

#sudo ufw enable
#sudo ufw logging on
#sudo ufw allow 80/tcp
#sudo ufw allow 443/tcp
#sudo ufw allow 223/tcp
#sudo ufw default deny

echo 'APT::Periodic::Update-Package-Lists "1";' | sudo tee /etc/apt/apt.conf.d/10periodic
echo 'APT::Periodic::Download-Upgradeable-Packages "1";' | sudo tee -a /etc/apt/apt.conf.d/10periodic
echo 'APT::Periodic::AutocleanInterval "7";' | sudo tee -a /etc/apt/apt.conf.d/10periodic
echo 'APT::Periodic::Unattended-Upgrade "1";' | sudo tee -a /etc/apt/apt.conf.d/10periodic

#sudo a2enmod rewrite
#sudo a2enmod headers
#sudo a2enmod expires
#sudo a2enmod macro
#sudo a2enmod proxy
#sudo a2enmod proxy_http
#sudo a2enconf security
