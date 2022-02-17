#!/bin/bash

mysql -u root -e "CREATE DATABASE elisa";
mysql -u root -proot elisa < data_dump.sql
sed -e '/bind/s/^/#/g' -i /etc/mysql/mariadb.conf.d/50-server.cnf
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;"
systemctl restart mariadb
