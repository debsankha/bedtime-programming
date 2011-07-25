#! /usr/bin/python
import re
from random import randint

def subsets(l):
	import copy
	if len(l)==1:
		return [[],l]
	else:
		rest=l[1:]
		oth=subsets(rest)
#		oth2=list(oth)	#doesn't create new list, damnit python.
		oth2=[]
		oth2=copy.deepcopy(oth)
#		for i in oth:
#			oth2.append([])
#			last=oth2[-1]
#			for j in i:
#				last.append(j)
#		for i in range(len(oth2)-1):
#			oth2[i]=[l[0]]+oth2[i]
		for i in oth2:
			i.append(l[0])
			
		
		return reduce(lambda X,Y:X+Y,map(lambda X,Y:[X,Y],oth,oth2))


def not_len(L):
	global Len
	if len(L)!=Len and L!=[]:
		return True
	else:
		return False


class my_random:
	def __init__(self):
		self.taken=[]

	def randname(self,n):
		s=''
		for i in range(n):
			s+=chr(randint(65,90))
		
		if not s in self.taken:
			self.taken.append(s)
			return s
		else:
			return self.randname(n)

rand=my_random()

def chain_str(terms,li):
	res=''
	sarg=li
	if len(terms)>0:
		for term in terms:
			farg=rand.randname(2)
			res+=term+'(%s,%s),'%(farg,sarg)
			sarg=farg
		
		return res,farg
	else:
		return '',li


def pred_convert(s,argl):
	li=s.split('\t')
	r='('
	fli=argl[int(li[0])-1]
	sli=argl[int(li[1])-1]

	link1=li[-2]
	terms=link1[1:-1].split(',')
	chain1=chain_str(terms,fli)
	r+=chain1[0]

	link2=li[-1]
	terms=link2[1:-1].split(',')
	chain2=chain_str(terms,sli)
	r+=chain2[0]

	r+='=(%s,%s))'%(chain1[1],chain2[1])
	return r
