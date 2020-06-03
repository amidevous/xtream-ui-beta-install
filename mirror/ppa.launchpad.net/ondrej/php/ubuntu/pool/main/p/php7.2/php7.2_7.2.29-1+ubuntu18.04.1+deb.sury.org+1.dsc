-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: php7.2
Binary: libapache2-mod-php7.2, libphp7.2-embed, php7.2, php7.2-cgi, php7.2-cli, php7.2-dev, php7.2-fpm, php7.2-phpdbg, php7.2-xsl, php7.2-odbc, php7.2-readline, php7.2-recode, php7.2-sqlite3, php7.2-xml, php7.2-sybase, php7.2-zip, php7.2-gd, php7.2-gmp, php7.2-ldap, php7.2-common, php7.2-intl, php7.2-mysql, php7.2-snmp, php7.2-curl, php7.2-json, php7.2-pgsql, php7.2-mbstring, php7.2-enchant, php7.2-opcache, php7.2-imap, php7.2-bcmath, php7.2-tidy, php7.2-soap, php7.2-dba, php7.2-interbase, php7.2-xmlrpc, php7.2-pspell, php7.2-bz2
Architecture: any all
Version: 7.2.29-1+ubuntu18.04.1+deb.sury.org+1
Maintainer: Debian PHP Maintainers <team+pkg-php@tracker.debian.org>
Uploaders: Ondřej Surý <ondrej@debian.org>, Lior Kaplan <kaplan@debian.org>
Homepage: http://www.php.net/
Standards-Version: 4.5.0.0
Vcs-Browser: https://salsa.debian.org/php-team/php
Vcs-Git: https://salsa.debian.org/php-team/php.git -b master-7.2
Testsuite: autopkgtest
Testsuite-Triggers: apache2, wget
Build-Depends: apache2-dev (>= 2.4), autoconf (>= 2.63), automake, bison, chrpath, debhelper (>= 9.20150101), default-libmysqlclient-dev | libmysqlclient-dev, default-mysql-server <!nocheck> | mysql-server <!nocheck> | virtual-mysql-server <!nocheck>, dh-apache2, dh-systemd (>= 1.3) [linux-any], dpkg-dev (>= 1.16.1~), firebird-dev [!hurd-any !m68k !hppa !ppc64] | firebird2.5-dev [!hurd-any !m68k !hppa !ppc64] | firebird2.1-dev [!hurd-any !m68k !hppa !ppc64], flex, freetds-dev, libapparmor-dev, libapr1-dev (>= 1.2.7-8), libargon2-dev | libargon2-0-dev, libbz2-dev, libc-client-dev, libcurl4-openssl-dev | libcurl-dev, libdb-dev, libedit-dev (>= 2.11-20080614-4), libenchant-dev, libevent-dev (>= 1.4.11), libexpat1-dev (>= 1.95.2-2.1), libfreetype6-dev, libgcrypt20-dev (>> 1.6.3) | libgcrypt11-dev (<< 1.5.4), libgd-dev (>= 2.1.0) | libgd2-dev, libglib2.0-dev, libgmp3-dev, libicu-dev, libjpeg-dev | libjpeg62-dev, libkrb5-dev, libldap2-dev, liblmdb-dev, libmagic-dev, libmhash-dev (>= 0.8.8), libnss-myhostname [linux-any], libonig-dev, libpam0g-dev, libpcre3-dev (>= 2:8.35), libpng-dev, libpq-dev, libpspell-dev, libqdbm-dev, librecode-dev, libsasl2-dev, libsnmp-dev, libsodium-dev, libsqlite3-dev, libssl-dev, libsystemd-dev [linux-any], libtidy-dev (>= 1:5.2.0), libtool (>= 2.2), libwebp-dev, libwrap0-dev, libxml2-dev, libxmlrpc-epi-dev, libxmltok1-dev, libxslt1-dev (>= 1.0.18), libzip-dev (>= 1.0.0), locales-all | language-pack-de, netbase, netcat-traditional, re2c, systemtap-sdt-dev [amd64 i386 powerpc armel armhf ia64], tzdata, unixodbc-dev, zlib1g-dev
Build-Conflicts: bind-dev, libxmlrpc-core-c3-dev
Package-List:
 libapache2-mod-php7.2 deb httpd optional arch=any
 libphp7.2-embed deb php optional arch=any
 php7.2 deb php optional arch=all
 php7.2-bcmath deb php optional arch=any
 php7.2-bz2 deb php optional arch=any
 php7.2-cgi deb php optional arch=any
 php7.2-cli deb php optional arch=any
 php7.2-common deb php optional arch=any
 php7.2-curl deb php optional arch=any
 php7.2-dba deb php optional arch=any
 php7.2-dev deb php optional arch=any
 php7.2-enchant deb php optional arch=any
 php7.2-fpm deb php optional arch=any
 php7.2-gd deb php optional arch=any
 php7.2-gmp deb php optional arch=any
 php7.2-imap deb php optional arch=any
 php7.2-interbase deb php optional arch=any
 php7.2-intl deb php optional arch=any
 php7.2-json deb php optional arch=any
 php7.2-ldap deb php optional arch=any
 php7.2-mbstring deb php optional arch=any
 php7.2-mysql deb php optional arch=any
 php7.2-odbc deb php optional arch=any
 php7.2-opcache deb php optional arch=any
 php7.2-pgsql deb php optional arch=any
 php7.2-phpdbg deb php optional arch=any
 php7.2-pspell deb php optional arch=any
 php7.2-readline deb php optional arch=any
 php7.2-recode deb php optional arch=any
 php7.2-snmp deb php optional arch=any
 php7.2-soap deb php optional arch=any
 php7.2-sqlite3 deb php optional arch=any
 php7.2-sybase deb php optional arch=any
 php7.2-tidy deb php optional arch=any
 php7.2-xml deb php optional arch=any
 php7.2-xmlrpc deb php optional arch=any
 php7.2-xsl deb php optional arch=all
 php7.2-zip deb php optional arch=any
Checksums-Sha1:
 910952c26c51a5fcc97e0306e7921efeb5d18379 12308380 php7.2_7.2.29.orig.tar.xz
 3a3326fe6f9cb8ffd919210a6f6d90b07cb796ce 69644 php7.2_7.2.29-1+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz
Checksums-Sha256:
 b117de74136bf4b439d663be9cf0c8e06a260c1f340f6b75ccadb609153a7fe8 12308380 php7.2_7.2.29.orig.tar.xz
 a8e994cfa7b9f83d427cd7ae09f33bec648d7534e5b2d278e24d8455395e215b 69644 php7.2_7.2.29-1+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz
Files:
 df40f1052d6678c65b7679182e58b3de 12308380 php7.2_7.2.29.orig.tar.xz
 4cdb6023c15b06bca6e028cead69d9d1 69644 php7.2_7.2.29-1+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEEahqteuW0AcbiWaeyVwZ7qhMUx/wFAl50yyNfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDZB
MUFBRDdBRTVCNDAxQzZFMjU5QTdCMjU3MDY3QkFBMTMxNEM3RkMACgkQVwZ7qhMU
x/xePBAAhfwFV+hmU6Oxt2WxIIuCG+tqSCEBZIfq2/tm1LOvWY6D1+ziTHhFXr++
lYtpMm+VZW2KJpkracos6oBAwHRFe8Pn2iPARVKQVeXgmFo9rhk/GfM+uaDNeN72
e9339zIfMUdQnvX8GVzZKCpm5XCwb+FAG2zWROxcFSZ1fNPGf7NdXD3JhJ1sq6uj
gydc2YqD4Z8nK4zAcpKE+RUM/B75Yb9Qs19SEbn3Uv8rCmO+wnyA2B/3AxW7wguP
NZYOqaU4TVcBQ5DUu+1mKtG3WUVjCj6LKqlMLXYHgM0ykYAY3xWm5qQdjjW3dacQ
odPU8BOUQTNAkk8IbGfSY3tpRhPDj6kkskFMiRrrx3g+SEPy4qk967o93jucE2Zu
VjSH/nrnIldUEbRgqUbczu+5+IpF6Z4uFLkx7/y5CBgAaKxl0mJYcdrW2SETan9F
+v76RAJNYurqbNF07g0cYnalPvus9l/vUq+VS6EHZX5CjzXAVmkIUct13UAV8OCm
pdufJKreqzXgwfVH/5Rw6sE98pJ/nbHn7QDdKbnKXnysoL4N0pBPvsO1/W8Tor8b
cd8Qgmp5Ld+xHHsXpr96krlopK9aDpsX2IMt7b5Bocv86GierA+OLJ0GkLSsozBE
0bqN19+/pi+adHp+FnArS6sX/0FpOVcDjiH2M8/1rnsCVLJqm70=
=Qi85
-----END PGP SIGNATURE-----
