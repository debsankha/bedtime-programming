#!/usr/bin/env python

import random
from random import normalvariate
from random import uniform
from math import *

def maxwell(x,xmax):
	if x<xmax:			# a function <=1 with maxima at xmax
		return sqrt(x*1.0/xmax)
	else:
		return exp(-(x-xmax))

#def maxwell(t,tstable):
#	if t<tstable:
#		return tstable*1.0/(t*5)
#	elif t>tstable:
#		return 0.8



class mouse:
	def __init__(self):
		global t
		self.death_probab=1-exp(-0.1*t)
		self.size=normalvariate(5,2)
		self.b=normalvariate(2,0.4)
		self.eating_rate=self.b*t
		self.mature_size=normalvariate(10,5)
		self.reproduction_gap=normalvariate(1,0.4)
		self.death_probab=(1-exp(-0.01*t))				# will vary as (1-1/t)
		self.is_virgin=1
		self.time_from_last_childbirth=0
		self.isdead=0
		self.age=0

class felix:
	def __init__(self):
		global t
		self.death_probab=(1-exp(-0.1*t))
		self.size=normalvariate(15,3)
		self.catch_rate=maxwell(t,0.3)							# will increase upto t=5
		self.mature_size=normalvariate(40,4)
		self.reproduction_gap=normalvariate(1.0,0.4)
		self.metabolism_rate=self.mature_size*0.004
		self.is_virgin=1
		self.time_from_last_childbirth=0
		self.isdead=0
		self.age=0

t=1
starved_cat=0
random_dead_cat=0
random_dead_mouse=0
eaten_mouse=0
born_mouse=0
born_cat=0
mouse_life=[]
mouse_maturetime=[]
cat_life=[]
cat_maturetime=[]
mouse_size=[]
cat_size=[]

def dynamics():
	global t,starved_cat,random_dead_cat,random_dead_mouse,eaten_mouse,born_mouse,born_cat
	
	mouse_no=1000
	cat_no=1000
	rice=500
	dt=0.2
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
	while len(mice)>0 and len(cats)>0:
		f=open('cat_mouse.out','a')

		for i in mice:
			i.age+=dt
			i.size+=i.eating_rate*dt*maxwell(i.eating_rate,3)		# it eats, of course
			if i.size>=i.mature_size:
				if i.is_virgin==0:
					if i.time_from_last_childbirth>i.reproduction_gap:	# maybe reproduces
						mice.append(mouse())
						i.size-=i.size*1.0/10
						i.is_virgin=0
						born_mouse+=1
				else :
					i.is_virgin==0
					mouse_maturetime.append(i.age)
					mice.append(mouse())
					i.size-=i.size*1.0/10
					i.is_virgin=0
					born_mouse+=1



			if i.death_probab>=uniform(0,1):
				i.isdead=1
				random_dead_mouse+=1
				continue

			if not i.is_virgin:
				i.time_from_last_childbirth+=dt
		
		n=0
		while n<len(mice):								# getting rid of the dead ones
			if mice[n].isdead:
				mouse_life.append(mice[n].age)
				mouse_size.append(mice[n].size)
				mice.pop(n)
			else :
				n+=1

		for cat in cats:
			cat.age+=dt
			cat.death_probab=1-exp(-0.01*t)
			if cat.catch_rate>=uniform(0,1):					# it eats, of course
				try:
					caught=random.randint(0,len(mice)-1)
					cat.size+=mice[caught].size*maxwell(cat.size,cat.mature_size)
					mice.pop(caught)
					eaten_mouse+=1
				except:
					pass

			if cat.size>=cat.mature_size:
				if cat.is_virgin==0:
					if cat.time_from_last_childbirth>cat.reproduction_gap:		# maybe reproduces
						cats.append(felix())
						cat.size-=cat.size*1.0/10
						cat.is_virgin=0
						born_cat+=1
				else :
					cat.is_virgin==0
					cat_maturetime.append(cat.age)
					print 'Cat matured at age  ',cat.age,'mature_size  ',cat.mature_size,'size   ',cat.size
					cats.append(felix())
					cat.size-=cat.size*1.0/10
					cat.is_virgin=0
					born_cat+=1


			cat.size-=cat.metabolism_rate*dt						# weight loss due to starvation

			if cat.size<=cat.mature_size/4:						# death due to starvation
				cat.isdead=1
				starved_cat+=1

			if cat.death_probab>=uniform(0,1):				# random death
				cat.isdead=1
				random_dead_cat+=1
				continue

			if not cat.is_virgin:
				cat.time_from_last_childbirth+=dt
		

		n=0
		while n<len(cats):								# getting rid of the dead ones
			if cats[n].isdead:
				cat_life.append(cats[n].age)
				cat_size.append(cats[n].age)
				cats.pop(n)
			else :
				n+=1
		
		print >> f, t,'\t',len(mice),'\t',len(cats)
		print  t,'\t',len(mice),'\t',len(cats)
		f.close()
		t+=dt
	

dynamics()

print 'tot mice\trandomly dead mice\teaten mice\tborn mice\ttot cats\trandomly dead cats\tstarved cats\tborn cats'
print len(mice),'\t\t',random_dead_mouse,'\t\t\t',eaten_mouse,'\t\t',born_mouse,'\t\t',len(cats),'\t\t',random_dead_cat,'\t\t\t',starved_cat,'\t\t',born_cat

print 'Avg life of mouse is\t%f'%(sum(mouse_life)/len(mouse_life))
print 'Avg life of cat is\t%f'%(sum(cat_life)/len(cat_life))
print 'Avg mature age of mouse is\t%f'%(sum(mouse_maturetime)/len(mouse_maturetime))
print 'Avg mature age of cat is\t%f'%(sum(cat_maturetime)/len(cat_maturetime))
print 'Avg size of mouse is\t%f'%(sum(mouse_size)/len(mouse_size))
print 'Avg size of cat is\t%f'%(sum(cat_size)/len(cat_size))
