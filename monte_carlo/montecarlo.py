### This is a basic implementation of Metropolis algorithm. This will produce S values upto 2000 Monte Carlo steps by default and plot the graph by matplotlib. but if the value of S does not change for successive 100 steps, this program does not calculate further and assumes that s will remain the same for the rest of the steps.###




#import numpy as np
from random import uniform
from math import *
#let's first calculate the initial Energy
J=-5.0
#k=1.0
t=15.0
F=-0.1
beta=1/t
print 't is\t',t
#the size of the lattice is m*n
m=30	
n=30
d1={}
S=0
#assignment of random spin
for i in range(m):
	for j in range(n):
		r1=uniform(0,1)
		if r1<=0.5:
			d1[(i,j)]=-1
			S+=-1
		else :
			d1[(i,j)]=1
			S+=1
			

	
	
#getting an array of neighbours
d2={}
for i in range(1,m-1):
	for j in range(1,n-1):
		d2[(i,j)]=[(i-1,j),(i+1,j),(i,j-1),(i,j+1)]
		
for i in range(1,m-1):
	d2[i,0]=[(i-1,0),(i+1,0),(i,1),(i,n-1)]
	d2[i,n-1]=[(i-1,n-1),(i+1,n-1),(i,n-2),(i,0)]
	
for j in range(1,n-1):
	d2[0,j]=[(1,j),(m-1,j),(0,j-1),(0,j+1)]
	d2[m-1,j]=[(m-2,j),(0,j),(m-1,j-1),(m-1,j+1)]
	
d2[0,0]=[(0,1),(1,0),(m-1,0),(0,n-1)]
d2[0,n-1]=[(0,0),(0,n-2),(1,n-1),(m-1,n-1)]
d2[m-1,0]=[(m-2,0),(0,0),(m-1,1),(m-1,n-1)]
d2[m-1,n-1]=[(m-2,n-1),(0,n-1),(m-1,0),(m-1,n-2)]

# performing the monte carlo step
#let z be the no. of monte carlo steps to be performed
from random import uniform
slist=[S]
z=2000
f=open('ex'+str(t),'w')
cond=0
for q in range(z):
	for w in range(m*n):
		i=int(uniform(0,m))
		j=int(uniform(0,n))
		dh=-2*J*d1[(i,j)]*(d1[d2[(i,j)][0]]+d1[d2[(i,j)][1]]+d1[d2[(i,j)][2]]+d1[d2[(i,j)][3]])#-2*F*t*d1[(i,j)]
		if dh<=0:
			d1[(i,j)]=-1*d1[(i,j)]
			S+=2*d1[(i,j)]
		elif exp(-1*beta*dh)>=uniform(0,1):
			d1[(i,j)]=-1*d1[(i,j)]
			S+=2*d1[(i,j)]
		else :
			pass
	
	#print q,'\t',abs(S)
	slist.append(abs(S))
	


	if q>100:
		avin=0
		for p in range(1,100):
			avin+=abs(slist[-1*p]-slist[-1])
	
	
		if avin==0:
			cond=1
			break
					
	if cond==1:
		break
				
	

       

	#print >> f, q,'\t',H
for i in range(2000-q):
	slist.append(slist[-1])	

print >> f, slist
f.close()
import matplotlib.pyplot as plt
plt.plot(slist,'g--')
plt.axis([0,2000,0,1000])
plt.grid(True)
plt.show()


