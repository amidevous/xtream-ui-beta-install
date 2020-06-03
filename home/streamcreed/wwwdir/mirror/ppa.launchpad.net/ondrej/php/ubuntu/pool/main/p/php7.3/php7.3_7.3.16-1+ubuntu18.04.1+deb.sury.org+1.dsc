-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: php7.3
Binary: libapache2-mod-php7.3, libphp7.3-embed, php7.3, php7.3-cgi, php7.3-cli, php7.3-dev, php7.3-fpm, php7.3-phpdbg, php7.3-xsl, php7.3-bcmath, php7.3-bz2, php7.3-common, php7.3-curl, php7.3-dba, php7.3-enchant, php7.3-gd, php7.3-gmp, php7.3-imap, php7.3-interbase, php7.3-intl, php7.3-json, php7.3-ldap, php7.3-mbstring, php7.3-mysql, php7.3-odbc, php7.3-opcache, php7.3-pgsql, php7.3-pspell, php7.3-readline, php7.3-recode, php7.3-snmp, php7.3-soap, php7.3-sqlite3, php7.3-sybase, php7.3-tidy, php7.3-xml, php7.3-xmlrpc, php7.3-zip
Architecture: any all
Version: 7.3.16-1+ubuntu18.04.1+deb.sury.org+1
Maintainer: Debian PHP Maintainers <team+pkg-php@tracker.debian.org>
Uploaders: Ondřej Surý <ondrej@debian.org>, Lior Kaplan <kaplan@debian.org>
Homepage: http://www.php.net/
Standards-Version: 4.5.0.0
Vcs-Browser: https://salsa.debian.org/php-team/php
Vcs-Git: https://salsa.debian.org/php-team/php.git -b master-7.3
Testsuite: autopkgtest
Testsuite-Triggers: apache2, wget
Build-Depends: apache2-dev (>= 2.4), autoconf (>= 2.63), automake, bison, chrpath, debhelper (>= 9.20150101), default-libmysqlclient-dev | libmysqlclient-dev, default-mysql-server <!nocheck> | mysql-server <!nocheck> | virtual-mysql-server <!nocheck>, dh-apache2, dh-systemd (>= 1.3) [linux-any], dpkg-dev (>= 1.16.1~), firebird-dev [!hurd-any !m68k !hppa !ppc64] | firebird2.5-dev [!hurd-any !m68k !hppa !ppc64] | firebird2.1-dev [!hurd-any !m68k !hppa !ppc64], flex, freetds-dev, libapparmor-dev, libapr1-dev (>= 1.2.7-8), libargon2-dev | libargon2-0-dev, libbz2-dev, libc-client-dev, libcurl4-openssl-dev | libcurl-dev, libdb-dev, libedit-dev (>= 2.11-20080614-4), libenchant-dev, libevent-dev (>= 1.4.11), libexpat1-dev (>= 1.95.2-2.1), libfreetype6-dev, libgcrypt20-dev (>> 1.6.3) | libgcrypt11-dev (<< 1.5.4), libgd-dev (>= 2.1.0) | libgd2-dev, libglib2.0-dev, libgmp3-dev, libicu-dev, libjpeg-dev | libjpeg62-dev, libkrb5-dev, libldap2-dev, liblmdb-dev, libmagic-dev, libmhash-dev (>= 0.8.8), libnss-myhostname [linux-any], libonig-dev, libpam0g-dev, libpcre2-dev (>= 10.30), libpng-dev, libpq-dev, libpspell-dev, libqdbm-dev, librecode-dev, libsasl2-dev, libsnmp-dev, libsodium-dev, libsqlite3-dev, libssl-dev, libsystemd-dev [linux-any], libtidy-dev (>= 1:5.2.0), libtool (>= 2.2), libwebp-dev, libwrap0-dev, libxml2-dev, libxmlrpc-epi-dev, libxmltok1-dev, libxslt1-dev (>= 1.0.18), libzip-dev (>= 1.0.0), locales-all | language-pack-de, netbase, netcat-traditional, re2c, systemtap-sdt-dev [amd64 i386 powerpc armel armhf ia64], tzdata, unixodbc-dev, zlib1g-dev
Build-Conflicts: bind-dev, libxmlrpc-core-c3-dev
Package-List:
 libapache2-mod-php7.3 deb httpd optional arch=any
 libphp7.3-embed deb php optional arch=any
 php7.3 deb php optional arch=all
 php7.3-bcmath deb php optional arch=any
 php7.3-bz2 deb php optional arch=any
 php7.3-cgi deb php optional arch=any
 php7.3-cli deb php optional arch=any
 php7.3-common deb php optional arch=any
 php7.3-curl deb php optional arch=any
 php7.3-dba deb php optional arch=any
 php7.3-dev deb php optional arch=any
 php7.3-enchant deb php optional arch=any
 php7.3-fpm deb php optional arch=any
 php7.3-gd deb php optional arch=any
 php7.3-gmp deb php optional arch=any
 php7.3-imap deb php optional arch=any
 php7.3-interbase deb php optional arch=any
 php7.3-intl deb php optional arch=any
 php7.3-json deb php optional arch=any
 php7.3-ldap deb php optional arch=any
 php7.3-mbstring deb php optional arch=any
 php7.3-mysql deb php optional arch=any
 php7.3-odbc deb php optional arch=any
 php7.3-opcache deb php optional arch=any
 php7.3-pgsql deb php optional arch=any
 php7.3-phpdbg deb php optional arch=any
 php7.3-pspell deb php optional arch=any
 php7.3-readline deb php optional arch=any
 php7.3-recode deb php optional arch=any
 php7.3-snmp deb php optional arch=any
 php7.3-soap deb php optional arch=any
 php7.3-sqlite3 deb php optional arch=any
 php7.3-sybase deb php optional arch=any
 php7.3-tidy deb php optional arch=any
 php7.3-xml deb php optional arch=any
 php7.3-xmlrpc deb php optional arch=any
 php7.3-xsl deb php optional arch=all
 php7.3-zip deb php optional arch=any
Checksums-Sha1:
 2571100c75b24aaa913339eafee3e3c8f410cc07 12113688 php7.3_7.3.16.orig.tar.xz
 6938a5de4f422c32880ff7f1c93342d408779b79 64896 php7.3_7.3.16-1+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz
Checksums-Sha256:
 91aaee3dbdc71b69b4f3292f9d99211172a2fa926c3f3bbdb0e85dab03dd2bcb 12113688 php7.3_7.3.16.orig.tar.xz
 3b3f8a3c3c1f094d9f6ae8411fd0081139d8a9d0bb9c8106b4b2881e55ec1906 64896 php7.3_7.3.16-1+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz
Files:
 9aad7c60fded1e0d76b803e6ff5004bb 12113688 php7.3_7.3.16.orig.tar.xz
 031588cb3c64d8d6676953104a1dc064 64896 php7.3_7.3.16-1+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEEahqteuW0AcbiWaeyVwZ7qhMUx/wFAl50yndfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDZB
MUFBRDdBRTVCNDAxQzZFMjU5QTdCMjU3MDY3QkFBMTMxNEM3RkMACgkQVwZ7qhMU
x/wOwA/+NZGBu5u6iqsdnsC/ORCjtcz2wRdLI1r2q17Qt7qG0mLf4ILkFbVXoiLF
rvfArfWBZkuAgNa6VUYrv9IUH6DaZWhMIaW8gZVIz6buvB4EbO28Z6LAhKWFWhsB
CdkIgOEEKShn0LjO5hXWhbO+RMfy+2mO3sAq1AWh3bmaqrp7hjB+zEjJ/VJ9ef6E
gz2XquH3RdaGuOuxByC9WJlPDlVeh/b6TnS7Fc29QX1iS3RPwudHE4G6UPkGOJPC
Oom2f4ZWp6Gw79igozUU8dEkFRwDVtcXTR4aaGB+nZV4+HuZIye7VJJn7UHZzw1j
vXYDcerD6HOhzrEJnOr6laQWuzS/boHKQlqUdDGLm6C+RdwnW1G21FcbBf0OsQVi
U46EtL6X2UD0xtygoN7teji3W68XKaDGMoi+ymn47ilGRjeYYVTaOMFST8xTJzno
+OdS/n4aLKnRxcjjidwdsRIDFON7DxPt5Et+CgHTXEBUWxMeRcw5UODCCu9J2xDm
pp+KDuW5Uiv0h1r/oeiAAvdiRtDlBbBxlYVqe1UVoxp44U14J6qPOFxztsUfnEkM
uHvh74VFCrGZGwiDXamY1Bu03fA238BUNHT5y8llS9/m4Yi0pqKuPPBy1lgQdkZA
VeNSjKppLnf+f0bC0ezuQceT9FClWyxI0aSO+xwIOfgiQJMexlE=
=+7ED
-----END PGP SIGNATURE-----
