#!/bin/bash
apt-get install unzip e2fsprogs python-paramiko -y
chattr -i /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb
rm -rf /home/xtreamcodes/iptv_xtream_codes/admin
rm -rf /home/xtreamcodes/iptv_xtream_codes/pytools
rm -rf /home/xtreamcodes/iptv_xtream_codes/adtools
wget "https://github.com/amidevous/xtream-ui-beta-install/releases/download/1.0/xtream-ui-v3.zip" -O /tmp/update.zip
unzip /tmp/update.zip -d /tmp/update/
cp -rf /tmp/update/xtream-ui-v3/* /home/xtreamcodes/iptv_xtream_codes/
rm -rf /tmp/update/xtream-ui-v3
rm /tmp/update.zip
rm -rf /tmp/update
chattr +i /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb
killall nginx
killall nginx_rtmp
killall php-fpm
sed -i 's|} else { echo "checked "; }|}|' /home/xtreamcodes/iptv_xtream_codes/admin/episode.php
sed -i 's|} else { echo "checked "; }|}|' /home/xtreamcodes/iptv_xtream_codes/admin/movie.php
sed -i 's|$rSessionTimeout = 60;|$rSessionTimeout = 6000;|' /home/xtreamcodes/iptv_xtream_codes/admin/session.php
sed -i 's|$rSessionTimeout*60|$rSessionTimeout*6000|' /home/xtreamcodes/iptv_xtream_codes/admin/session.php
sudo chown -R xtreamcodes:xtreamcodes /home/xtreamcodes/
chattr +i /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb
chmod +x /home/xtreamcodes/iptv_xtream_codes/nginx_rtmp/sbin/nginx_rtmp
chmod +x /home/xtreamcodes/iptv_xtream_codes/nginx/sbin/nginx
/home/xtreamcodes/iptv_xtream_codes/start_services.sh
#wget https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/settings.php.txt -O /home/xtreamcodes/iptv_xtream_codes/admin/settings.php

