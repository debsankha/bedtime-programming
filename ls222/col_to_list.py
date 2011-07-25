def col_list(g,n):
    f = open(g,'r')
    l=[]
    for line in f.read().split('\n'):
        try:
            l.append(float(line.split('\t')[n-1]))
        except :
            continue


    return l

def moment(lst,n):
	avg=sum(lst)/len(lst)
	return sum([(i-avg)**n for i in lst])/len(lst)

def sd(lst):
	return sqrt(moment(lst,2))

def sq(lst):
	return moment(lst,3)/(sd(lst))**3

def kurt(lst):
	return moment(lst,4)/(moment(lst,2))**2


	

	
