#!/usr/bin/python

#NOTE:Run this script as root. It assumes that the modem is /dev/ttyACM0. If any other process (like mtp plugin of rhythmbox, amarok, photo viewer etc.) is using this device, this script will kill it. So use it only if you're sure that you are ready to sacrifice them for internet connectivity.

import os,thread,sys
import commands
import re,time

if commands.getoutput('''ifconfig ppp0 | grep "inet addr" | awk {"print $1"}''').find("error")==-1:
	os.popen("notify-send 'Connection already active'")
	sys.exit()

if commands.getoutput('''ls /dev/tty* | grep ACM''').strip()=='':
	os.popen("notify-send 'Mobile phone is not connected in PC Suite mode'")
	sys.exit()

s=commands.getoutput("fuser /dev/ttyACM0")
processes=(re.sub('\\s{2,}',' ',s)).split(' ')[1:]

for i in processes:
	commands.getoutput("kill %s"%i)

def dial():
	os.popen("wvdial")
	return 0

thread.start_new_thread(dial,())

while True:
	if commands.getoutput('''ifconfig ppp0 | grep "inet addr" | awk {"print $1"}''').find("error")!=-1:
		os.popen("notify-send 'Connected to mobile broadband'")
		break
