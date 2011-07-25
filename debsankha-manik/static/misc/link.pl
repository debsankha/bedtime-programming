:-dynamic(used/2).
:-dynamic(link_wid_self/3).
:-dynamic(link_wid_others/3).

create_partition(S,B):- consult(partition), used([A|X],S) , partition(A,B).


form_links:- not((create_partition(S,B) , retractall(link_wid_self), retractall(link_wid_others),  not(assert_links(S,B)),fail)).

assert_links(S,B):- scan(X,B,Y) ,     link_with_self(S,Y,L) , not(link_wid_self(S,Y,L)) ,  asserta(link_wid_self(S,Y,L)) , fail.
/*               (#,partition,element)  (#of example ,element of partition,?)         (partition,# of Y,Linklist)                             */

assert_links(S,B):- scan(X,B,Y) , link_with_others(S,Y,L) , not(link_wid_others(S,Y,L)) , asserta(link_wid_others(S,Y,L)) , fail.


link_with_self(S,Y,L):- memory_predicates(J) , size_of(Len,J) , link_with_self1(S,Y,L,J,Len).

link_with_self1(S,Y,[],J,Len):- used(A,S) , scan(1,A,X) , =(X,Y). 

link_with_self1(S,Y,[A|L],J,Len):- not((used(A1,S) , scan(1,A1,X) , =(X,Y))) , fact(ex(S),place(1,1),size(M,M),first_index(N1,N2),second_index(P1,P2),lists(Y,Y1),relations(List)) , scan(C,List,D) , =(D,yes) , F is Len-C+1 , scan(F,J,A) , link_with_self1(S,Y1,L,J,Len).  


link_with_others(S,Y,L):- memory_predicates(J) , size_of(Len,J) , link_with_others1(S,Y,L,J,Len).

link_with_others1(S,Y,[X],J,Len):- used(A,S) , scan(X,A,Y1) , =(Y1,Y) ,  \=(X,1).

link_with_others1(S,Y,[A|L],J,Len):- fact(ex(S),place(Q1,Q2),size(M,M),first_index(N1,N2),second_index(P1,P2),lists(Y,Y1),relations(List)) , \=(Q2,1) , scan(C,List,D) , =(D,yes) , F is Len-C+1 , scan(F,J,A) , link_with_others1(S,Y1,L,J,Len).

condition(S,Y):- used(A,S) , scan(X,A,Y1) , =(Y,Y1) , \=(X,1).
