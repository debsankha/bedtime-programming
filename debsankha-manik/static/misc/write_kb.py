#! /usr/bin/python

import re
from random import randint

f=open('common_facts.pl','r')
s=f.read().strip()

eqs=re.findall('<equals>([^<]*)</equals>',s)[0].strip().split('\n')
nulls=re.findall('<nulls>([^<]*)</nulls>',s)[0].strip().split('\n')
nargs=int(re.findall('<len>([^<]*)</len>',s)[0].strip())
diffs=re.findall('<diffs>([^<]*)</diffs>',s)[0].strip().split('\n')

Len=len(eqs)

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
	#print '\t',terms,li,
	res=''
	sarg=li
	if terms!=['']:
		for term in terms:
			farg=rand.randname(2)
			res+=term+'(%s,%s),'%(farg,sarg)
			sarg=farg
		#print '\t',res,farg
		return res,farg
	else:
		#print '\t','',li
		return '',li

def pred_convert(s,argl):
	#print s,argl
	li=s.strip().split('\t')
	#print 'li = ',li
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
	#print 'pred_convert returned: ',r
	return r

g=open('formed_rule.pl','w')

g.write('true([')

argli=[]

for i in range(nargs):
	name=rand.randname(2)
	argli.append(name)
	g.write(name)
	if i!=nargs-1:
		g.write(',')
	
g.write(']):-')

for i in nulls:
	g.write('(=([],%s)),'%argli[int(i)-1])

for i in eqs:
	g.write(pred_convert(i,argli))
	g.write(',')

g.write('1=1.\n')

g.write('true([')

argli=[]

for i in range(nargs):
	name=rand.randname(2)
	argli.append(name)
	g.write(name)
	if i!=nargs-1:
		g.write(',')
	
g.write(']):-')

for diff in diffs:
	num=int(diff.split('\t')[0])-1
	ops=diff.split('\t')[1][1:-1].split(',')
	res=chain_str(ops,argli[num])
	g.write(res[0])
	argli[num]=res[1]

args=reduce(lambda x,y:x+','+y,argli)
g.write('true(['+args+']).\n')

g.close()
