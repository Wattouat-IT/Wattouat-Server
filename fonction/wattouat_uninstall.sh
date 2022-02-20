#!/bin/bash
echo "DANGER ZONE" 
echo "Are you sure to uninstall Wattouat"
echo "  1)YES"
echo "  2)NO"

read n
case $n in
  1) echo "Wattouat uninstall"
	  ip=$(cat /bin/wattouat/wattouat.conf | grep "ip")
          ip=$(echo $ip | sed 's/.*=//')   

	  mysql -u admin -proot elisa -h $ip -e "DROP DATABASE elisa;"
	  
          sed '/wattouat_user/d' ~/.bashrc
	  
	  rm -rf /var/www/html/wattouat
	  rm -rf /etc/systemd/system/wattouat_server.service
	  rm -rf /bin/wattouat
	  ;;
  2) echo "Exit"
	  exit
	  ;;
  *) echo "invalid option";;
esac