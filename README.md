# Wattouat-Server

The first release was only tested and developed on Debian Buster. Don't try with a other because we don't know if it is still stable. 

## Prerequisites

- Debian buster 
- Internet connection
- Git (apt install git) 
- Be root (su) 

## Server installation

``` shell 
git clone https://github.com/Wattouat-IT/Wattouat-Server.git
cd Wattouat-Server
./wattouat_server_install.sh
```

## Service Wattouat

Launch the service

Start the service at boot time

``` shell 
systemctl enable wattouat_server
```

``` shell 
systemctl start wattouat_server
```

## Access to the database

The name of the database is Elisa.

To see if the data base has been created

Default user and password is root / root on your host machine.

``` shell
mysql -uroot -proot elisa
```

See all tables of elisa database

``` mysql
show tables;
```

## Access to the website

http://<server_ip>/wattouat/
