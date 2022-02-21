# Wattouat Server

## Prerequisites

- Internet connection
- Git (apt install git) 
- Be root (su) 

## Stable version

Supported version :

- ![Debian](https://img.shields.io/badge/Debian-D70A53?style=for-the-badge&logo=debian&logoColor=white)
    - [X] Bullseye 
        - Status : Stable
    - [X] Buster
        - Status : Stable
    - [ ] Strech
        - Status : Not tested

- ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
    - [X] 20.04 LTS
        - Status : Stable
    - [X] 18.04.1 LTS
        - Status : Stable

## Clone the repositorie

``` shell 
git clone https://github.com/Wattouat-IT/Wattouat-Server.git
```

## Edit the configuration file

Edit the file ``` wattouat.conf```

 - ip : your local ip who run the database

## Server installation

Executing the script

``` shell 
bash wattouat_server_install.sh
exec bash
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

Default user and password is root / root on your host machine or admin / root on remote access.

``` shell
mysql -uroot -proot elisa -h <ip_address>
```

See all tables of elisa database

``` mysql
show tables;
```

## Command 

- wattouat_user : add a new user

## Access to the website

http://<server_ip>/wattouat/

## Defaut user admin

Name and password is ```admin admin```

## Uninstall Wattouat Server

Go into ```/bin/wattouat/fonction```

Execute file ```wattouat_uninstall.sh```