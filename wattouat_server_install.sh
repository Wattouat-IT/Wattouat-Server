#!/bin/bash
echo ""
echo "/******************************************************/"
echo "/*                   WATTOUAT PROJECT                 */"
echo -e "/******************************************************/\n"

sleep 2

# Install requierements
bash requierement.sh

# Create directory for Wattouat
mkdir /bin/wattouat
mkdir /var/log/wattouat_server

# Config file
cp wattouat.conf /bin/wattouat/

# Up Service
cp wattouat_server.service /etc/systemd/system
cp wattouat_server_service.sh /bin/wattouat/
chmod +x /bin/wattouat/wattouat_server_service.sh

# Function
cp -R fonction /bin/wattouat/

# Database
bash db.sh

sleep 2

# Default parameters
## Function

## Mysql
bash /bin/wattouat/fonction/mysql/admin_user.sh
bash /bin/wattouat/fonction/mysql/server_info.sh

# Website
cp -R wattouat /var/www/html

echo ""
echo "/******************************************************/"
echo "/*                       Finish                        */"
echo -e "/******************************************************/\n"