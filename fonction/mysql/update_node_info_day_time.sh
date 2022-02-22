#!bin/bash

ip=$(cat /bin/wattouat/wattouat.conf | grep "ip")
ip=$(echo $ip | sed 's/.*=//')

id_node_info=$(cat /bin/wattouat/wattouat.conf | grep "id_server_info")
id_node_info=$(echo $id_node_info | sed 's/.*=//')

runtime="1 minute"
endtime=$(date -ud "$runtime" +%s)

while [[ $(date -u +%s) -le $endtime ]]
do
	day_time=$(uptime | sed 's/.*up//')
	day_time=$(echo $day_time | sed 's/,.*//')
	sleep 60
done

mysql -u admin -proot elisa -h $ip -e "UPDATE node_info SET day_time = '$day_time' WHERE id='$id_node_info';"