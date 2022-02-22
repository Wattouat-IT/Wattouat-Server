#!bin/bash

ip=$(cat /bin/wattouat/wattouat.conf | grep "ip")
ip=$(echo $ip | sed 's/.*=//')

id_node_info=$(cat /bin/wattouat/wattouat.conf | grep "id_server_info")
id_node_info=$(echo $id_node_info | sed 's/.*=//')

up_time=$(uptime -s | sed 's/.*up//')
up_time=$(echo $up_time | sed 's/,.*//' | sed 's/ .*//')

mysql -u admin -proot elisa -h $ip -e "UPDATE node_info SET up_time = '$up_time' WHERE id='$id_node_info';"

