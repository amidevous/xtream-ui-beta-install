#!/usr/bin/python
# -*- coding: utf-8 -*-
import subprocess, os, sys
from itertools import cycle, izip

rDownloadURL = "https://github.com/amidevous/xtream-ui-beta-install/releases/download/1.0/load.tar.gz"
rPackages = ["libcurl4", "libxslt1-dev", "libgeoip-dev", "e2fsprogs", "wget", "mcrypt", "nscd", "htop", "ufw"]

def getVersion():
    try: return subprocess.check_output("lsb_release -d".split()).split(":")[-1].strip()
    except: return ""

def prepare():
    global rPackages
    for rFile in ["/var/lib/dpkg/lock-frontend", "/var/cache/apt/archives/lock", "/var/lib/dpkg/lock"]:
        try: os.remove(rFile)
        except: pass
    os.system("apt-get update > /dev/null")
    for rPackage in rPackages: os.system("apt-get install %s -y > /dev/null" % rPackage)
    os.system("wget -q -O /tmp/libpng12.deb https://xtream-brutus.com/v3/libpng12-0_1.2.54-1ubuntu1_amd64.deb")
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
    if os.path.exists("/tmp/xtreamcodes.tar.gz"):
        os.system('tar -zxvf "/tmp/xtreamcodes.tar.gz" -C "/home/xtreamcodes/" > /dev/null')
        os.system('sed -i "s/listen AAAAAAA;/listen \"%s\";/g" /home/xtreamcodes/iptv_xtream_codes/nginx/conf/nginx.conf > /dev/null' % (rhttpport))
        os.system('sed -i "s/AAAAAAA/\"%s\"/g" /home/xtreamcodes/iptv_xtream_codes/nginx_rtmp/conf/nginx.conf > /dev/null' % (rhttpport))
        os.system('sed -i "s/listen BBBBBBB ssl/listen \"%s\" ssl/g" /home/xtreamcodes/iptv_xtream_codes/nginx/conf/nginx.conf > /dev/null' % (rhttpsport))
        os.system('sed -i "s/listen CCCCCCC;/listen \"%s\";/g" /home/xtreamcodes/iptv_xtream_codes/nginx_rtmp/conf/nginx.conf > /dev/null' % (rrtmpport))
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
    if not "xtreamcodes" in open("/etc/sudoers").read(): os.system('echo "xtreamcodes ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers')
    try: os.remove("/usr/bin/ffmpeg")
    except: pass
    os.system("ln -s /home/xtreamcodes/iptv_xtream_codes/bin/ffmpeg /usr/bin/")
    os.system("chown xtreamcodes:xtreamcodes -R /home/xtreamcodes > /dev/null")
    os.system("chmod -R 0777 /home/xtreamcodes > /dev/null")
    os.system("chmod +x /home/xtreamcodes/iptv_xtream_codes/start_services.sh > /dev/null")
    os.system('echo "@reboot root sudo /home/xtreamcodes/iptv_xtream_codes/start_services.sh" >> /etc/crontab')
    os.system("apt-get -y install python-certbot-apache > /dev/null")
    os.system("echo 2 | certbot --apache -d \"%s\" -m \"%s\" --agree-tos --agree-tos -n > /dev/null" % (rdomaine, remail))
    os.system('sed -i "s/server.crt;/\/etc\/letsencrypt\/live\/\"%s\"\/fullchain.pem;/g" /home/xtreamcodes/iptv_xtream_codes/nginx/conf/nginx.conf > /dev/null' % (rdomaine))
    os.system('sed -i "s/server.key;/\/etc\/letsencrypt\/live\/\"%s\"\/privkey.pem;\\n      	ssl_trusted_certificate \/etc\/letsencrypt\/live\/\"%s\"\/chain.pem;/g" /home/xtreamcodes/iptv_xtream_codes/nginx/conf/nginx.conf > /dev/null' % (rdomaine, rdomaine))
    os.system('sed -i "s/wwwdir\/;/wwwdir\/;\\n      	server_name \"%s\";/g" /home/xtreamcodes/iptv_xtream_codes/nginx/conf/nginx.conf > /dev/null' % (rdomaine))
    os.system('sed -i "s/Listen 443/Listen 8443/g" /etc/apache2/ports.conf')
    os.system('sed -i "s/Listen 80/Listen 70/g" /etc/apache2/ports.conf')
    os.system('sed -i "s/443/8443/g" /etc/apache2/sites-available/000-default-le-ssl.conf')
    os.system('sed -i "s/443/8443/g" /etc/apache2/sites-available/default-ssl.conf')
    os.system('sed -i "s/80/70/g" /etc/apache2/sites-available/000-default.conf')
    os.system("service apache2 restart > /dev/null")
    os.system("ufw default deny incoming > /dev/null")
    os.system("ufw default allow outgoing > /dev/null")
    os.system("ufw allow \"%s\" > /dev/null" % (rsshport))
    os.system("ufw allow \"%s\" > /dev/null" % (rhttpport))
    os.system("ufw allow \"%s\" > /dev/null" % (rhttpsport))
    os.system("ufw allow \"%s\" > /dev/null" % (rrtmpport))
    os.system("ufw allow from \"%s\" > /dev/null" % (rHost))
    os.system("echo y | sudo ufw enable > /dev/null")

def start(): os.system("/home/xtreamcodes/iptv_xtream_codes/start_services.sh > /dev/null")

if __name__ == "__main__":
    rHost = sys.argv[1]
    rPort = int(sys.argv[2])
    rUsername = sys.argv[3]
    rPassword = sys.argv[4]
    rDatabase = sys.argv[5]
    rServerID = int(sys.argv[6])
    rhttpport = int(sys.argv[7])
    rhttpsport = int(sys.argv[8])
    rrtmpport = int(sys.argv[9])
    rdomaine = sys.argv[10]
    remail = sys.argv[11]
    rsshport = sys.argv[12]
    rRet = prepare()
    if not install(): sys.exit(1)
    encrypt(rHost, rUsername, rPassword, rDatabase, rServerID, rPort)
    configure()
    start()
