:- dynamic used/2.
:- dynamic superset/6.

start:- consult(examples) , consult(primitive) , consult(permute_fixed) , not(initiate).

initiate:- true(A) , write(A) , size_of(X,A) , makelist(A,X,1,B) , findall(X1,true(X1),Y) , size_of(S,Y) , not(generate(B,S)) , retract(true(A)) , asserta(used(A,S)) , fail.

/* accessories to main functions */


/* makelist : converting all input arguments into lists */

makelist(A,X,M,[[B]|C]):- Y is X+1 ,\=(M,Y) ,find(M,A,B) , not(check_whether_list(B)) ,M1 is M+1 , makelist(A,X,M1,C).
makelist(A,X,M,[B|C]):- Y is X+1 ,\=(M,Y) ,find(M,A,B) , check_whether_list(B) ,M1 is M+1 , makelist(A,X,M1,C).
makelist(A,X,Y,[]):-Y is X+1 ,!.

check_whether_list(B):- =(B,[X|Y]).

/* makelist */


/* generate(B) : B=list of lists , when called asserts all possible supersets of the lists in B as superset(I,J,K,L,M). I=list number in B , J=size of the list I , K= size of the element of the superset , L = a number denoting when it was generated in the prescribed sequence of generation , M=the element of the superset itself */ 

generate(B,S):- generate_superset(B,S) , fail. 

generate_superset(B,S):- scan(A,B,C) , superset_assert(A,C,S).


superset_assert(A,C,Ex) :-scan(X,C,Y) , permute_fixed(C,X,E) ,  size_of(D,C) , findall(X ,superset(Ex,A,V,X,W,Z),L) , size_of(R,L)  ,S is R+1 , asserta(superset(Ex,A,D,X,S,E)) .


