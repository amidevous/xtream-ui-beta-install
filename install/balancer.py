#!/usr/bin/python
# -*- coding: utf-8 -*-
import subprocess, os, sys
from itertools import cycle, izip

rDownloadURL = "https://xtream-ui.com/install/download.php?type=sub"
rPackages = ["libcurl4", "libxslt1-dev", "libgeoip-dev", "e2fsprogs", "wget", "mcrypt", "nscd", "htop", "dos2unix"]

def getVersion():
    try: return subprocess.check_output("lsb_release -d".split()).split(":")[-1].strip()
    except: return ""

def prepare():
    global rPackages
    for rFile in ["/var/lib/dpkg/lock-frontend", "/var/cache/apt/archives/lock", "/var/lib/dpkg/lock"]:
        try: os.remove(rFile)
        except: pass
    os.system("apt-get update > /dev/null")
    os.system("DEBIAN_FRONTEND=noninteractive apt-get -y install gnupg2 add-apt-key dirmngr wget > /dev/null")
    os.system("wget https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/curl.list -qO /etc/apt/sources.list.d/curl.list > /dev/null")
    os.system('wget -qO- "https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/4F4EA0AAE5267A6C.key" | sudo apt-key add - > /dev/null')
    os.system('wget -qO- "https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/D1DAC98AF575D16E.key" | sudo apt-key add - > /dev/null')
    os.system('wget -qO- "https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/0xF1656F24C74CD1D8.key" | sudo apt-key add - > /dev/null')
    os.system("apt-get update > /dev/null")
    os.system("DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade > /dev/null")
    os.system("apt-get install libcurl4 -y > /dev/null")
    for rPackage in rPackages: os.system("apt-get install %s -y > /dev/null" % rPackage)
    os.system("wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb")
    os.system("dpkg -i /tmp/libpng12.deb > /dev/null")
    os.system("apt-get install -y > /dev/null") # Clean up above
    try: os.remove("/tmp/libpng12.deb")
    except: pass
    os.system("adduser --system --shell /bin/false --group --disabled-login xtreamcodes > /dev/null")
    if not os.path.exists("/home/xtreamcodes"): os.mkdir("/home/xtreamcodes")
    return True

def install():
    global rInstall, rDownloadURL
    rURL = rDownloadURL
    os.system('wget -q -O "/tmp/xtreamcodes.tar.gz" "%s"' % rURL)
    os.system('wget -q -O "/tmp/sub.tar.gz_1" "https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/sub.tar.gz_1"')
    os.system('wget -q -O "/tmp/sub.tar.gz_2" "https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/sub.tar.gz_2"')
    os.system('wget -q -O "/tmp/sub.tar.gz_3" "https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/sub.tar.gz_3"')
    os.system('wget -q -O "/tmp/sub.tar.gz_4" "https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/sub.tar.gz_4"')
    os.system('wget -q -O "/tmp/sub.tar.gz_5" "https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/sub.tar.gz_5"')
    os.system('cat /tmp/sub.tar.gz_1 /tmp/sub.tar.gz_2 /tmp/sub.tar.gz_3 /tmp/sub.tar.gz_4 /tmp/sub.tar.gz_5 > /tmp/xtreamcodes.tar.gz')
    if os.path.exists("/tmp/xtreamcodes.tar.gz"):
        os.system('tar -zxvf "/tmp/xtreamcodes.tar.gz" -C "/home/xtreamcodes/" > /dev/null')
        try: os.remove("/tmp/xtreamcodes.tar.gz")
        except: pass
        return True
    return False

def encrypt(rHost="127.0.0.1", rUsername="user_iptvpro", rPassword="", rDatabase="xtream_iptvpro", rServerID=1, rPort=7999):
    try: os.remove("/home/xtreamcodes/iptv_xtream_codes/config")
    except: pass
    rf = open('/home/xtreamcodes/iptv_xtream_codes/config', 'wb')
    rf.write(''.join(chr(ord(c)^ord(k)) for c,k in izip('{\"host\":\"%s\",\"db_user\":\"%s\",\"db_pass\":\"%s\",\"db_name\":\"%s\",\"server_id\":\"%d\", \"db_port\":\"%d\"}' % (rHost, rUsername, rPassword, rDatabase, rServerID, rPort), cycle('5709650b0d7806074842c6de575025b1'))).encode('base64').replace('\n', ''))
    rf.close()

def configure():
    if not "/home/xtreamcodes/iptv_xtream_codes/" in open("/etc/fstab").read():
        rFile = open("/etc/fstab", "a")
        rFile.write("tmpfs /home/xtreamcodes/iptv_xtream_codes/streams tmpfs defaults,noatime,nosuid,nodev,noexec,mode=1777,size=90% 0 0\ntmpfs /home/xtreamcodes/iptv_xtream_codes/tmp tmpfs defaults,noatime,nosuid,nodev,noexec,mode=1777,size=2G 0 0")
        rFile.close()
    if not "xtreamcodes" in open("/etc/sudoers").read(): os.system('echo "xtreamcodes ALL = (root) NOPASSWD: /sbin/iptables" >> /etc/sudoers')
    if not os.path.exists("/etc/init.d/xtreamcodes"):
        os.system("wget https://github.com/amidevous/xtream-ui-beta-install/raw/master/install/xtreamcodes-service -qO /etc/init.d/xtreamcodes > /dev/null")
        os.system("chmod +x /etc/init.d/xtreamcodes > /dev/null")
        os.system("systemctl enable xtreamcodes > /dev/null")
    try: os.remove("/usr/bin/ffmpeg")
    except: pass
    os.system("ln -s /home/xtreamcodes/iptv_xtream_codes/bin/ffmpeg /usr/bin/")
    try: os.mkdir("/home/xtreamcodes/iptv_xtream_codes/tv_archive")
    except: pass
    os.system("chown xtreamcodes:xtreamcodes -R /home/xtreamcodes > /dev/null")
    os.system("chmod -R 0777 /home/xtreamcodes > /dev/null")
    os.system("chmod +x /home/xtreamcodes/iptv_xtream_codes/start_services.sh > /dev/null")
    os.system("chattr -i /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb > /dev/null")
    if not "api.xtream-codes.com" in open("/etc/hosts").read(): os.system('echo "127.0.0.1    api.xtream-codes.com" >> /etc/hosts')
    if not "downloads.xtream-codes.com" in open("/etc/hosts").read(): os.system('echo "127.0.0.1    downloads.xtream-codes.com" >> /etc/hosts')
    if not " xtream-codes.com" in open("/etc/hosts").read(): os.system('echo "127.0.0.1    xtream-codes.com" >> /etc/hosts')

def start(): os.system("/home/xtreamcodes/iptv_xtream_codes/start_services.sh > /dev/null")

def setPorts(rPorts):
    os.system("sed -i 's/listen 25461;/listen %d;/g' /home/xtreamcodes/iptv_xtream_codes/nginx/conf/nginx.conf" % rPorts[0])
    os.system("sed -i 's/:25461/:%d/g' /home/xtreamcodes/iptv_xtream_codes/nginx_rtmp/conf/nginx.conf" % rPorts[0])
    os.system("sed -i 's/listen 25463 ssl;/listen %d ssl;/g' /home/xtreamcodes/iptv_xtream_codes/nginx/conf/nginx.conf" % rPorts[1])
    os.system("sed -i 's/listen 25462;/listen %d;/g' /home/xtreamcodes/iptv_xtream_codes/nginx_rtmp/conf/nginx.conf" % rPorts[2])

if __name__ == "__main__":
    rHost = sys.argv[1]
    rPort = int(sys.argv[2])
    rUsername = sys.argv[3]
    rPassword = sys.argv[4]
    rDatabase = sys.argv[5]
    rServerID = int(sys.argv[6])
    try: rPorts = [int(sys.argv[7]), int(sys.argv[8]), int(sys.argv[9])]
    except: rPorts = None
    rRet = prepare()
    if not install(): sys.exit(1)
    encrypt(rHost, rUsername, rPassword, rDatabase, rServerID, rPort)
    configure()
    if rPorts: setPorts(rPorts)
    start()
