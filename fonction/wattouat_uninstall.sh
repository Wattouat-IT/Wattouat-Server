#!/bin/bash
echo "DANGER ZONE" 
echo "Are you sure to uninstall Wattouat Server"
echo "  1)YES"
echo "  2)NO"

read n
case $n in
  1) echo "Wattouat uninstall"
    systemctl stop wattouat_server
	  ip=$(cat /bin/wattouat/wattouat.conf | grep "ip")
    ip=$(echo $ip | sed 's/.*=//')   

	  mysql -u admin -proot elisa -h $ip -e "DROP DATABASE elisa;"
	  
	  rm -rf /etc/systemd/system/wattouat_server.service
	  rm -rf /bin/wattouat
	  rm -rf /var/log/wattouat_server/
	  ;;
  2) echo "Exit"
	  exit
	  ;;
  *) echo "invalid option";;
esac