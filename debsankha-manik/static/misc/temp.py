
from random import randint
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
	for term in terms:
		farg=rand.randname(2)
		res+=term+'(%s,%s),'%(farg,sarg)
		sarg=farg
	
	return res,farg


def pred_convert(s):
	li=s.split('\t')
	r='('
	fli=rand.randname(2)
	sli=rand.randname(2)
	r+='nth1(%s,L,%s),nth1(%s,L,%s),'%(li[0],fli,li[1],sli)
	
	link1=li[-2]
	terms=link1[1:-1].split(',')
	chain1=chain_str(terms,fli)
	r+=chain1[0]

	link2=li[-1]
	terms=link2[1:-1].split(',')
	chain2=chain_str(terms,sli)
	r+=chain2[0]

	r+='=(%s,%s))'%(chain1[1],chain2[1])

