#!/usr/bin/env python
from math import *
import thread
import random
import time
import gobject
import gtk

import matplotlib
matplotlib.use('GTKAgg')
from matplotlib import rcParams

import pylab

anim_finished=1

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


def plot(tli,mouseli,catli):
	ax1.plot(tli,mouseli,tli,catli)
	manager = pylab.get_current_fig_manager()
	anim_finished=1
	manager.canvas.draw()
	pylab.show()


def animate():
	global anim_finished,mouse_size,cat_mature_size,cat_catch_rate,cat_efficiency,a,c,mouse_no,cat_no,t,tmax,dt,mice,cats,ax1
	while True:
		num_sq=40
		arm=1000
		smallarm=arm*.25/num_sq
		catno=len(cats)*num_sq**2/(len(cats)+len(mice))
		fig_cats=random.sample(range(num_sq**2),catno)
		xli=[]
		yli=[]
		cli=[]
		
		for i in range(num_sq**2):
			xli.append((i%num_sq)*smallarm+smallarm/2.0)
			yli.append((i/num_sq)*smallarm+smallarm/2.0)
			if i in fig_cats:
				cli.append('r')
			else :
				cli.append('b')
	
		ax1.scatter(xli,yli,c=cli,s=smallarm**2,alpha=0.75,marker='s')
		manager = pylab.get_current_fig_manager()
		manager.canvas.draw()
		time.sleep(200)


def animate2():
	pylab.show()

fig1 = matplotlib.pyplot.figure()
ax1= fig1.add_subplot(111,animated=True)
	
mouse_size=20								#ind parameter
cat_mature_size=60							#ind parameter
cat_catch_rate=5*10**-4							#parameter
cat_efficiency=0.8							#parameter
a=0.2									#will get from slider
c=0.2									#will get from slider
mouse_no=1000
cat_no=1000
t=0
tmax=200
dt=0.2

timeli=[]
miceli=[]
catli=[]
	
mice=[rodent() for i in range(mouse_no)]
cats=[felix() for i in range(cat_no)]

def dynamics(*args,**kwargs):
	global anim_finished,mouse_size,cat_mature_size,cat_catch_rate,cat_efficiency,a,c,mouse_no,cat_no,t,tmax,dt,mice,cats,ax1,timeli,miceli,catli
	
#	num_sq=100
#	arm=100
#	smallarm=arm*1.0/num_sq
#	catno=len(cats)*num_sq**2/(len(cats)+len(mice))
#	fig_cats=random.sample(range(num_sq**2),catno)
#	xli=[]
#	yli=[]
#	cli=[]
#	
#	for i in range(num_sq**2):
#		xli.append((i%num_sq)*smallarm+smallarm/2.0)
#		yli.append((i/num_sq)*smallarm+smallarm/2.0)
#		if i in fig_cats:
#			cli.append('r')
#		else :
#			cli.append('b')
#
#	ax1.scatter(xli,yli,c=cli,s=smallarm**2,alpha=0.75)
#	manager = pylab.get_current_fig_manager()
#	manager.canvas.draw()
#	pylab.show()	
	
	thread.start_new_thread(animate,())
	while len(mice)> 0 and len(cats)>0 and t<tmax:
#		while 1==1:
#			print anim_finished
#			if anim_finished==1: 
#				break
#			else :
#				time.sleep(0.200)

		thread.start_new_thread(animate2,())
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


			if len(cats)>50:
				if c*dt>random.uniform(0,1):
					cats.pop(ind)
				else :
					ind+=1
			else :
				ind+=1


		timeli.append(t)
		miceli.append(len(mice))
		catli.append(len(cats))
		print t,'\t',len(mice),'\t',len(cats)

		t+=dt

dynamics()

