#!/bin/bash
read -e -p "Enter your root mysql password: " -i "$ROOT_PASSWORD" ROOT_PASSWORD
if [[ "$ROOT_PASSWORD" = "" ]]; then
    echo "mysql password required."
    exit 2
fi
echo 'deb [arch=amd64,arm64,ppc64el] http://mirror.lstn.net/mariadb/repo/10.3/ubuntu bionic main' > /etc/apt/sources.list.d/mariadb.list
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
apt-get update
debconf-set-selections <<< "mariadb-server mysql-server/root_password password $PASSWORD"
debconf-set-selections <<< "mariadb-server mysql-server/root_password_again password $PASSWORD"
DEBIAN_FRONTEND="noninteractive" apt-get install -y mariadb-server
systemctl stop mariadb
