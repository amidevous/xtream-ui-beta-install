#!/bin/bash
if [ -f /etc/centos-release ]; then
    OS="CentOs"
    VERFULL=$(sed 's/^.*release //;s/ (Fin.*$//' /etc/centos-release)
    VER=${VERFULL:0:1} # return 6, 7 or 8
elif [ -f /etc/fedora-release ]; then
    OS="Fedora"
    VERFULL=$(sed 's/^.*release //;s/ (Fin.*$//' /etc/fedora-release)
    VER=${VERFULL:0:2} # return 6 or 7
elif [ -f /etc/lsb-release ]; then
    OS=$(grep DISTRIB_ID /etc/lsb-release | sed 's/^.*=//')
    VER=$(grep DISTRIB_RELEASE /etc/lsb-release | sed 's/^.*=//')
elif [ -f /etc/os-release ]; then
    OS=$(grep -w ID /etc/os-release | sed 's/^.*=//')
    VER=$(grep VERSION_ID /etc/os-release | sed 's/^.*"\(.*\)"/\1/' | head -n 1 | tail -n 1)
 else
    OS=$(uname -s)
    VER=$(uname -r)
fi
ARCH=$(uname -m)

echo "Detected : $OS  $VER  $ARCH"

if [[ "$OS" = "Ubuntu" && "$VER" = "18.04" ]] ; then
    echo "Ok."
else
    echo "Sorry, this OS is not supported by xtream-ui."
    exit 1
fi
read -e -p "Enter your root mysql password: " -i "$ROOT_PASSWORD" ROOT_PASSWORD
if [[ "$ROOT_PASSWORD" = "" ]]; then
    echo "mysql password required."
    exit 2
fi
DEBIAN_FRONTEND=noninteractive apt-get -y purge mariadb-client-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mariadb-client-core-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mariadb-common
DEBIAN_FRONTEND=noninteractive apt-get -y purge mariadb-server
DEBIAN_FRONTEND=noninteractive apt-get -y purge mariadb-server-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mariadb-server-core-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-client-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-client-core-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-server-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-server-core-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-apt-config
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-client
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-community-client
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-community-server
rm -rf /var/lib/mysql/
rm -rf /var/lib/mysql-*
rm -rf /etc/mysql
cat > /etc/apt/sources.list <<EOF
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu bionic-security main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-updates main restricted universe multiverse
deb-src mirror://mirrors.ubuntu.com/mirrors.txt bionic main restricted universe multiverse 
deb-src mirror://mirrors.ubuntu.com/mirrors.txt bionic-updates main restricted universe multiverse
deb-src http://security.ubuntu.com/ubuntu bionic-security main restricted universe multiverse
deb http://archive.canonical.com/ubuntu bionic partner
deb-src http://archive.canonical.com/ubuntu bionic partner
EOF
apt-get update
#apt-get -y install python-software-properties
DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common wget gnupg gnupg2
wget -O- "https://download.opensuse.org/repositories/home:/andykimpe:/ubuntu-$(lsb_release -sc)/xUbuntu_$(lsb_release -sr)/Release.key" | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/andykimpe:/ubuntu-'$(lsb_release -sc)'/xUbuntu_'$(lsb_release -sr)'/ /' > /etc/apt/sources.list.d/andykimpe.list
echo 'deb-src http://download.opensuse.org/repositories/home:/andykimpe:/ubuntu-'$(lsb_release -sc)'/xUbuntu_'$(lsb_release -sr)'/ /' >> /etc/apt/sources.list.d/andykimpe.list
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
echo "mariadb-server mysql-server/root_password password $ROOT_PASSWORD" | /usr/bin/debconf-set-selections
echo "mariadb-server mysql-server/root_password_again password $ROOT_PASSWORD" | /usr/bin/debconf-set-selections
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y install mariadb-server libxslt1-dev e2fsprogs wget mcrypt nscd htop python libcurl3 nano
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
DEBIAN_FRONTEND=noninteractive apt-get -y install libcurl4
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y install libapache2-mod-php5.6 php5.6-common php5.6-cli php5.6-mysql php5.6-gd php5.6-mcrypt php5.6-curl php-pear php5.6-imap php5.6-xmlrpc php5.6-xsl php5.6-intl php php-dev php5.6-dev
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $ROOT_PASSWORD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $ROOT_PASSWORD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $ROOT_PASSWORD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get -y install phpmyadmin php5.6-mbstring
update-alternatives --set php /usr/bin/php5.6
update-alternatives --set phar /usr/bin/phar5.6
update-alternatives --set phar.phar /usr/bin/phar.phar5.6
update-alternatives --set phpize /usr/bin/phpize5.6
update-alternatives --set php-config /usr/bin/php-config5.6
a2dismod php7.0
a2dismod php7.1
a2dismod php7.2
a2dismod php7.3
a2dismod php7.4
a2enmod php5.6
phpenmod -v 5.6 mcrypt
phpenmod -v 5.6 mbstring
service apache2 restart
cd /usr/share/
rm -rf /usr/share/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.xz
tar -xvf phpMyAdmin-4.9.5-all-languages.tar.xz
rm -f phpMyAdmin-4.9.5-all-languages.tar.xz
mv phpMyAdmin-4.9.5-all-languages phpmyadmin
chmod 777 -R phpmyadmin
chmod 777 -R phpmyadmin/*
ln -s /etc/phpmyadmin/config.inc.php /usr/share/phpmyadmin/config.inc.php
chmod 644 /etc/phpmyadmin/config.inc.php
systemctl stop mariadb
wget "https://github.com/amidevous/xtream-ui-beta-install/raw/master/etc/mysql/my.cnf" -O /etc/mysql/my.cnf
chmod 644 /etc/mysql/my.cnf
systemctl start mariadb
wget -q -O /tmp/libpng12.deb https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/libpng12-0_1.2.54-1ubuntu1_amd64.deb
dpkg -i /tmp/libpng12.deb
apt-get install -yf
apt-get -y install sshpass
rm -f /tmp/libpng12.deb
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
getent passwd xtreamcodes
adduser --system --shell /bin/false --group --disabled-login xtreamcodes 
mkdir -p /home/xtreamcodes
wget -O "/tmp/xtreamcodes.tar.gz" "https://github.com/amidevous/xtream-ui-beta-install/releases/download/1.0/mainnews.tar.gz"
#wget -O "/tmp/xtreamcodes.tar.gz" "https://github.com/amidevous/xtream-ui-beta-install/releases/download/1.0/main.tar.gz"
tar -zxvf "/tmp/xtreamcodes.tar.gz" -C "/home/xtreamcodes/"
rm -f /tmp/xtreamcodes.tar.gz
mysql -u root -p$ROOT_PASSWORD -e "DROP DATABASE IF EXISTS xtream_iptvpro; CREATE DATABASE IF NOT EXISTS xtream_iptvpro;"
mysql -u root -p$ROOT_PASSWORD xtream_iptvpro < /home/xtreamcodes/iptv_xtream_codes/database.sql
gen1=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w20 | head -n1)
gen2=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w10 | head -n1)
gen3=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w20 | head -n1)
mysql -u root -p$ROOT_PASSWORD -e "USE xtream_iptvpro; UPDATE settings SET live_streaming_pass = '$gen1', unique_id = '$gen2', crypt_load_balancing = '$gen3';"
ip=$(wget -qO- http://andy.kimpe.free.fr/ip.php)
net=$(route | grep default | awk '{print $8}')
version=$(lsb_release -ds)
mysql -u root -p$ROOT_PASSWORD -e "USE xtream_iptvpro; REPLACE INTO streaming_servers (id, server_name, domain_name, server_ip, vpn_ip, ssh_password, ssh_port, diff_time_main, http_broadcast_port, total_clients, system_os, network_interface, latency, status, enable_geoip, geoip_countries, last_check_ago, can_delete, server_hardware, total_services, persistent_connections, rtmp_port, geoip_type, isp_names, isp_type, enable_isp, boost_fpm, http_ports_add, network_guaranteed_speed, https_broadcast_port, https_ports_add, whitelist_ips, watchdog_data, timeshift_only) VALUES (1, 'Main Server', '$ip', '$ip', '', NULL, NULL, 0, 80, 1000, '$version', '$net', 0, 1, 0, '', 0, 0, '{}', 3, 0, 25462, 'low_priority', '', 'low_priority', 0, 1, '', 1000, 25463, '', '[\"127.0.0.1\",\"\"]', '{}', 0);"
timetamp=$(date +"%s")
mysql -u root -p$ROOT_PASSWORD -e "USE xtream_iptvpro; INSERT INTO reg_users (id, username, password, email, ip, date_registered, verify_key, last_login, member_group_id, verified, credits, notes, status, default_lang, reseller_dns, owner_id, override_packages, google_2fa_sec) VALUES ('1', 'admin', '\$6\$rounds=20000\$xtreamcodes\$XThC5OwfuS0YwS4ahiifzF14vkGbGsFF1w7ETL4sRRC5sOrAWCjWvQJDromZUQoQuwbAXAFdX3h3Cp3vqulpS0', 'admin@website.com', NULL, '$timetamp', NULL, NULL, '1', '1', '0', NULL, '1', '', '', '0', NULL, '');"
sqlpass=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w20 | head -n1)
mysql -u root -p$ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON xtream_iptvpro.* TO 'user_iptvpro'@'%' IDENTIFIED BY '$sqlpass' WITH GRANT OPTION; FLUSH PRIVILEGES;"
#wget https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/update-21.sql -O /home/xtreamcodes/iptv_xtream_codes/update-21.sql
#mysql -u root -p$ROOT_PASSWORD xtream_iptvpro < /home/xtreamcodes/iptv_xtream_codes/update-21.sql
cd
wget https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/encrypt.py -O encrypt.py
apt-get -y install dos2unix
dos2unix encrypt.py
sed -i 's|idedit|1|' encrypt.py
sed -i 's|mysqlpassword|'$sqlpass'|' encrypt.py
rm -f /home/xtreamcodes/iptv_xtream_codes/config
python encrypt.py ENCRYPT
if ! grep -q "/home/xtreamcodes/iptv_xtream_codes/" /etc/fstab; then
    cat >> /etc/fstab <<EOF
	tmpfs /home/xtreamcodes/iptv_xtream_codes/streams tmpfs defaults,noatime,nosuid,nodev,noexec,mode=1777,size=90% 0 0
	tmpfs /home/xtreamcodes/iptv_xtream_codes/tmp tmpfs defaults,noatime,nosuid,nodev,noexec,mode=1777,size=2G 0 0"
EOF
fi
if ! grep -q "xtreamcodes ALL = (root) NOPASSWD: /sbin/iptables" /etc/sudoers; then
    echo "xtreamcodes ALL = (root) NOPASSWD: /sbin/iptables" >> /etc/sudoers;
fi
if ! grep -q "xtreamcodes ALL = (root) NOPASSWD: /usr/bin/chattr" /etc/sudoers; then
    echo "xtreamcodes ALL = (root) NOPASSWD: /usr/bin/chattr" >> /etc/sudoers;
fi
if ! grep -q "xtreamcodes ALL = (root) NOPASSWD: /bin/chmod" /etc/sudoers; then
    echo "xtreamcodes ALL = (root) NOPASSWD: /bin/chmod" >> /etc/sudoers;
fi
fibash <(wget -qO- https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/install-service.sh)
systemctl disable xtreamcodes
rm -f /etc/init.d/xtreamcodes
rm -f /usr/bin/ffmpeg
mkdir -p /home/xtreamcodes/iptv_xtream_codes/tv_archive
mkdir -p /home/xtreamcodes/iptv_xtream_codes/adtools/backups
ln -s /home/xtreamcodes/iptv_xtream_codes/bin/ffmpeg /usr/bin/
chown xtreamcodes:xtreamcodes -R /home/xtreamcodes
chmod -R 0777 /home/xtreamcodes
chmod +x /home/xtreamcodes/iptv_xtream_codes/start_services.sh
chattr +i /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb
mount -a
chattr -i /etc/hosts
chmod 777 /etc/hosts
if ! grep -q "127.0.0.1    api.xtream-codes.com" /etc/hosts; then
    echo "127.0.0.1    api.xtream-codes.com" >> /etc/hosts;
fi
if ! grep -q "127.0.0.1    downloads.xtream-codes.com" /etc/hosts; then
    echo "127.0.0.1    downloads.xtream-codes.com" >> /etc/hosts;
fi
if ! grep -q "127.0.0.1    xtream-codes.com" /etc/hosts; then
    echo "127.0.0.1    xtream-codes.com" >> /etc/hosts;
fi
chattr +i /etc/hosts
wget -O /home/xtreamcodes/iptv_xtream_codes/nginx/conf/nginx.conf https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/nginx_main.conf
wget -O /etc/apache2/ports.conf https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/ports.conf
wget -O /etc/apache2/apache2.conf https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/apache2.conf
wget -O /etc/apache2/sites-available/000-default.conf https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/000-default.conf
service apache2 restart
#bash <(wget -qO- https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/update.sh)
#bash <(wget -qO- https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/updatebeta.sh)
bash <(wget -qO- https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/updatev3.sh)
chown xtreamcodes:xtreamcodes -R /home/xtreamcodes
chmod -R 0777 /home/xtreamcodes
mysql -u root -p$ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON xtream_iptvpro.* TO 'user_iptvpro'@'%' IDENTIFIED BY '$sqlpass' WITH GRANT OPTION; FLUSH PRIVILEGES;"
#wget -O /home/xtreamcodes/iptv_xtream_codes/admin/settings.php https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/settings.php.txt
#wget -O /home/xtreamcodes/iptv_xtream_codes/pytools/balancer.py https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/pytools/balancer.py
/home/xtreamcodes/iptv_xtream_codes/start_services.sh
rm -f /home/xtreamcodes/iptv_xtream_codes/admin/.update
rm -f cookies.txt encrypt.py
bash <(wget -qO- https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/install.sh)
bash <(wget -qO- https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/install-service.sh)
echo "panel installed"
echo "go to login http://$ip:25500/login.php"
