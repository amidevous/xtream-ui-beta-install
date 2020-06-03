-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: php7.4
Binary: libapache2-mod-php7.4, libphp7.4-embed, php7.4, php7.4-cgi, php7.4-cli, php7.4-dev, php7.4-fpm, php7.4-phpdbg, php7.4-xsl, php7.4-bcmath, php7.4-bz2, php7.4-common, php7.4-curl, php7.4-dba, php7.4-enchant, php7.4-gd, php7.4-gmp, php7.4-imap, php7.4-interbase, php7.4-intl, php7.4-json, php7.4-ldap, php7.4-mbstring, php7.4-mysql, php7.4-odbc, php7.4-opcache, php7.4-pgsql, php7.4-pspell, php7.4-readline, php7.4-snmp, php7.4-soap, php7.4-sqlite3, php7.4-sybase, php7.4-tidy, php7.4-xml, php7.4-xmlrpc, php7.4-zip
Architecture: any all
Version: 7.4.4-1+ubuntu18.04.1+deb.sury.org+1
Maintainer: Debian PHP Maintainers <team+pkg-php@tracker.debian.org>
Uploaders: Ondřej Surý <ondrej@debian.org>, Lior Kaplan <kaplan@debian.org>
Homepage: http://www.php.net/
Standards-Version: 4.5.0.0
Vcs-Browser: https://salsa.debian.org/php-team/php
Vcs-Git: https://salsa.debian.org/php-team/php.git -b master-7.4
Testsuite: autopkgtest
Testsuite-Triggers: apache2, wget
Build-Depends: apache2-dev (>= 2.4), autoconf (>= 2.63), automake, bison, chrpath, debhelper (>= 9.20150101), default-libmysqlclient-dev | libmysqlclient-dev, default-mysql-server <!nocheck> | mysql-server <!nocheck> | virtual-mysql-server <!nocheck>, dh-apache2, dh-systemd (>= 1.3) [linux-any], dpkg-dev (>= 1.16.1~), firebird-dev [!hurd-any !m68k !hppa !ppc64] | firebird2.5-dev [!hurd-any !m68k !hppa !ppc64] | firebird2.1-dev [!hurd-any !m68k !hppa !ppc64], flex, freetds-dev, libapparmor-dev, libapr1-dev (>= 1.2.7-8), libargon2-dev | libargon2-0-dev, libbz2-dev, libc-client-dev, libcurl4-openssl-dev | libcurl-dev, libdb-dev, libedit-dev (>= 2.11-20080614-4), libenchant-dev, libevent-dev (>= 1.4.11), libexpat1-dev (>= 1.95.2-2.1), libffi-dev, libfreetype6-dev, libgcrypt20-dev (>> 1.6.3) | libgcrypt11-dev (<< 1.5.4), libgd-dev (>= 2.1.0) | libgd2-dev, libglib2.0-dev, libgmp3-dev, libicu-dev, libjpeg-dev | libjpeg62-dev, libkrb5-dev, libldap2-dev, liblmdb-dev, libmagic-dev, libmhash-dev (>= 0.8.8), libnss-myhostname [linux-any], libonig-dev, libpam0g-dev, libpcre2-dev (>= 10.30), libpng-dev, libpq-dev, libpspell-dev, libqdbm-dev, libsasl2-dev, libsnmp-dev, libsodium-dev, libsqlite3-dev, libssl-dev, libsystemd-dev [linux-any], libtidy-dev (>= 1:5.2.0), libtool (>= 2.2), libwebp-dev, libwrap0-dev, libxml2-dev, libxmlrpc-epi-dev, libxmltok1-dev, libxslt1-dev (>= 1.0.18), libzip-dev (>= 1.0.0), locales-all | language-pack-de, netbase, netcat-traditional, re2c, systemtap-sdt-dev [amd64 i386 powerpc armel armhf ia64], tzdata, unixodbc-dev, zlib1g-dev
Build-Conflicts: bind-dev, libxmlrpc-core-c3-dev
Package-List:
 libapache2-mod-php7.4 deb httpd optional arch=any
 libphp7.4-embed deb php optional arch=any
 php7.4 deb php optional arch=all
 php7.4-bcmath deb php optional arch=any
 php7.4-bz2 deb php optional arch=any
 php7.4-cgi deb php optional arch=any
 php7.4-cli deb php optional arch=any
 php7.4-common deb php optional arch=any
 php7.4-curl deb php optional arch=any
 php7.4-dba deb php optional arch=any
 php7.4-dev deb php optional arch=any
 php7.4-enchant deb php optional arch=any
 php7.4-fpm deb php optional arch=any
 php7.4-gd deb php optional arch=any
 php7.4-gmp deb php optional arch=any
 php7.4-imap deb php optional arch=any
 php7.4-interbase deb php optional arch=any
 php7.4-intl deb php optional arch=any
 php7.4-json deb php optional arch=any
 php7.4-ldap deb php optional arch=any
 php7.4-mbstring deb php optional arch=any
 php7.4-mysql deb php optional arch=any
 php7.4-odbc deb php optional arch=any
 php7.4-opcache deb php optional arch=any
 php7.4-pgsql deb php optional arch=any
 php7.4-phpdbg deb php optional arch=any
 php7.4-pspell deb php optional arch=any
 php7.4-readline deb php optional arch=any
 php7.4-snmp deb php optional arch=any
 php7.4-soap deb php optional arch=any
 php7.4-sqlite3 deb php optional arch=any
 php7.4-sybase deb php optional arch=any
 php7.4-tidy deb php optional arch=any
 php7.4-xml deb php optional arch=any
 php7.4-xmlrpc deb php optional arch=any
 php7.4-xsl deb php optional arch=all
 php7.4-zip deb php optional arch=any
Checksums-Sha1:
 ac18ea90842e79d2a4b07bdc8b5ab121e5519550 10267308 php7.4_7.4.4.orig.tar.xz
 6aff8b66bb26276ed4f838107c422ee1065bc973 64876 php7.4_7.4.4-1+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz
Checksums-Sha256:
 1873c4cefdd3df9a78dcffb2198bba5c2f0464f55c9c960720c84df483fca74c 10267308 php7.4_7.4.4.orig.tar.xz
 bb0c880ab7004f12c53c2af2eb2fde00c584bf772f39ce1eaa9b7f256c553bf2 64876 php7.4_7.4.4-1+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz
Files:
 a5632697e223b8386025520662dcb78f 10267308 php7.4_7.4.4.orig.tar.xz
 3f9a54291a9c7760d23cc0f6507ec684 64876 php7.4_7.4.4-1+ubuntu18.04.1+deb.sury.org+1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEEahqteuW0AcbiWaeyVwZ7qhMUx/wFAl50yYdfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDZB
MUFBRDdBRTVCNDAxQzZFMjU5QTdCMjU3MDY3QkFBMTMxNEM3RkMACgkQVwZ7qhMU
x/y2fRAAgJmLLWLXQFDlDCPNtVLjhXwN9oRo/dU6yEv6cdp87hYwBELUhgzokSdZ
9XDcYI7RLwUGaw55zyPMZ/VtyBAClQ1fQ2sAOGhMfqPzgOEHo1jGlFs1m7CZsRqF
ozTuIL5/6hk8BI8qvLzYQZyLC/azut47QZNqsaLiwoYS4dVaW9DER/cic+LJzW7w
8nHSQ4JNTf+zeHJSLNldpelj9qFfvL8g04lPMj6/5t8Pn7XyfJsACCSwhZxstHkN
iYp0EtkvhINxL7xPeaH2ttbZpXYx+w3eCeIM63lNCwJDH9qaTWg7cgGReZRLAHl0
/ZPQipHMPSShaHDQEVlHUicTTevPvfV3Hhd+W7Vd0x4OB/UjqsTrrBxjBA9ij795
Xt+FjFhbGK7X3aSyJnBx0m085SKRlyZ5uGZrWpS+CRnXH6azfPUMPiyi6Noc+5Nx
69tyWmUACtszUGM4vwF3pX1Aq8MVHTNTptPbNK88h2DVSF29O6oTQLsW3yRdt8S9
Q14O5PjmiO0m0zkPr4C+LXM9x5GwJeX4Ko8vBJJkNB214oj+DmV/xdz/VyTNmFqR
MnQXjusByDHtXWPjZ0ubiyWyqKEB1deq/mk1ztRTsnAKjG/WjIGpAnSFXicxdzGE
0fmHLI8MSDU2/xSQWAlSPfP2pdVUoCvg/lMeQnU9+szrtY7B10U=
=yukB
-----END PGP SIGNATURE-----
