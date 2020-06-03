import sys, json
from itertools import cycle, izip

rConfigPath = "/home/xtreamcodes/iptv_xtream_codes/config"

def doDecrypt():
    rDecrypt = decrypt()
    if rDecrypt:
        print "%s%s"%(""*11, rDecrypt["host"])
    else: print "Config file could not be read!"

def decrypt():
    try: return json.loads(''.join(chr(ord(c)^ord(k)) for c,k in izip(open(rConfigPath, 'rb').read().decode("base64"), cycle('5709650b0d7806074842c6de575025b1'))))
    except: return None

def encrypt(rInfo):
    try: os.remove(rConfigPath)
    except: pass
    rf = open(rConfigPath, 'wb')
    rf.write(''.join(chr(ord(c)^ord(k)) for c,k in izip('{\"host\":\"%s\",\"db_user\":\"%s\",\"db_pass\":\"%s\",\"db_name\":\"%s\",\"server_id\":\"%d\", \"db_port\":\"%d\"}' % (rInfo["host"], rInfo["db_user"], rInfo["db_pass"], rInfo["db_name"], int(rInfo["server_id"]), int(rInfo["db_port"])), cycle('5709650b0d7806074842c6de575025b1'))).encode('base64').replace('\n', ''))
    rf.close()

if __name__ == "__main__":
    try: rCommand = sys.argv[1]
    except: rCommand = None
    if rCommand and rCommand.lower() == "decrypt": doDecrypt()
    elif rCommand and rCommand.lower() == "encrypt":
        print "Current configuration"
        print " "
        doDecrypt()
        print " "
        rEnc = {"pconnect": 0}
        try:
            rEnc["server_id"] = "idedit"
            rEnc["host"] = "127.0.0.1"
            rEnc["db_port"] = "7999"
            rEnc["db_user"] = "user_iptvpro"
            rEnc["db_pass"] = "mysqlpassword"
            rEnc["db_name"] = "xtream_iptvpro"
            print " "
        except:
            print "Invalid entries!"
            sys.exit(1)
        try:
            encrypt(rEnc)
            print "Written to config file!"
        except: print "Couldn't write to file!"
    else: print "Usage: config.py [ENCRYPT | DECRYPT]"
