-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: php7.0
Binary: libapache2-mod-php7.0, libphp7.0-embed, php7.0, php7.0-cgi, php7.0-cli, php7.0-dev, php7.0-fpm, php7.0-phpdbg, php7.0-xsl, php7.0-odbc, php7.0-readline, php7.0-recode, php7.0-sqlite3, php7.0-xml, php7.0-sybase, php7.0-zip, php7.0-gd, php7.0-gmp, php7.0-ldap, php7.0-common, php7.0-intl, php7.0-mysql, php7.0-mcrypt, php7.0-snmp, php7.0-curl, php7.0-json, php7.0-pgsql, php7.0-mbstring, php7.0-enchant, php7.0-opcache, php7.0-imap, php7.0-bcmath, php7.0-tidy, php7.0-soap, php7.0-dba, php7.0-interbase, php7.0-xmlrpc, php7.0-pspell, php7.0-bz2
Architecture: any all
Version: 7.0.33-26+ubuntu18.04.1+deb.sury.org+1
Maintainer: Debian PHP Maintainers <team+pkg-php@tracker.debian.org>
Uploaders: Ondřej Surý <ondrej@debian.org>, Lior Kaplan <kaplan@debian.org>
Homepage: http://www.php.net/
Standards-Version: 4.5.0.0
Vcs-Browser: https://salsa.debian.org/php-team/php
Vcs-Git: https://salsa.debian.org/php-team/php.git -b master-7.0
Testsuite: autopkgtest
Testsuite-Triggers: apache2, wget
Build-Depends: apache2-dev (>= 2.4), autoconf (>= 2.63), automake, bison, chrpath, debhelper (>= 9.20150101), default-libmysqlclient-dev | libmysqlclient-dev, default-mysql-server <!nocheck> | mysql-server <!nocheck> | virtual-mysql-server <!nocheck>, dh-apache2, dh-systemd (>= 1.3) [linux-any], dpkg-dev (>= 1.16.1~), firebird-dev [!hurd-any !m68k !hppa !ppc64] | firebird2.5-dev [!hurd-any !m68k !hppa !ppc64] | firebird2.1-dev [!hurd-any !m68k !hppa !ppc64], flex, freetds-dev, libapparmor-dev, libapr1-dev (>= 1.2.7-8), libbz2-dev, libc-client-dev, libcurl4-openssl-dev | libcurl-dev, libdb-dev, libedit-dev (>= 2.11-20080614-4), libenchant-dev, libevent-dev (>= 1.4.11), libexpat1-dev (>= 1.95.2-2.1), libfreetype6-dev, libgcrypt20-dev (>> 1.6.3) | libgcrypt11-dev (<< 1.5.4), libgd-dev (>= 2.1.0) | libgd2-dev, libglib2.0-dev, libgmp3-dev, libicu-dev, libjpeg-dev | libjpeg62-dev, libkrb5-dev, libldap2-dev, libmagic-dev, libmcrypt-dev, libmhash-dev (>= 0.8.8), libnss-myhostname [linux-any], libonig-dev, libpam0g-dev, libpcre3-dev (>= 2:8.35), libpng-dev, libpq-dev, libpspell-dev, libqdbm-dev, librecode-dev, libsasl2-dev, libsnmp-dev, libsqlite3-dev, libssl-dev, libsystemd-dev [linux-any], libtidy-dev (>= 1:5.2.0), libtool (>= 2.2), libwebp-dev, libwrap0-dev, libxml2-dev, libxmlrpc-epi-dev, libxmltok1-dev, libxslt1-dev (>= 1.0.18), libzip-dev (>= 1.0.0), locales-all | language-pack-de, netbase, netcat-traditional, re2c, systemtap-sdt-dev [amd64 i386 powerpc armel armhf ia64], tzdata, unixodbc-dev, zlib1g-dev
Build-Conflicts: bind-dev, libxmlrpc-core-c3-dev
Package-List:
 libapache2-mod-php7.0 deb httpd optional arch=any
 libphp7.0-embed deb php optional arch=any
 php7.0 deb php optional arch=all
 php7.0-bcmath deb php optional arch=any
 php7.0-bz2 deb php optional arch=any
 php7.0-cgi deb php optional arch=any
 php7.0-cli deb php optional arch=any
 php7.0-common deb php optional arch=any
 php7.0-curl deb php optional arch=any
 php7.0-dba deb php optional arch=any
 php7.0-dev deb php optional arch=any
 php7.0-enchant deb php optional arch=any
 php7.0-fpm deb php optional arch=any
 php7.0-gd deb php optional arch=any
 php7.0-gmp deb php optional arch=any
 php7.0-imap deb php optional arch=any
 php7.0-interbase deb php optional arch=any
 php7.0-intl deb php optional arch=any
 php7.0-json deb php optional arch=any
 php7.0-ldap deb php optional arch=any
 php7.0-mbstring deb php optional arch=any
 php7.0-mcrypt deb php optional arch=any
 php7.0-mysql deb php optional arch=any
 php7.0-odbc deb php optional arch=any
 php7.0-opcache deb php optional arch=any
 php7.0-pgsql deb php optional arch=any
 php7.0-phpdbg deb php optional arch=any
 php7.0-pspell deb php optional arch=any
 php7.0-readline deb php optional arch=any
 php7.0-recode deb php optional arch=any
 php7.0-snmp deb php optional arch=any
 php7.0-soap deb php optional arch=any
 php7.0-sqlite3 deb php optional arch=any
 php7.0-sybase deb php optional arch=any
 php7.0-tidy deb php optional arch=any
 php7.0-xml deb php optional arch=any
 php7.0-xmlrpc deb php optional arch=any
 php7.0-xsl deb php optional arch=all
 php7.0-zip deb php optional arch=any
Checksums-Sha1:
 fef2bfd1285325a4ac2c367fab6a9062c144a790 12033040 php7.0_7.0.33.orig.tar.xz
 a296a4073cb55ede98d22b486f3f664c23f1597e 841580 php7.0_7.0.33-26+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz
Checksums-Sha256:
 ab8c5be6e32b1f8d032909dedaaaa4bbb1a209e519abb01a52ce3914f9a13d96 12033040 php7.0_7.0.33.orig.tar.xz
 8753100e0a018a70cfe8770e162e965827ec94d0d9bf23ffd5f266742bc555ea 841580 php7.0_7.0.33-26+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz
Files:
 a6d7c355d023301a1a9ec8b4f32a4856 12033040 php7.0_7.0.33.orig.tar.xz
 b600c5e63aeafa7532eb26106c4532f6 841580 php7.0_7.0.33-26+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEEahqteuW0AcbiWaeyVwZ7qhMUx/wFAl502rtfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDZB
MUFBRDdBRTVCNDAxQzZFMjU5QTdCMjU3MDY3QkFBMTMxNEM3RkMACgkQVwZ7qhMU
x/ybWA/9FfvLTdauZoiXa171U0EJIoR4c17zAIK9qiIiUJ4j38ndEuC4E+jBxe+T
J3TW6sqA33vvSqJAKA/hPl1/ZqcndFy3906Kz6CAkvPDAzPN3PG3nxgJhpfPw3l/
3HeiHnmj5dyaN/MdIi18QetduDtO2rtUkxi33qCgUh9DCC324QHXlTcPJekMUQg4
x5kEVPp2S9Um+11dGvkwsT1S17uMjEKmOkOfWVLKV6xFw8D6tk6hL117xY5XY3xg
+LD/EFV8KC5ZHEQCISmJrkA+G7VwwUpvFEa1BfwSW4LaW8jrOZ0F74fE96tj2KaT
RbUfHZ8f1r3SmG7AKG/gHnflAltj1kcn/fXIZKvu3K5PZnXxZCKiD/UVksvyZv5Q
i3dt041eboKD8fKbPIzIZB8NeqBgFHixIip2G1YqkHh6VLbhlt+kbmgOrnTX6Qgq
GWlRp6fgxnhBHdISaO3jrhWzYDF0trNzwzNY851mxOnS1X2FeHEvrtr++3JwQEw0
/DoUe1f6FLlu3QJaOnGMgyDz7Kuwf6XJ1Idfs7ZxDq+hV5WY4tnSf0LFnOhE6Do4
7txAkZJPVLh21OEbGm21arUjHo8VCUOPjPnNuQyCxIEbxKqFtwBj5dh3dnNuFwsK
faLMumKw5DxWjzPU0w5KIKREZHH1ZypmdYVcv1JnNZkfe+2JLuo=
=hcou
-----END PGP SIGNATURE-----
