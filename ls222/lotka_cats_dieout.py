#!/usr/bin/python

from math import *
import random
import matplotlib.pyplot as plt

class rodent:
	def __init__(self):
		self.size=10
		self.time_from_last_childbirth=0
		self.isdead=0

class felix:
	def __init__(self):
		self.size=20
                self.mature_size=60
		self.catch_rate=0.0005
		self.efficiency=0.4
		self.is_virgin=1
		self.time_from_last_childbirth=0
		self.isdead=0
		self.age=0


born_mice=0
born_cats=0
dead_cats=0
dead_mice=0
mice=[]
cats=[]
tli=[]
mli=[]
cli=[]

def dynamics():
	global born_mice,born_cats,dead_cats,dead_mice
	a=0.04
	b=0.0005
	c=0.2
	mouse_no=1000
	cat_no=1000
	t=0
	tmax=200
	dt=0.2

	mice=[rodent() for i in range(mouse_no)]
	cats=[felix() for i in range(cat_no)]


	while len(mice)> 0 and len(cats)>0 and t<tmax:
		for mouse in mice:			
			if mouse.time_from_last_childbirth>1.0/a:		#reproduces
				mice.append(rodent())
				born_mice+=1
				mouse.time_from_last_childbirth=0
			
			mouse.time_from_last_childbirth+=dt

		ind=0
		while ind<len(cats):
			cat=cats[ind]
			cat.age+=dt
			num=cat.catch_rate*dt*len(mice)
			for i in range(int(num)):
				caught=random.randint(0,len(mice)-1)
				cat.size+=mice[caught].size*cat.efficiency			#size increases
				mice.pop(caught)
				dead_mice+=1
			if (num-int(num))>random.uniform(0,1):
				caught=random.randint(0,len(mice)-1)
				cat.size+=mice[caught].size*cat.efficiency			#size increases
				mice.pop(caught)
				dead_mice+=1
	
			if cat.is_virgin:
				if cat.size>cat.mature_size:
					cat.is_virgin=0
					cat.reproduction_gap=cat.age
					cats.append(felix())
					born_cats+=1
					cat.time_from_last_childbirth=dt
			
			elif cat.is_virgin==0 and cat.time_from_last_childbirth>cat.reproduction_gap:		#reproduces
				cats.append(felix())
				born_cats+=1
				cat.time_from_last_childbirth=dt
				
			if len(cats)>50:
				if c*dt>random.uniform(0,1):
					cats.pop(ind)
					dead_cats+=1
				else :
					ind+=1
			else :
				ind+=1

		print t,'\t',len(mice),'\t',len(cats)
#		try:
#			print sum(i.size for i in cats)/len(cats)
#		except:
#			pass
		tli.append(t)
		mli.append(len(mice))
		cli.append(len(cats))

		t+=dt

dynamics()

print 'tot mice\t','tot cats\t','born mice\t','born cats\t','dead mice\t','dead cats'
print len(mice),'\t\t',len(cats),'\t\t',born_mice,'\t\t',born_cats,'\t\t',dead_mice,'\t\t',dead_cats

plt.plot(tli,mli,'b-',tli,cli,'r-')
plt.show()
