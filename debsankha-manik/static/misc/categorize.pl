file_search_path(route,'sunshine_alps/memory').


categorize:- consult(route(memory)) , not(consultall) ,  not(categorizeall).


consultall:- memory_predicates(L) , scan(A,L,B) , consult(route(B)) , fail.

categorizeall:- findall(Y,used(Y),L) , size_of(Length,L) , generate_integer(X,Length) , superset(X,G,A1,B1,C1,D1) , superset(X,G1,A2,B2,C2,D2) , ((=(G1,G) , =(B1,B2) , =(C1,C2))->fail; true) ,  check(X,G,G1,B1,B2,C1,C2,Out) ,asserta(fact(ex(X),place(G,G1),size(A1,A2),first_index(B1,B2),second_index(C1,C2),lists(D1,D2),relations(Out))), fail.

check(X,G,G1,B1,B2,C1,C2,Out):- memory_predicates(L) , size_of(Size,L) , check1(L,Size,X,G,G1,B1,B2,C1,C2,Out) . 

check1(L,Size,X,G,G1,B1,B2,C1,C2,[Out|Rest]):-superset(X,G,A1,B1,C1,D1) , superset(X,G1,A2,B2,C2,D2) , scan(Size,L,Name) , Z=..[Name,D1,D2] , (Z-> =(Out,yes) ; =(Out,no)) , Newsize is Size-1 , check1(L,Newsize,X,G,G1,B1,B2,C1,C2,Rest).

check1(L,0,X,G,G1,B1,B2,C1,C2,[]).
