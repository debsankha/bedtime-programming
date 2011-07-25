in_order_sl(X,Y,Z):- in_order_sl1(X,Y,[],Z).

in_order_sl1(X,[],Y,Y).

in_order_sl1(X,[A|Y],Z,M):- scan(C,X,A) , not((scan(D,Z,E) , C=<E)) , in_order_sl1(X,Y,[C|Z],M).



sp_in_order_sl(X,Y,Z):- in_order_sl(X,Y,Z) , \=(Y,[]) , not(check_elements(Z)).

check_elements(Z):- scan(A,Z,B) , scan(C,Z,D) , E is abs(B-D) , F is abs(A-C) , \=(E,F).

partition(X,Y):- consult(primitive) , partition1(X,Y).

partition1([],[]).

partition1(W,[Y|W1]):-  \=(W,[]) , =(W,[V|V1]) , sp_in_order_sl(W,Y,Z) , =(Y,[V|V2]) , many_indexed_delete(W,Z,X1) ,  partition1(X1,W1).

check_partition(X,Y):- join_lists(Y,Z) , =(X,Z).

join_lists(Y,Z):- scan(A,Y,B) , ! , delete(Y,B,C) , join_lists(C,Z1), append(B,Z1,Z).

join_lists([],[]):- !.

indexed_delete(A,B,C):-indexed_delete1(A,B,C,1).

indexed_delete1([A|X],B,X,B):-!.
indexed_delete1([A|X],B,[A|Y],L):- \=(L,B) , M is L+1 , indexed_delete1(X,B,Y,M) , !.

many_indexed_delete(A,B,C):- mark(A,B,A1) , many_indexed_delete1(A1,C).

mark(A,[B|B1],C):- construct(A,B,C1,1) , (=([],B1)-> =(C,C1) ; mark(C1,B1,C)).

construct([A|X],B,[[A,delete]|X],B):- !.
construct([A|X],B,[A|Y],L):-  \=(L,B) , M is L+1 , construct(X,B,Y,M) ,!.

many_indexed_delete1([A|X],Y):- \=([A|X],[]) , (=(A,[B,delete])->many_indexed_delete1(X,Y) ; (=(Y,[A|Y1]) , many_indexed_delete1(X,Y1))).

many_indexed_delete1([],[]).

