from visual import *
from math import *
scene=display(range=4)
def p2c(r,th,phi):
	return r*sin(th)*cos(phi),r*sin(th)*sin(phi),r*cos(th)

def c2p(x,y,z):
	r=sqrt(x**2+y**2+z**2)
	th=acos(z*1.0/r)
	if y>0:
		phi=acos(x/sqrt(r**2-z**2))
	else :
		phi=2*pi-acos(x/sqrt(r**2-z**2))
	
	return r,th,ph

def distance(p1,p2):
	return sqrt((p1[0]-p2[0])**2+(p1[1]-p2[1])**2+(p1[2]-p2[2])**2)

def find_fourth(p1,p2,p3):
	c1=(p1+p2+p3)/3
	perp_dir=cross((p1-p2),(p1-p3))
	perp_dir=norm(perp_dir)
	c1=c1+perp_dir*sqrt(8.0/3)
	return c1,c1-2*perp_dir*sqrt(8.0/3)

def add_sphere(s1,s2,n):
	global count
	count+=1
	center=find_fourth(s1.pos,s2.pos,core.pos)[n]
	sn=sphere(radius=1,color=(0.8,0.2,0),opacity=1,pos=center)
	label(pos=sn.pos*1.5, text=str(count))
	return sn

def slide(obj):
	p=scene.mouse.pos
	l_dist
	for other in scene.objects:
		l_dist.append(mag(p-other.pos))
		l_dist.pop(0)
	if min(l_dist)>=2:
		polar=c2p(p)
		polar[0]=2
		cart=p2c(polar)
		obj.pos=cart
	
	
		
core=sphere(radius=1,color=(0,0.2,0.8),opacity=1)
outer=sphere(radius=3,color=(0,0.2,0.8),opacity=0.3)
pos0=vector(0,0,0)
pos1=vector(p2c(2,pi/2,0))
pos2=vector(p2c(2,pi/2-pi/3,0))
b1=sphere(radius=1,color=(0.8,0.2,0),opacity=1,pos=pos1)
label(pos=b1.pos*1.5, text='1')
b2=sphere(radius=1,color=(0.8,0.2,0),opacity=1,pos=pos2)
label(pos=b2.pos*1.5, text='2')
count=2

b3=add_sphere(b1,b2,0)
b4=add_sphere(b1,b3,0)
b5=add_sphere(b4,b3,0)
b6=add_sphere(b4,b5,0)
b7=add_sphere(b5,b6,1)
b8=add_sphere(b5,b7,1)
b9=add_sphere(b1,b4,0)
b10=add_sphere(b1,b2,1)
b11=add_sphere(b10,b2,1)
b12=add_sphere(b6,b7,0)
b13=add_sphere(b10,b11,1)
while scene.mouse.button == 'left':
	ob=scene.mouse.pick
	slide(obj)
	
