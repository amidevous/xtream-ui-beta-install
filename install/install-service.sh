#!/bin/bash
update-rc.d -f xtreamcodes remove
systemctl disable xtreamcodes
rm -f /etc/init.d/xtreamcodes
apt-get -y install cron
if ! grep -q "/home/xtreamcodes/iptv_xtream_codes/start_services.sh" /etc/crontab; then
    echo "@reboot root /home/xtreamcodes/iptv_xtream_codes/start_services.sh" >> /etc/crontab
EOF
fi
systemctl enable cron
/home/xtreamcodes/iptv_xtream_codes/start_services.sh
