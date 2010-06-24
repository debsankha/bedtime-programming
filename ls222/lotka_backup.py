#!/usr/bin/env python

from math import *
import random
import matplotlib.pyplot as plt

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
	mouse_size=20							#ind parameter
	cat_mature_size=60						#ind parameter
	cat_catch_rate=0.0005						#parameter
	cat_efficiency=0.8						#parameter
	a=0.2								#parameter
	c=0.2								#parameter	


	mouse_no=1000
	cat_no=1000
	t=0
	tmax=200
	dt=0.2

	mice=[rodent() for i in range(mouse_no)]
	cats=[felix() for i in range(cat_no)]


	while len(mice)> 0 and len(cats)>0 and t<tmax:
		for mouse in mice:			
			if mouse.time_from_last_childbirth>=1/a:
				mouse.time_from_last_childbirth=0
				mice.append(rodent())
				born_mice+=1

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
				dead_mice+=1
			
			if (num-int(num))>random.uniform(0,1):
				caught=random.randint(0,len(mice)-1)
				cat.size+=mouse_size*cat_efficiency			#size increases
				mice.pop(caught)
				dead_mice+=1
			
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


			if len(cats)>50:
				if c*dt>random.uniform(0,1):
					cats.pop(ind)
					dead_cats+=1
				else :
					ind+=1
			else :
				ind+=1

		print t,'\t',len(mice),'\t',len(cats)

		tli.append(t)
		mli.append(len(mice))
		cli.append(len(cats))

		t+=dt

dynamics()

print 'tot mice\t','tot cats\t','born mice\t','born cats\t','dead mice\t','dead cats'
print len(mice),'\t\t',len(cats),'\t\t',born_mice,'\t\t',born_cats,'\t\t',dead_mice,'\t\t',dead_cats

plt.plot(tli,mli,'b-',tli,cli,'r-')
plt.show()
