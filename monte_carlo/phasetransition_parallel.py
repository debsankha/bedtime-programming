### this is a program optimised for parallel processing in a network in which all the computers can access at least one storage media simultaneously. This program takes some parameters from a file 'phasetransition.config', which is written by the program 'parallel.py'.so 'parallel.py' MUST BE RUN before this program ###

from random import uniform
from math import *
import commands

# the tricks to determine the machine's ip
hostname=commands.getoutput('hostname')
ip=int(hostname[6:])

#now we define a function which returns a range with non-integral increment.
def my_range(a,b,d):
	n=len(str(d).split('.')[1])
	return [i/(10.0*n) for i in range(a*10*n,b*10*n,int(d*10*n))]
	

#reading the parameters from phasetransition.config
conf=getoutput('cat phasetransition.config | grep 10.0.0.%d'%ip)
sl=int(conf.split('\t')[1])
start=int(conf.split('\t')[2])
end=int(conf.split('\t')[3])


f=open('trand'+str(sl),'w')
f.close()
J=-5.0
m=30
n=30


for t in myrange(start,end,0.2)
	beta=1.0/t
	f=open('trand'+str(sl),'w')
	st=[]
	ht=[]
	for run in range(100):
		d1={}
		S=0
		#assignment of random spin
		for i in range(m):
			for j in range(n):
				r1=uniform(0.0,1.0)
				if r1<=0.5:
					d1[(i,j)]=-1
					S-=1
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
		#let q be the maximum no. of monte carlo steps to be performed
		from random import uniform
		slist=[]
		
		q=0
		cond=0
		while q<=1000:
			for w in range(m*n):
				i=int(uniform(0.0,m*1.0))
				j=int(uniform(0.0,n*1.0))
				dh=-2*J*d1[(i,j)]*(d1[d2[(i,j)][0]]+d1[d2[(i,j)][1]]+d1[d2[(i,j)][2]]+d1[d2[(i,j)][3]])
				if dh<=0:
					S+=-2*d1[(i,j)]
					d1[(i,j)]=-d1[(i,j)]
			
				elif exp(-1*beta*dh)>=uniform(0.0,1.0):
					d1[(i,j)]=-d1[(i,j)]
					S+=2*d1[(i,j)]
		
		
			q+=1	
			slist.append(S)
			
			
		
			if q>100:
				avin=0
				for p in range(1,100):
					avin+=abs(slist[-1*p]-slist[-1])


				if avin==0:
					cond=1
					break
				
			if cond==1:
				break
			
		st.append(abs((sum(slist[-100:])*1.0/100)))

	
	sav=sum(st)/len(st)
	print >> f, t,'\t',sav
	f.close()
		


