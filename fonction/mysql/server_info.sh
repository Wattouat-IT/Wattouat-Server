#!bin/bash

ip=$(cat /bin/wattouat/wattouat.conf | grep "ip")
ip=$(echo $ip | sed 's/.*=//')

host_name=$(cat /etc/hostname)

os=$(grep '^PRETTY' /etc/os-release)
os=$(echo $os | sed 's/.*=//' | sed 's/^.//' | sed 's/.$//')

ip_host=$(hostname -I | awk '{print $1}')

up_time=$(uptime -s | sed 's/.*up//')
up_time=$(echo $up_time | sed 's/,.*//' | sed 's/ .*//')

day_time=$(uptime | sed 's/.*up//')
day_time=$(echo $day_time | sed 's/,.*//')

mysql -u admin -proot elisa -e "INSERT INTO node_info (host_name, os, ip, date_add, up_time, day_time)  VALUES ('Server Wattouat : $host_name', '$os', '$ip_host', NOW(), '$up_time', '$day_time');"
id_node_info=$(mysql -u admin -proot elisa -h $ip -e "SELECT MAX( id ) FROM node_info;" | sed 's/[^0-9]//g')
id_node_info=$(echo $id_node_info)
echo "# ID of this Server into elisa database" >> /bin/wattouat/wattouat.conf
echo "id_server_info=$id_node_info" >> /bin/wattouat/wattouat.conf