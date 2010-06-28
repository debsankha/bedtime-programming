from math import *
import thread
import random
import time
import visual


class rodent:
        def __init__(self):
                self.time_from_last_childbirth=0

class felix:
        def __init__(self):
                self.size=0
                self.is_virgin=1
                self.reproduction_gap=0
                self.time_from_last_childbirth=0
		self.age=0


def visualize(catn,mousen):
#       while True:
        num=40
        size=10
        catno=catn*num**2/(catn+mousen)
        cats=random.sample(range(num**2),catno)
        for i in range(num**2):
                if i in cats:
                        dic[i].color=visual.color.red
                else :
                        dic[i].color=visual.color.green



mouse_size=20								#ind parameter
cat_mature_size=60						#ind parameter

cat_catch_rate=5*10**-4                                                 #parameter
cat_efficiency=0.8                                                      #parameter
a=0.2                                                                   #will get from slider
c=0.2                                                                   #will get from slider


mouse_no=1000
cat_no=1000
t=0
tmax=200
dt=1

timeli=[]
miceli=[]
catli=[]

mice=[rodent() for i in range(mouse_no)]
cats=[felix() for i in range(cat_no)]

catn=len(cats)
mousen=len(mice)

dic={}
num=40
size=10
catno=catn*num**2/(catn+mousen)
disp_cats=random.sample(range(num**2),catno)

#if self.wTree.get_widget("anim").get_active()==1:
#print 'yay!'
for i in range(num**2):
	coords=((i%num)*size*2-num*size,(i/num)*size*2-num*size)
	if i in disp_cats:
		dic[i]=visual.sphere(pos=coords,radius=size,color=visual.color.red)
	else :
		dic[i]=visual.sphere(pos=coords,radius=size,color=visual.color.green)
#print self.dic
catn=len(cats)
mousen=len(mice)
data=open('tempdata.dat','w')
timestart=time.time()
while (len(mice)>0 or len(cats)>0) and t<tmax and (time.time()-timestart)<60:
#print time.time()-timestart
	catn=len(cats)
	mousen=len(mice)
	#if self.wTree.get_widget("anim").get_active()==1:
	#	print 'yay!'
	visualize(catn,mousen)
#	thread.start_new_thread(self.visualize,(catn,mousen))
	
	for mouse in mice:			
		if mouse.time_from_last_childbirth>=1/a:
			mouse.time_from_last_childbirth=0
			mice.append(rodent())
	
		mouse.time_from_last_childbirth+=dt
	
	ind=0
	while ind<len(cats):
		cat=cats[ind]
		cat.age+=dt
		num=cat_catch_rate*dt*len(mice)
		
		for i in range(int(num)):
			caught=random.randint(0,len(mice)-1)
			cat.size+=mouse_size*cat_efficiency			#size increases
			mice.pop(caught)
		
		if (num-int(num))>random.uniform(0,1):
			caught=random.randint(0,len(mice)-1)
			cat.size+=mouse_size*cat_efficiency			#size increases
			mice.pop(caught)
		
		if cat.size>cat_mature_size:
			if cat.is_virgin:
				cat.is_virgin=0
				cat.reproduction_gap=cat.age
				cats.append(felix())
			else :
				if cat.time_from_last_childbirth>cat.reproduction_gap:
					cats.append(felix())
					cat.time_from_last_childbirth=0
	
		if cat.is_virgin==0:
			cat.time_from_last_childbirth+=dt
	
	
		if len(cats)>0:
			if c*dt*2*atan(0.05*len(cats))/pi>random.uniform(0,1):
				cats.pop(ind)
			else :
				ind+=1
		else :
			ind+=1
	
	
	timeli.append(t)
	miceli.append(len(mice))
	catli.append(len(cats))
	print t,'\t',len(mice),'\t',len(cats)
	print >> data, t,'\t',len(mice),'\t',len(cats)
	
	t+=dt
	
