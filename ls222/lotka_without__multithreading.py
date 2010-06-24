#!/usr/bin/env python
from math import *
import random
import matplotlib.pyplot as plt
import time

try:
	import pygtk
	pygtk.require("2.0")
except:
	pass

try:
	import gtk
	import gtk.glade
except:
	sys.exit(1)

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

class gui_display:
	def __init__(self):
		self.gladefile='./lvnew.glade'
		self.wTree = gtk.glade.XML(self.gladefile)
		dic={"on_start_clicked":self.dynamics,"on_mainwin_destroy":gtk.main_quit}
		self.wTree.signal_autoconnect(dic)
		self.wTree.get_widget("mainwin").show()
	
	def randfill(self,cat,mouse):
#		self.cr.set_source_rgb(0.2, 0.8, 0.1)
#		self.cr.rectangle(0,0,w,h)
#		cr.fill()
		n=100
		arm=self.wTree.get_widget("darea").allocation.width
		print 'arm is %d'%arm
		smallarm=arm/n
		catno=cat*n**2/(cat+mouse)
		cats=random.sample(range(n**2),catno)
		for i in cats:
			self.cr.set_source_rgb(1,0.3,0)
			self.cr.rectangle((i%n)*smallarm,(i/n)*smallarm,(i%n+1)*smallarm,(i/n+1)*smallarm)
			self.cr.fill
	
		for i in range(n**2):
			if not i in cats:
				self.cr.set_source_rgb(0,0.3,1.0)
				self.cr.rectangle((i%n)*smallarm,(i/n)*smallarm,(i%n+1)*smallarm,(i/n+1)*smallarm)
				self.cr.fill

	def dynamics(self,*args, **kwargs):
		self.cr=self.wTree.get_widget("darea").window.cairo_create()

		print 'Cairo created'
		self.cr.set_source_rgb(0.2, 0.8, 0.1)
		self.cr.rectangle(0,0,300,300)
		print repr(self.cr.rectangle(0,0,300,300))
		self.cr.fill()
		
		mouse_size=20								#ind parameter
		cat_mature_size=60							#ind parameter
		cat_catch_rate=self.wTree.get_widget("catchrate").get_value()*10**-4	#parameter
		cat_efficiency=self.wTree.get_widget("efficiency").get_value()		#parameter
		a=self.wTree.get_widget("a").get_value()				#parameter
		c=self.wTree.get_widget("a").get_value()				#parameter	
	
	
		mouse_no=1000
		cat_no=1000
		t=0
		tmax=200
		dt=0.2

		tli=[]
		mli=[]
		cli=[]
		
		mice=[rodent() for i in range(mouse_no)]
		cats=[felix() for i in range(cat_no)]
	
	
		while len(mice)> 0 and len(cats)>0 and t<tmax:
			print 'exec self.randfill(%d,%d)'%(len(mice),len(cats))
			self.randfill(len(mice),len(cats))
			time.sleep(1)
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
	
			print t,'\t',len(mice),'\t',len(cats)
	
			tli.append(t)
			mli.append(len(mice))
			cli.append(len(cats))
	
			t+=dt


gui=gui_display()
gtk.main()

plt.plot(tli,mli,'b-',tli,cli,'r-')
plt.show()
