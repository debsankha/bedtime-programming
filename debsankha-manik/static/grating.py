import matplotlib as mpl
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
import matplotlib.pyplot as plt
from math import sin,pi,cos,asin
mpl.rcParams['legend.fontsize'] = 10

n=5000						#number of datapoints to plot
d=10**-5					#gap between successive notches
lam=6*10**-7					#wavelength
num=5						#numbers of notches

fig = plt.figure()
ax = Axes3D(fig)


th=np.arange(0,2*pi,2*pi/n)
X=[sin(i) for i in th]
Y=[cos(i) for i in th]
Z=np.arange(0,2*pi,2*pi/n)

for i in range(len(th)):
	try:
		Z[i]=(sin(num*pi*(d/lam)*sin(th[i]))/sin(pi*(d/lam)*sin(th[i])))**2
	except :
		print "error at %d"%(th[i])
		Z[i]=0


ax.plot(X,Y,Z, label='Grating.py')
ax.legend()
plt.show()

