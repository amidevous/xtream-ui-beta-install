-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: apache2
Binary: apache2, apache2-data, apache2-bin, apache2-utils, apache2-suexec-pristine, apache2-suexec-custom, apache2-doc, apache2-dev, apache2-ssl-dev, libapache2-mod-md, libapache2-mod-proxy-uwsgi
Architecture: any all
Version: 2.4.41-1+ubuntu18.04.1+deb.sury.org+5
Maintainer: Debian Apache Maintainers <debian-apache@lists.debian.org>
Uploaders: Stefan Fritsch <sf@debian.org>, Arno Töll <arno@debian.org>, Ondřej Surý <ondrej@debian.org>, Xavier Guimard <yadd@debian.org>
Homepage: https://httpd.apache.org/
Standards-Version: 4.3.0
Vcs-Browser: https://salsa.debian.org/apache-team/apache2
Vcs-Git: https://salsa.debian.org/apache-team/apache2.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, curl, dpkg-dev, expect, libanyevent-perl, libcrypt-ssleay-perl, libdatetime-perl, libfcgi-perl, libhtml-parser-perl, libhttp-dav-perl, libnet-ssleay-perl, libprotocol-http2-perl, libtime-hires-perl, libwww-perl, perl-doc, ssl-cert, wget
Build-Depends: autotools-dev, debhelper (>= 9), dpkg-dev (>= 1.16.1~), dh-systemd, bison, gawk | awk, libapr1-dev (>= 1.6.0), libaprutil1-dev (>= 1.6.0), libbrotli-dev, liblua5.2-dev, libnghttp2-dev, libpcre3-dev, libssl-dev (>= 1.1.1), libxml2-dev, lsb-release, perl, zlib1g-dev, libcurl4-openssl-dev | libcurl4-dev, libjansson-dev
Build-Conflicts: autoconf2.13
Package-List:
 apache2 deb httpd optional arch=any
 apache2-bin deb httpd optional arch=any
 apache2-data deb httpd optional arch=all
 apache2-dev deb httpd optional arch=any
 apache2-doc deb doc optional arch=all
 apache2-ssl-dev deb httpd optional arch=any
 apache2-suexec-custom deb httpd optional arch=any
 apache2-suexec-pristine deb httpd optional arch=any
 apache2-utils deb httpd optional arch=any
 libapache2-mod-md deb oldlibs optional arch=any
 libapache2-mod-proxy-uwsgi deb oldlibs optional arch=any
Checksums-Sha1:
 b713e835aa7cde823a4b7f8e3463164f3d9fe63e 9267917 apache2_2.4.41.orig.tar.gz
 b4c29a321bdc2b05523de0ff1d9dae4b5467e69a 1015188 apache2_2.4.41-1+ubuntu18.04.1+deb.sury.org+5.debian.tar.xz
Checksums-Sha256:
 3c0f9663240beb0f008acf3b4501c4f339d7467ee345a36c86c46b4d6f3a5461 9267917 apache2_2.4.41.orig.tar.gz
 9d7268adc74c2bf3f473d877c5f31a26af0be624055da8e8bf04fee621063af9 1015188 apache2_2.4.41-1+ubuntu18.04.1+deb.sury.org+5.debian.tar.xz
Files:
 9dd9c5fae398c3696805d19cb1f1a104 9267917 apache2_2.4.41.orig.tar.gz
 40b635a90614657b0cae868598da947e 1015188 apache2_2.4.41-1+ubuntu18.04.1+deb.sury.org+5.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEEahqteuW0AcbiWaeyVwZ7qhMUx/wFAl1drO1fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDZB
MUFBRDdBRTVCNDAxQzZFMjU5QTdCMjU3MDY3QkFBMTMxNEM3RkMACgkQVwZ7qhMU
x/yNDQ/+PluROS9Bttw7eXmZJF5zFgI1rPu62sQCB9MLLo0nyLy277UKlfHVIyl6
6Ira6JGlhJViNzymbOf7I8XF1nSr1s7kldYkaGHUeQAHxFCsGKzJFGlUp+h4Y8IR
Dc8wAyzPZm13vikBAy+acy/ii/bM6UIlhwYdEpa17cI6KcD9u2abByd5KXA/KLsy
vuHowzGzpoNIVbu8Qv8DyDXoRkJEobZ1KvESQxurgiGA+VkXd0cia+j9WRKXT5T1
E2YxXG3iYTYcXYqsvKc/Dtj2X0QWOKNFMNky/y0WLBWm1vfwGyov6vHS/5uP1NYZ
4lny25D1kq5HzT/jXcQKA9KlvSC5oqWjDfZChb7br4C7WoDd0Qwtj/sT1RVQxNA7
8BsP4uVllNjQn6Sqrck9lS7CH7LHQzkjNsf8aE5mOxH3SzlIqDxTtuB/AqpnQnjf
2MWxTjUSNaSkpeds8Cx6mazj0KPlnQk0b53H0r9plq6I0btheyqiubQNBtrPg/bP
lbdvDSh1k7ylbi+lx5/waILIZXg6WxwiKlwy1aJmJUV+Px2mhLdIAYRHfcT6LNc/
JohZ5qm+hz+V4zVYjw75cJt6xLvS6fjrYrI0k4NJBpV+WZfAFwEwSq5EpHCQANZL
qbnYNCOmK0viWqjjVmq1jqAX5xRBU4e/k4wqJQG/86nXk4E2oXE=
=wNIc
-----END PGP SIGNATURE-----
