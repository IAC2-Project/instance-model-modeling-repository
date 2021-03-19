#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt -y update
apt -y install wget
wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.14-1_all.deb
dpkg -i mysql-apt-config_0.8.14-1_all.deb
echo "mysql-server mysql-server/root_password password ${ROOT_PASSWORD}" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password ${ROOT_PASSWORD}" | debconf-set-selections
apt -y install mysql-server
sed -i "s/.*bind-address.*=.*127\.0\.0\.1.*/bind-address = 0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i "s/3306/${PORT:-3306}/g" /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl stop mysql
systemctl daemon-reload
systemctl enable mysql
exit 0
