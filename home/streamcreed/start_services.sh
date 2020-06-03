#! /bin/bash
pkill -u streamcreed
sleep 1
kill $(ps aux | grep -i 'streamcreed' | grep -v grep | grep -v 'start_services.sh' | awk '{print $2}') 2>/dev/null
sleep 1
rm -rf /home/streamcreed/tmp/datafolder 2>/dev/null
echo 'nameserver 8.8.8.8' > /etc/resolv.conf
sudo -u streamcreed /home/streamcreed/php/bin/php /home/streamcreed/crons/setup_cache.php
sudo -u streamcreed /home/streamcreed/php/bin/php /home/streamcreed/tools/signal_receiver.php >/dev/null 2>/dev/null &
sudo -u streamcreed /home/streamcreed/php/bin/php /home/streamcreed/tools/pipe_reader.php >/dev/null 2>/dev/null &
sudo -u streamcreed /home/streamcreed/php/bin/php /home/streamcreed/tools/watchdog_data.php >/dev/null 2>/dev/null &
chown -R streamcreed:streamcreed /sys/class/net
service nscd restart
/home/streamcreed/nginx_rtmp/sbin/nginx
/home/streamcreed/nginx/sbin/nginx
nohup /home/streamcreed/nginxConfig.sh >/dev/null 2>/dev/null &
start-stop-daemon --chuid streamcreed --start --quiet --pidfile /home/streamcreed/php/pids/1S85Ll.pid --exec /home/streamcreed/php/sbin/php-fpm -- --daemonize --fpm-config /home/streamcreed/php/etc/1S85Ll.conf
start-stop-daemon --chuid streamcreed --start --quiet --pidfile /home/streamcreed/php/pids/PCAyrH.pid --exec /home/streamcreed/php/sbin/php-fpm -- --daemonize --fpm-config /home/streamcreed/php/etc/PCAyrH.conf
start-stop-daemon --chuid streamcreed --start --quiet --pidfile /home/streamcreed/php/pids/iz7sKs.pid --exec /home/streamcreed/php/sbin/php-fpm -- --daemonize --fpm-config /home/streamcreed/php/etc/iz7sKs.conf
