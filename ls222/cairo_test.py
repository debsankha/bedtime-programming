import pygtk
import gtk
import gtk.glade
import time

class gui_display:
	global time
	def __init__(self):
		self.gladefile='./lvnew.glade'
		self.wTree=gtk.glade.XML(self.gladefile)
		dic={"on_start_clicked":self.dynamics,"on_mainwin_destroy" : gtk.main_quit}
		self.wTree.signal_autoconnect(dic)
		self.wTree.get_widget("mainwin").show()
	
	def dynamics(self,*args,**kwargs):
		cr=self.wTree.get_widget("darea").window.cairo_create()
		cr.set_source_rgb(0.2, 0.8, 0.1)
		w=self.wTree.get_widget("darea").allocation.width
		h=self.wTree.get_widget("darea").allocation.height
		cr.rectangle(0,0,w/75.0,h/75.0)
		cr.fill()
		

gui=gui_display()
gtk.main()
