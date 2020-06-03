-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: curl
Binary: curl, libcurl4, libcurl3-gnutls, libcurl3-nss, libcurl4-openssl-dev, libcurl4-gnutls-dev, libcurl4-nss-dev, libcurl4-doc
Architecture: any all
Version: 7.58.0-2ubuntu3.8ppa2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Ian Jackson <ijackson@chiark.greenend.org.uk>
Homepage: http://curl.haxx.se
Standards-Version: 4.1.3
Vcs-Browser: https://salsa.debian.org/debian/curl
Vcs-Git: https://salsa.debian.org/debian/curl.git
Build-Depends: debhelper (>= 11), autoconf, automake, ca-certificates, dh-exec, dpkg-dev (>= 1.17.14~), groff-base, libgnutls28-dev, libidn2-0-dev, libkrb5-dev, libldap2-dev, libnghttp2-dev, libnss3-dev, libpsl-dev, librtmp-dev (>= 2.4+20131018.git79459a2-3~), libssh2-1-dev, libssl-dev (>= 1.1), libtool, openssh-server <!nocheck>, python:native, quilt, stunnel4 <!nocheck>, zlib1g-dev
Build-Conflicts: autoconf2.13, automake1.4
Package-List:
 curl deb web optional arch=any
 libcurl3-gnutls deb libs optional arch=any
 libcurl3-nss deb libs optional arch=any
 libcurl4 deb libs optional arch=any
 libcurl4-doc deb doc optional arch=all
 libcurl4-gnutls-dev deb libdevel optional arch=any
 libcurl4-nss-dev deb libdevel optional arch=any
 libcurl4-openssl-dev deb libdevel optional arch=any
Checksums-Sha1:
 089f17884d672aca7a661a65d847135f2f0ccbbf 3879728 curl_7.58.0.orig.tar.gz
 b27b4729f8d81bc550af39e7c6412e283167dd38 42756 curl_7.58.0-2ubuntu3.8ppa2.debian.tar.xz
Checksums-Sha256:
 cc245bf9a1a42a45df491501d97d5593392a03f7b4f07b952793518d97666115 3879728 curl_7.58.0.orig.tar.gz
 8b17cd2e6a7eca762a90b90393347731187d6dca938ba36ae91765a96ca2165e 42756 curl_7.58.0-2ubuntu3.8ppa2.debian.tar.xz
Files:
 7e9e9d5405c61148d53035426f162b0a 3879728 curl_7.58.0.orig.tar.gz
 c846bb87dc0c883603011a5cabf30b97 42756 curl_7.58.0-2ubuntu3.8ppa2.debian.tar.xz
Original-Maintainer: Alessandro Ghedini <ghedo@debian.org>

-----BEGIN PGP SIGNATURE-----

iQFJBAEBCgAzFiEElyNy1AVOqS/pnxrVYPbRBanni/8FAl17RCMVHHhhcGllbnpA
cGh5c3RlY2guZWR1AAoJEGD20QWp54v/9vIH/R3grDhqvlp1I12gmc6d7PujTu/H
Fx2UgYWe5wx6i2KygGyRApy3FGaxcpNpx18ZV58JjZkyaj3qA9WeK/wV2TwAUhrz
CyuL75lk2IZItoKKWJZeNO4EyMPPANY0IL9Hn4DK0RmWbIIXbfvYKCFdo3M37jux
3Pp5O2LL3IEJ2a/lxWxkyFFoGcXTOSg/QVrAqLIOeXi+soB4BYInH0SWelwGHyUE
eh3DDqV4+/E7sZ9Iw8fWmmh75Tfx5vw0KO2XDjmLxaN37vx7ZT+BdtAS78YxIjZw
xVIHuprxoYrRjb6GQATWBBzX3Lq+PJGkwE/+vZPes3nNZyKunvnb3sGtbck=
=xCIK
-----END PGP SIGNATURE-----
