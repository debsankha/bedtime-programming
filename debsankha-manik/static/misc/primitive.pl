size_of(X,[A|B]):-  not(var(A)) , \=([A|B],[]) , size_of(Y,B) , ! , X is Y+1.
size_of(0,[]):-!.
find(A,[B|C],D):- \=(A,1) , ! ,  \=([B|C],[]) , E is A-1 , find(E,C,D). 
scan(A,B,D):- \=(B,[]) , var(D) , size_of(N,B) , M is 1 , find_all(A,B,D,M,N).
find_all(M,B,D,M,N):- find(M,B,D) , (=(N,M)->! ; 1=1).
find_all(A,B,D,M,N):- \=(M,N) , M1 is M+1 , find_all(A,B,D,M1,N).
find(1,[A|B],A):-!.
/*find(A,B,D):- var(A) , not(var(D)) , size_of(N,B) , find_all1(A,N,B,D).
find_all1(A,N,B,D):- A is N , find(A,B,D) , !.
find_all1(A,N,B,D):- \=(N,2) , M is N-1 , find_all1(A,M,B,D).*/


doall(X):-not(all_called(X)).

all_called(X):-call(X) , fail.

size_of(X,[A|B]):- \=(X,0) , ! , var(A) , Y is X-1 , size_of(Y,B).


generate_integer(1,X):- X>=1.
generate_integer(X,L):- L>1 , L1 is L-1 , generate_integer(Y,L1) , X is Y+1.



 
