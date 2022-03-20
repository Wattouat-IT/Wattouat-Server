#!bin/bash

ip=$(cat /bin/wattouat/wattouat.conf | grep "ip")
ip=$(echo $ip | sed 's/.*=//')

echo "Enter your surname :"
read name

echo "Enter your first name :"
read firstname

echo "Enter your password :"
read password

echo "Enter your mail :"
read mail

mysql -u admin -proot elisa -h $ip -e "INSERT INTO user(name, first_name, pwd, email) VALUES ('$name', '$firstname', PASSWORD('$password'), '$mail');"
