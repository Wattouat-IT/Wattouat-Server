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

# Config file
cp wattouat.conf /bin/wattouat/

# Up Service
cp wattouat_server.service /etc/systemd/system
cp wattouat_server_service.sh /bin/wattouat/
chmod +x /bin/wattouat/wattouat_server_service.sh

# Function
cp -R fonction /bin/wattouat/

# Command
echo "alias wattouat_user='bash /bin/wattouat/fonction/mysql/add_user.sh'" >> ~/.bashrc

# Database
bash db.sh

sleep 2

# Default parameters
bash /bin/wattouat/fonction/mysql/admin_user.sh

# Website
cp -R wattouat /var/www/html

echo ""
echo "/******************************************************/"
echo "/*                       Finish                        */"
echo -e "/******************************************************/\n"