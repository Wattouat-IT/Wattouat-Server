#!bin/bash 

ip=$(cat /bin/wattouat/wattouat.conf | grep "ip")
ip=$(echo $ip | sed 's/.*=//')

#adding the default values in the column:
mysql -u admin -proot elisa -h $ip -e "INSERT INTO user(name, first_name, pwd, email) VALUES ('admin', 'admin', PASSWORD('admin'), 'admin@wattouat.fr');"

