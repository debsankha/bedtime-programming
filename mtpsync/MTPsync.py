#! /usr/bin/python

import user
import os
from commands import getoutput

std=os.popen('''kdialog --title "Select the playlist you want to transfer " --getopenfilename $HOME/.kde/share/apps/amarok/playlists''')
pl=std.readline().strip()
print 'pl=',pl

if pl=='':
	quit()



stdin = os.popen('''kdialog --title "Select the directory you want to save the songs in" --getexistingdirectory $HOME''')
dest=stdin.readline().strip()
print dest
if dest=='':
	quit()

urls=[]
fnamelist=[]
def extract_url(somefile):
	dirn=os.path.dirname(somefile)
	os.chdir(dirn)
	f=open(somefile,'r')
	li=f.readlines()
	for line in li:
		item=line.strip()
		if os.path.isfile(item):
			urls.append(item)
			fnamelist.append(os.path.basename(item))
			
			
			

extract_url(pl)
no=len(urls)
#copying
os.popen("kdialog --msgbox 'Start copying songs?' ")

dbusref=os.popen('''kdialog --progressbar 'Copying songs' %d'''%no)
dbusref=dbusref.read().strip()
os.popen('''qdbus %s Set "" "value" %d'''%(dbusref,0))
n=0
for song in urls:
	
	os.popen('''cp \"'''+song+'''"'''+''' '''+'''"'''+dest+'''/'''+'''"''')
	n+=1
	os.popen('''qdbus %s Set "" "value" %d'''%(dbusref,n))

os.popen("qdbus %s close"%dbusref)

possibledir='/'.join(dest.split('/')[4:])
print 'possibledir: ',possibledir
stdin = os.popen("kdialog --title 'Where do you want to save the playlist?' --getsavefilename $HOME")
plist = stdin.readline().strip()
f=open(plist,'w')
dest2=dest.split('/')[6:]
dest2="\\".join(dest2)
dest2="E:"+"\\"+dest2
for i in fnamelist:
	fullpath=dest2+"\\"+i
	print >> f, fullpath
	
f.close()

os.popen("kdialog --msgbox 'Playlist transferred successfully!")
quit()
