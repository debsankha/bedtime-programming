#!/usr/bin/python
from commands import getoutput as get
import os
import re
import sys

def getdest(identifier):
	diskinfo=get("ls -al /dev/disk/by-id/ | grep %s | grep -E '(sd)([a-z][0-9]+)'"%identifier)
	if diskinfo.strip()=='':
		print "No compatible device found, exiting"
		return None

	disk=re.search("sd[a-z]([0-9]+)",diskinfo).group()
	dirinfo=get("cat /etc/mtab | grep "+disk)
	dest=dirinfo.split(" ")[1]
	return dest

dest=getdest("Nokia")
#dest='/media/External/test'

if dest==None:
	get("zenity --warning --text='No compatible device found, exiting'")
	sys.exit()

filelist=get("zenity --file-selection --multiple --file-filter=*.m3u --title='Select the playlist'").strip().split('|')

for plist in filelist:
	print "list: ",plist
	
	playlist=plist
	
	songdir=dest+"/Sounds"+"/"+playlist.split('/')[-1][:-4]	
	get("mkdir '%s'"%songdir)		#create a dest directory
	
	playlistdir=dest+"/Sounds"+"/Playlists"
	
	print 'songdir: ',songdir,'  playlistdir: ',playlistdir
	
	print get("rsync --files-from='%s' --no-implied-dirs --copy-links --no-relative --progress -a /  '%s' | zenity --progress --text='rsync running..' --pulsate --auto-kill --auto-close --title='Syncing %s'"%(playlist,songdir,plist.split('/')[-1]))
	
	f=open(playlistdir+"/"+plist.split('/')[-1],'w')
	g=open(playlist,'r')
	songli=g.readlines()
	
	prefix="e:\sounds\\"+playlist.split('/')[-1][:-4]	
	print 'prefix:',prefix
	
	for song in songli:
		if song[0]!='#':
			print>>f,prefix+"\\"+song.split('/')[-1]
	f.close()
	g.close()
	
	print "done"
