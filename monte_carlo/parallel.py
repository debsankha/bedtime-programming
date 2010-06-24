###
from commands import getoutput
ipstart=2
ipend=25
up=[]
for i in range(ipstart,ipend+1):
	s=getoutput('ping -c  192.168.1.2 | grep received')
	a=s.split(',')[1]
	b=int(a[:a.find('received')])
	if b!=0:
		up.append(i)

interval_start=0.2
interval_end=25.2
n=len(up)
d=(interval_end-interval_start)*1.0/n
f=open('phasetransition.config','w')
sl=0
for z in up:
	print >> f, '10.0.0.%d'%z,'\t',sl,'\t',interval_start+sl*d,'\t',interval_start+(sl+1)*d
	sl+=1


f.close()



	

