:-dynamic(once/0).


/* permute_fixed : given a list A of fixed size L, generates all permutations of the elements in A of all sizes */

permute_fixed(A,L,[R|S]):-seek1(A,L,[R|S],[]).

seek1(A,L,[R|S],X):- \=(L,0), !  , element(A,X,R) , =(Xnew,[R|X]) , D is L-1 , seek1(A,D,S,Xnew).

seek1(A,0,[],X).

/* permute_fixed */





/* renew(A,B,C) : delete the first occurance of B in A and return the renewed list as C */

renew(A,[],A).
renew(A,B,C):- update(A,B,C) , retract(once).
update([A|B],C,[A|S]):- \=([A|B],[]) , \=(A,C) , ! ,update(B,C,S).
update([A|B],C,R):- \=([A|B],[]) , not(once) , =(A,C) , ! , asserta(once) , update(B,C,R).
update([A|B],C,[A|S]):- \=([A,B],[]) , once , =(A,C) , !, update(B,C,S).
update([],C,[]):-!.

/* renew(A,B,C) */




/* element(A,C,R) : delete the first occurances of elements in C from A, and returns the elements of the renewed list one by one. */ 

element(A,C,R):-recur(A,C,Z) , scan(X,Z,R).

recur(A,[X|Y],Z):- \=([X|Y],[]) ,renew(A,X,Anew) , recur(Anew,Y,Z).
recur(A,[],A).


/* element(A,C,R) */ 

renew_var(A,B,C):-update_var(A,B,C) , retract(once).
update_var([A|B],C,[D|E]):- var(A) , ((\=(A,C) ; once)-> =(A,D) , update_var(B,C,E) ; update_var(B,C,[D|E]) , asserta(once)).
update_var([],C,[]):-!.

