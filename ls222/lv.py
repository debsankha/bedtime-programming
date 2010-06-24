#!/usr/bin/python

import matplotlib.pyplot as plt

a=0.08
b=0.0005
c=0.2
e=0.4
t=0
dt=0.2
x=1000
y=1000

tli=[]
xli=[]
yli=[]

while t<50:
	x+=a*x-b*x*y
	y+=e*b*y*x-c*y
	t+=dt
	tli.append(t)
	xli.append(x)
	yli.append(y)

plt.plot(tli,xli,'g-',tli,yli,'b-')
#plt.axis([,max(xli),-200,max(yli)])
plt.grid(True)


plt.xlabel('Time')
plt.ylabel('Size of population')

plt.annotate('no. of predators',xy=(45.7,344),xytext=(46,1033),bbox=dict(boxstyle="round",fc=(1.0, 0.7, 0.7), ec=(1., .5, .5)),arrowprops=dict(arrowstyle="wedge,tail_width=0.4",fc=(1.0, 0.7, 0.7), ec=(1., .5, .5)))


plt.annotate('no. of preys',xy=(43.5,3455),xytext=(47,3755),bbox=dict(boxstyle="round",fc=(1.0, 0.7, 0.7), ec=(1., .5, .5)),arrowprops=dict(arrowstyle="wedge,tail_width=0.4",fc=(1.0, 0.7, 0.7), ec=(1., .5, .5)))		

plt.annotate('y=0.93',xy=(38.8,.9398),xytext=(33,292),fontsize='large',arrowprops=dict(arrowstyle="->"))

plt.show()
