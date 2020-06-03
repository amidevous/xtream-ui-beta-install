#!/bin/bash
apt-get install unzip e2fsprogs python-paramiko -y
#chattr -i /home/streamcreed/GeoLite2.mmdb
rm -rf /home/streamcreed/admin
rm -rf /home/streamcreed/pytools
rm -rf /home/streamcreed/adtools
wget "https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/release_18_official.zip" -O /tmp/update.zip
unzip /tmp/update.zip -d /tmp/update/
rm -rf /tmp/update/php
cp -rf /tmp/update/XtreamUI-master/* /home/streamcreed
rm -rf /tmp/update/
rm /tmp/update.zip
rm -rf /tmp/update
#chattr +i /home/streamcreed/GeoLite2.mmdb
killall nginx
killall nginx
killall php-fpm
cd /home/streamcreed/crons
rm -f pid_monitor.php
wget "https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/pid_monitor.zip" -O pid_monitor.zip
unzip pid_monitor.zip
rm -f pid_monitor.zip
sed -i 's|true|false|' /home/streamcreed/admin/header_sidebar.php
sed -i 's|} else { echo "checked "; }|}|' /home/streamcreed/admin/episode.php
sed -i 's|} else { echo "checked "; }|}|' /home/streamcreed/admin/movie.php
sed -i 's|$rSessionTimeout = 60;|$rSessionTimeout = 6000;|' /home/streamcreed/admin/session.php
sed -i 's|$rSessionTimeout*60|$rSessionTimeout*6000|' /home/streamcreed/admin/session.php
sudo chown -R streamcreed:streamcreed /home/streamcreed/
chmod -R 0777 /home/streamcreed
chmod +x /home/streamcreed/nginx_rtmp/sbin/nginx
chmod +x /home/streamcreed/nginx/sbin/nginx
/home/streamcreed/start_services.sh
wget https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/settings.php.txt -O /home/streamcreed/admin/settings.php
