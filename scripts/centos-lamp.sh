#!/bin/bash

yum update -y --exclude=kernel

yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools

systemctl start httpd 
systemctl enable httpd
systemctl stop httpd	

rm -rf /var/www/html
ln -s /vagrant  /var/www/html



#PHP
yum install -y php php-cli php-common php-devel php-mysql

#MySQL
sudo yum list installed | grep mariadb
sudo yum install mariadb-server
sudo systemctl start mariadb 
sudo systemctl enable mariadb 

mysql -u root -e "SHOW DATABASES";

#Download starter content
cd /vagrant
sudo -u vagrant wget -q  https://raw.githubusercontent.com/Seetharama1231/vagrant-lamp/main/files/index.html
sudo -u vagrant wget -q   https://raw.githubusercontent.com/Seetharama1231/vagrant-lamp/main/files/info.php

systemctl start httpd 
