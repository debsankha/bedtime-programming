#!/usr/bin/env python
from math import *
import thread
import random
import time
import pygtk
pygtk.require("2.0")
import gtk
import gtk.glade
import commands
import matplotlib
matplotlib.use('GTK')

from matplotlib.figure import Figure
from matplotlib.axes import Subplot
from matplotlib.backends.backend_gtkagg import FigureCanvasGTKAgg as FigureCanvas
from matplotlib.backends.backend_gtkagg import NavigationToolbar2GTKAgg as NavigationToolbar
from matplotlib.widgets import SpanSelector
from numpy import arange, sin, pi

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


#	print 'painted'


	

class gui_display:
	def __init__(self):
		self.gladefile='./lvshort2.glade'
		self.wTree = gtk.glade.XML(self.gladefile)
		dic={"on_start_clicked":self.dynamics,"on_mainwin_destroy":gtk.main_quit}
		self.wTree.signal_autoconnect(dic)
		self.f = Figure(figsize=(5,4), dpi=100)
		self.ax = self.f.add_subplot(111)
#		t = arange(0.0,3.0,0.01)
#		s = sin(2*pi*t)
#		a.plot(t,s)
		canvas = FigureCanvas(self.f)  # a gtk.DrawingArea
		canvas.set_size_request(600,400)
		self.wTree.get_widget("sw").add_with_viewport(canvas)
		toolbar = NavigationToolbar(canvas, self.wTree.get_widget("mainwin"))
		self.wTree.get_widget("vbox1").pack_start(toolbar,False,False)

		print 'added'
		self.wTree.get_widget("mainwin").show_all()
#		self.wTree.get_widget("image").set_from_file("./start.png")
		
	def visualize(self,catn,mousen):
#	while True:
		num=40
		size=10
		catno=catn*num**2/(catn+mousen)
		cats=random.sample(range(num**2),catno)
	
		for i in range(num**2):
			if i in cats:
				self.dic[i].color=visual.color.red
			else :
				self.dic[i].color=visual.color.green
	
	def dynamics(self,*args,**kwargs):
#		self.wTree.get_widget("image").set_from_file("./wait.png")
		print 'dynamics started'
		mouse_size=20								#ind parameter
		cat_mature_size=60							#ind parameter
		
#		catch_rate=5*10**-4 	                                                #parameter
#		cat_efficiency=0.8                                                      #parameter
#		a=0.2                                                                   #will get from slider
#		c=0.2                                                                   #will get from slider
		
		cat_catch_rate=self.wTree.get_widget("catchrate").get_value()*10**-4    #parameter
		cat_efficiency=self.wTree.get_widget("efficiency").get_value()          #parameter
		a=self.wTree.get_widget("a").get_value()                                #parameter
		c=self.wTree.get_widget("c").get_value()                                #parameter      
		
		mouse_no=1000
		cat_no=1000
		t=0
		tmax=200
		dt=0.4
		
		timeli=[]
		miceli=[]
		catli=[]
			
		mice=[rodent() for i in range(mouse_no)]
		cats=[felix() for i in range(cat_no)]
		
		catn=len(cats)
		mousen=len(mice)
		
		self.dic={}
		num=40
		size=10
		catno=catn*num**2/(catn+mousen)
		disp_cats=random.sample(range(num**2),catno)
	
		if self.wTree.get_widget("anim").get_active()==1:
			print 'yay!'
			for i in range(num**2):
				coords=((i%num)*size*2-num*size,(i/num)*size*2-num*size)
				if i in disp_cats:
					self.dic[i]=visual.sphere(pos=coords,radius=size,color=visual.color.red)
				else :
					self.dic[i]=visual.sphere(pos=coords,radius=size,color=visual.color.green)
		print self.dic
		catn=len(cats)
		mousen=len(mice)
		data=open('tempdata.dat','w')
		timestart=time.time()
		while len(mice)>0 and len(cats)>0 and t<tmax and (time.time()-timestart)<60:
			print time.time()-timestart
			catn=len(cats)
			mousen=len(mice)
			if self.wTree.get_widget("anim").get_active()==1:
				print 'yay!'
#				self.visualize(catn,mousen)
				thread.start_new_thread(self.visualize,(catn,mousen))

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
		#	print t,'\t',len(mice),'\t',len(cats)
			print >> data, t,'\t',len(mice),'\t',len(cats)
	
			t+=dt
		data.close()
		
		upper_limit=1.2*len(mice)
		pltfile=open('lv.plt','w')
		print >> pltfile,"""se te png
se o "/tmp/lv.png"
unse ke
#se yrange [0:%f]
se xl "Time"
se yl "Number of Prey/Predator"
p 'tempdata.dat' u 1:2 w l,'tempdata.dat' u 1:3 w l
"""%upper_limit
		pltfile.close()
		commands.getoutput('gnuplot lv.plt')
	
		self.ax.plot(timeli,miceli,timeli,catli)
		canvas = FigureCanvas(self.f)  # a gtk.DrawingArea
		canvas.set_size_request(600,400)
		self.wTree.get_widget("sw").add_with_viewport(canvas)


		print 'dynamics ended'

gui=gui_display()
gtk.main()


#dynamics()

#import matplotlib.pyplot as plt
#plt.plot(timeli,miceli,'go',timeli,catli,'ro')
#plt.show()


