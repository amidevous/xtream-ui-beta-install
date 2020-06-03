-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: php5.6
Binary: libapache2-mod-php5.6, libphp5.6-embed, php5.6, php5.6-cgi, php5.6-cli, php5.6-dev, php5.6-fpm, php5.6-phpdbg, php5.6-xsl, php5.6-odbc, php5.6-readline, php5.6-recode, php5.6-sqlite3, php5.6-xml, php5.6-sybase, php5.6-zip, php5.6-gd, php5.6-gmp, php5.6-ldap, php5.6-common, php5.6-intl, php5.6-mysql, php5.6-mcrypt, php5.6-snmp, php5.6-curl, php5.6-json, php5.6-pgsql, php5.6-mbstring, php5.6-enchant, php5.6-opcache, php5.6-imap, php5.6-bcmath, php5.6-tidy, php5.6-soap, php5.6-dba, php5.6-interbase, php5.6-xmlrpc, php5.6-pspell, php5.6-bz2
Architecture: any all
Version: 5.6.40-26+ubuntu18.04.1+deb.sury.org+1
Maintainer: Debian PHP Maintainers <team+pkg-php@tracker.debian.org>
Uploaders: Ondřej Surý <ondrej@debian.org>, Lior Kaplan <kaplan@debian.org>
Homepage: http://www.php.net/
Standards-Version: 4.5.0.0
Vcs-Browser: https://salsa.debian.org/php-team/php
Vcs-Git: https://salsa.debian.org/php-team/php.git -b master-5.6
Testsuite: autopkgtest
Testsuite-Triggers: apache2, wget
Build-Depends: apache2-dev (>= 2.4), autoconf (>= 2.63), automake, bison, chrpath, debhelper (>= 9.20150101), default-libmysqlclient-dev | libmysqlclient-dev, default-mysql-server <!nocheck> | mysql-server <!nocheck> | virtual-mysql-server <!nocheck>, dh-apache2, dh-systemd (>= 1.3) [linux-any], dpkg-dev (>= 1.16.1~), firebird-dev [!hurd-any !m68k !hppa !ppc64] | firebird2.5-dev [!hurd-any !m68k !hppa !ppc64] | firebird2.1-dev [!hurd-any !m68k !hppa !ppc64], flex, freetds-dev, libapparmor-dev, libapr1-dev (>= 1.2.7-8), libbz2-dev, libc-client-dev, libcurl4-openssl-dev | libcurl-dev, libdb-dev, libedit-dev (>= 2.11-20080614-4), libenchant-dev, libevent-dev (>= 1.4.11), libexpat1-dev (>= 1.95.2-2.1), libfreetype6-dev, libgcrypt20-dev (>> 1.6.3) | libgcrypt11-dev (<< 1.5.4), libgd-dev (>= 2.1.0) | libgd2-dev, libglib2.0-dev, libgmp3-dev, libicu-dev, libjpeg-dev | libjpeg62-dev, libkrb5-dev, libldap2-dev, libmagic-dev, libmcrypt-dev, libmhash-dev (>= 0.8.8), libnss-myhostname [linux-any], libonig-dev, libpam0g-dev, libpcre3-dev (>= 2:8.35), libpng-dev, libpq-dev, libpspell-dev, libqdbm-dev, librecode-dev, libsasl2-dev, libsnmp-dev, libsqlite3-dev, libssl-dev, libsystemd-dev [linux-any], libtidy-dev (>= 1:5.2.0), libtool (>= 2.2), libwebp-dev, libwrap0-dev, libxml2-dev, libxmlrpc-epi-dev, libxmltok1-dev, libxslt1-dev (>= 1.0.18), libzip-dev (>= 1.0.0), locales-all | language-pack-de, netbase, netcat-traditional, re2c, systemtap-sdt-dev [amd64 i386 powerpc armel armhf ia64], tzdata, unixodbc-dev, zlib1g-dev
Build-Conflicts: bind-dev, libxmlrpc-core-c3-dev
Package-List:
 libapache2-mod-php5.6 deb httpd optional arch=any
 libphp5.6-embed deb php optional arch=any
 php5.6 deb php optional arch=all
 php5.6-bcmath deb php optional arch=any
 php5.6-bz2 deb php optional arch=any
 php5.6-cgi deb php optional arch=any
 php5.6-cli deb php optional arch=any
 php5.6-common deb php optional arch=any
 php5.6-curl deb php optional arch=any
 php5.6-dba deb php optional arch=any
 php5.6-dev deb php optional arch=any
 php5.6-enchant deb php optional arch=any
 php5.6-fpm deb php optional arch=any
 php5.6-gd deb php optional arch=any
 php5.6-gmp deb php optional arch=any
 php5.6-imap deb php optional arch=any
 php5.6-interbase deb php optional arch=any
 php5.6-intl deb php optional arch=any
 php5.6-json deb php optional arch=any
 php5.6-ldap deb php optional arch=any
 php5.6-mbstring deb php optional arch=any
 php5.6-mcrypt deb php optional arch=any
 php5.6-mysql deb php optional arch=any
 php5.6-odbc deb php optional arch=any
 php5.6-opcache deb php optional arch=any
 php5.6-pgsql deb php optional arch=any
 php5.6-phpdbg deb php optional arch=any
 php5.6-pspell deb php optional arch=any
 php5.6-readline deb php optional arch=any
 php5.6-recode deb php optional arch=any
 php5.6-snmp deb php optional arch=any
 php5.6-soap deb php optional arch=any
 php5.6-sqlite3 deb php optional arch=any
 php5.6-sybase deb php optional arch=any
 php5.6-tidy deb php optional arch=any
 php5.6-xml deb php optional arch=any
 php5.6-xmlrpc deb php optional arch=any
 php5.6-xsl deb php optional arch=all
 php5.6-zip deb php optional arch=any
Checksums-Sha1:
 0403ae06273fe8c1acdbd45b181a8a53f4b0b4d7 12472236 php5.6_5.6.40.orig.tar.xz
 b12873c5a77b0352b6c012c2fc636f16108d4c7f 1419544 php5.6_5.6.40-26+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz
Checksums-Sha256:
 1369a51eee3995d7fbd1c5342e5cc917760e276d561595b6052b21ace2656d1c 12472236 php5.6_5.6.40.orig.tar.xz
 1aa54057d4f07989f579d952e05219c2da6bf95175d3c8c0a41b6bcf44949300 1419544 php5.6_5.6.40-26+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz
Files:
 c7dde3afb16ce7b761abf2805125d372 12472236 php5.6_5.6.40.orig.tar.xz
 73eb62224215dfc1c4f79116dc279dcd 1419544 php5.6_5.6.40-26+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEEahqteuW0AcbiWaeyVwZ7qhMUx/wFAl500EFfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDZB
MUFBRDdBRTVCNDAxQzZFMjU5QTdCMjU3MDY3QkFBMTMxNEM3RkMACgkQVwZ7qhMU
x/xokxAAhXeyiyOQ6jI7VhQ3IG+mFRhNKkHemhsfSTPxEa8uLCQJ78yF+Mej6FON
EuH+Mog0tTTVVTYahTMrUBVEvtcFy5Bd/OKCG9YI5pSzOX+uBqKCOZCJluX2LxZ2
JwJFGVrT6PaCd9Ww8HZxrKrTlHdvIwqqFfwOcZm91P5ySbL38QnovFbsVfLKl4B2
RK8AYDwwWzUiNXz2v4hHEfleNJc/vBpwSdocUhMU5Bc4WDzHZKCsDC4hTchqSpeM
l+uTQrKHH/DiX8mPNi78TpNok/XQnu7lav+vbCYCiDBy9GhR152a6cZ+g9nD0dxT
pv73EdeAfM7FRXOXZdpvQTCB1IuH71JOBkxLEKrk/B+yeEVVn15ofEbhkFCiMY0l
qyOKXk2nwA1Q96LuhNhPHUgHybhmZ2VAixSCv8JYluzdKGOimR6+n+FyWkpAK/Gx
KoNryNqSKjlSc3ns5iop6gHSXNxFzkSRo80OU+z5/LWA52Z0ec22fwjOd4tg7iAU
xRU4Eqiv9oDClxj5UkSNeo3oTKSQOB0bpQyTkgU+X7bdUnILMdhhchTZrvGJIJZ+
OFOmWj2N70/EeMvmoq9liqQv/Mj63fditUTauDb+DcUP3ga1GPaSOdYdkadTs2X0
Su1lJzWxTScC5VpQ6w7Frvo9+tKVNy5JDuA5/SzXA5XcaFqMfp8=
=aOyM
-----END PGP SIGNATURE-----
