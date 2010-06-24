#!/usr/bin/env python
from extra import *
import random
from random import normalvariate
from random import uniform
from math import *
import commands
import matplotlib.pyplot as plt

commands.getoutput('rm cat_mouse.out')

dt=0.4
tmax=50
debug=1

class mouse:
	def __init__(self):
		self.size=6
		self.eating_rate=0.6
		self.reproduction_gap=0.8
		self.time_from_last_childbirth=0
		self.isdead=0
		self.age=0

class felix:
	def __init__(self):
		self.size=15
		self.mature_size=20
		self.reproduction_gap=0.8
		self.catch_rate=1.25
		self.metabolism_rate=4
		self.is_virgin=1
		self.time_from_last_childbirth=0
		self.isdead=0
		self.age=0

def dynamics():
	global t,starved_cat,random_dead_cat,random_dead_mouse,eaten_mouse,born_mouse,born_cat
	
	mouse_no=1000
	cat_no=1000
	rice=500
	global dt,tmax
	t=1
	global mice,cats,mouse_life,cat_life
	mice=[mouse() for i in range(mouse_no)]
	cats=[felix() for i in range(cat_no)]

	starved_cat=0
	random_dead_cat=0
	random_dead_mouse=0
	eaten_mouse=0
	mouse_life=[]
	cat_life=[]
	
	while len(mice)>0 and len(cats)>0 and t<tmax:
		mno.append(len(mice))
		cno.append(len(cats))
		tli.append(t)
#		f=open('cat_mouse.out','a')

		for i in mice:
			i.age+=dt
			i.size+=i.eating_rate*dt						# it eats, of course
	

			if i.time_from_last_childbirth>i.reproduction_gap:	# maybe reproduces
				mice.append(mouse())
				i.time_from_last_childbirth=0
#				i.size-=i.size*1.0/10
				born_mouse+=1
		
			i.time_from_last_childbirth+=dt
		
		
		
		nvirg=0
		nmature=0
		
		for cat in cats:

			cat.age+=dt

			num=cat.catch_rate*len(mice)*dt/len(cats)
			if num>uniform(0,1) and num <1:					# it eats, of course
				try:
					caught=random.randint(0,len(mice)-1)
					cat.size+=mice[caught].size*0.3
					mice.pop(caught)
					eaten_mouse+=1
				except:
					pass
			elif num>1:
				for i in range(int(num)):
					try:
						caught=random.randint(0,len(mice)-1)
						cat.size+=mice[caught].size*0.3
						mice.pop(caught)
						eaten_mouse+=1
					except:
						pass

			if cat.size>=cat.mature_size:
				nmature+=1
				if cat.is_virgin==0:
					if cat.time_from_last_childbirth>cat.reproduction_gap:		# maybe reproduces
						cats.append(felix())
						cat.time_from_last_childbirth=0
						cat.size-=cat.size*1.0/10
						cat.is_virgin=0
						born_cat+=1
				else :
					cat.is_virgin==0
					cat_maturetime.append(cat.age)
					cats.append(felix())
					cat.time_from_last_childbirth=0
					cat.size-=cat.size*1.0/10
					cat.is_virgin=0
					born_cat+=1


			cat.size-=cat.metabolism_rate*dt						# weight loss due to starvation

			if cat.size<=cat.mature_size/4:						# death due to starvation
				cat.isdead=1
				starved_cat+=1
			
			if not cat.is_virgin:
				cat.time_from_last_childbirth+=dt
				nvirg+=1

#		print 'non virgin=%d total=%d'%(nvirg,len(cats))

		n=0
		if cats[0].isdead:
			print 'died'
		while n<len(cats):								# getting rid of the dead ones
			if cats[n].isdead:
				cat_life.append(cats[n].age)
				cat_size.append(cats[n].age)
				cats.pop(n)
			else :
				n+=1
		
#		print >> f, t,'\t',len(mice),'\t',len(cats)
		if debug:
			print  t,'\t',len(mice),'\t',len(cats)
			pass
#		f.close()
		t+=dt
	

dynamics()

print 'tot mice\trandomly dead mice\teaten mice\tborn mice\ttot cats\trandomly dead cats\tstarved cats\tborn cats'
print len(mice),'\t\t',random_dead_mouse,'\t\t\t',eaten_mouse,'\t\t',born_mouse,'\t\t',len(cats),'\t\t',random_dead_cat,'\t\t\t',starved_cat,'\t\t',born_cat
plt.plot(tli,mno,tli,cno)
#plt.axis([0,tmax,0,max([len(mice),len(cats)]*4)])
plt.show()
#print 'Avg life of mouse is\t%f'%(sum(mouse_life)/len(mouse_life))
#print 'Avg life of cat is\t%f'%(sum(cat_life)/len(cat_life))
#print 'Avg mature age of mouse is\t%f'%(sum(mouse_maturetime)/len(mouse_maturetime))
#print 'Avg mature age of cat is\t%f'%(sum(cat_maturetime)/len(cat_maturetime))
#print 'Avg size of mouse is\t%f'%(sum(mouse_size)/len(mouse_size))
#print 'Avg size of cat is\t%f'%(sum(cat_size)/len(cat_size))
