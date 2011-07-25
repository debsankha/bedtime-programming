:-dynamic(superset/5).
:-dynamic(similar/4).
:-dynamic(used/1).
:-dynamic(similar_var1/4).
:-dynamic(similar_var2/4).
:-dynamic(no_similar/0).
:-dynamic(similarity_asserted/0).
:-dynamic(similar_intermediate1/4).
:-dynamic(similar_intermediate2/4).



/* main functions */

start:- consult(examples) , consult(primitive) , consult(permute_fixed) , asserta(no_similar) , not(initiate_find_similarity) , trim_similar , trim_similar_intermediate , not(trim_similar_var1).


initiate_find_similarity:- true(A) , write(A) , size_of(X,A) , makelist(A,X,1,B) , not(generate(B)), similarity(X,B),  modification , retractall(true(A)) , asserta(used(B)) , retractall(superset(K,L,M,N,O)) ,fail.

/*main functions */


/* accessories to main functions 


1. similarity(X,B) : checks whether any true statements with elements of similar size as B was processed before. If not then it calls similarity_assert. which notes down the similarity between the elements of B */

similarity(X,B):- (check_whether_similarity_asserted(X,B)->true ;not(similarity_assert)).


/*similarity */

modification:-(no_similar->retract(no_similar) ; modify). 


modify:- not(modify_similar) , not(modify_similar_intermediate1) , not(modify_similar_intermediate2) , not(modify_similar_var1) , not(modify_similar_var2).

/* accessories to main functions */


/* makelist : converting all input arguments into lists */

makelist(A,X,M,[[B]|C]):- Y is X+1 ,\=(M,Y) ,find(M,A,B) , not(check_whether_list(B)) ,M1 is M+1 , makelist(A,X,M1,C).
makelist(A,X,M,[B|C]):- Y is X+1 ,\=(M,Y) ,find(M,A,B) , check_whether_list(B) ,M1 is M+1 , makelist(A,X,M1,C).
makelist(A,X,Y,[]):-Y is X+1 ,!.

check_whether_list(B):- =(B,[X|Y]).

/* makelist */


/* generate(B) : B=list of lists , when called asserts all possible supersets of the lists in B as superset(I,J,K,L,M). I=list number in B , J=size of the list I , K= size of the element of the superset , L = a number denoting when it was generated in the prescribed sequence of generation , M=the element of the superset itself */ 

generate(B):- generate_superset(B) , fail. 

generate_superset(B):- scan(A,B,C) , superset_assert(A,C).


superset_assert(A,C) :-scan(X,C,Y) , permute_fixed(C,X,E) ,  size_of(D,C) , findall(X ,superset(A,V,X,W,Z),L) , size_of(R,L)  ,S is R+1 , asserta(superset(A,D,X,S,E)) .


/* generate */


/*check_whether_similarity_asserted:-call(superset(A,B,1,1,E)) , call(superset(K,L,1,1,O)), \=(A,K) ,(similar(arguments(A,K),size(B,L),first_index(I,J),second_index(X,Y)) ; similar(arguments(K,A),size(L,B),first_index(T,U),second_index(V,W))),!.*/


check_whether_similarity_asserted(X,A):-used(B) , size_of(L1,B) , =(X,L1) , Y is X+1 , same_true(A,B,Y,1).


same_true(A,B,X,D):-  \=(D,X) ,! ,find(D,A,Y) , find(D,B,Z) , size_of(L1,Y) , size_of(L2,Z) , =(L1,L2) , D1 is D+1 , same_true(A,B,X,D1).

same_true(A,B,X,X).

/* check_whether_similarity_asserted */



/* similarity assert : takes all pairs of superset(I,J,K,L,M) and checks matches in M for different values of I,J,L and asserts the similarity in the form
similar(arguments(I1,I2),size(J1,J2),first_index(K,K),second_index(L1,L2)) ; which means superset(I1,J1,K,L1,M1) and superset(I2,J2,K,L2,M2) exists in the database and M1=M2 */

similarity_assert:-call(superset(2,B,C,D,E)) , call(superset(1,L,M,N,O)), =(E,O) , asserta(similar(arguments(2,1),size(B,L),first_index(C,M),second_index(D,N))), fail.

/*similarity assert */


/* modify : scans the database for previous information on similarity between lists of the same size as being processed now. checks whether the previous definitions for similarity are consistent with the list true statement being processed now, and makes appropriate corrections to the definitions of similairty */


modify_similar:- similar(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H)) , superset(A,C,E,G,X) , superset(B,D,F,H,Y) , (\=(X,Y)-> retract(similar(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H))) , (not(check_exists_intermediate_1(A,B,C,D,E,F,G,N))-> asserta(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,F),second_index(G,N))) ; true), (not(check_exists_intermediate_2(A,B,C,D,E,F,M,H))->asserta(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,F),second_index(M,H))) ; true) ; true) , fail.


modify_similar_intermediate1:- similar_intermediate1(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H)) , (not(check_validity(A,B,C,D,E,F,G,H))-> retract(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H))) , not(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,F),second_index(I,J))) , not(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,F),second_index(I1,J1))) , not(check_exists_var1(A,B,C,D,E,F,M,N)) , asserta(similar_var1(arguments(A,B),size(C,D),first_index(E,F),second_index(M1,N1))) ; true) , fail.


modify_similar_intermediate2:-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H)) , (not(check_validity(A,B,C,D,E,F,G,H))->retract(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H))) , not(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,F),second_index(I,J))) , not(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,F),second_index(I1,J1))) , not(check_exists_var1(A,B,C,D,E,F,M,N)) , asserta(similar_var1(arguments(A,B),size(C,D),first_index(E,F),second_index(M1,N1))) ; true) , fail.

modify_similar_var1:- similar_var1(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H)), (not(check_validity(A,B,C,D,E,F,G,H))->retract(similar_var1(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H))) , not(check_exists_var2(A,B,C,D,W,X,Y,Z)) , not(similar(arguments(A,B),size(C,D),first_index(K,K),second_index(I,J))) ,  not(similar_intermediate1(arguments(A,B),size(C,D),first_index(K1,K1),second_index(I1,J1))) , not(similar_intermediate2(arguments(A,B),size(C,D),first_index(K2,K2),second_index(I2,J2))) , not(similar_var1(arguments(A,B),size(C,D),first_index(L,L),second_index(M,N))) , asserta(similar_var2(arguments(A,B),size(C,D),first_index(W,X),second_index(Y,Z))) ; true) , fail.


check_validity(A,B,C,D,E,F,G,H):-(not(superset(A,C,X,Y,Z)) ;  not(superset(B,D,K,L,M))) , true.
check_validity(A,B,C,D,E,F,G,H):-superset(A,C,E,G,X) , superset(B,D,F,H,X).

modify_similar_var2:- similar_var2(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H)), (not(check_validity(A,B,C,D,E,F,G,H))->retract(similar_var2(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H))) ; true) , fail.


check_exists_intermediate_1(A,B,C,D,E,F,G,N):-similar_intermediate1(arguments(A,B),size(C,D),first_index(E,F),second_index(G,N)) , var(N).

check_exists_intermediate_2(A,B,C,D,E,F,M,H):-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,F),second_index(M,H)) , var(M).

check_exists_var1(A,B,C,D,E,F,M,N):-similar_var1(arguments(A,B),size(C,D),first_index(E,F),second_index(M,N)) , var(M) , var(N).

check_exists_var2(A,B,C,D,W,X,Y,Z):-similar_var2(arguments(A,B),size(C,D),first_index(W,X),second_index(Y,Z)) , var(W) ,var(X) ,var(Y) ,var(Z).


/* modify */



/* trim : takes the final database for definitions of similarity and then deletes, for a particular size index,  everything except the highest order first index and for that index, the lowest order second index. Obviously, all the deleted informatiion is in this one similarity statement. */  


trim_similar:-not(trim_similar1) , not(trim_similar2).


trim_similar1:-similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar(arguments(A,B),size(C,D),first_index(F,F),second_index(K,L)) ,\=(E,F) , (E>F->retract(similar(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H))) ; retract(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)))) , fail.  


trim_similar2:-similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar(arguments(A,B),size(C,D),first_index(E,E),second_index(K,L)) , \=(G,K) , (G>K->retract(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) ; retract(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(K,L)))) , fail.


trim_similar_intermediate:-not(trim_similar_intermediate1_first_index) , not(trim_similar_intermediate1_second_index) , not(trim_similar_intermediate2_first_index) , not(trim_similar_intermediate2_second_index).

trim_similar_intermediate1_first_index:-similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar_intermediate1(arguments(A,B),size(C,D),first_index(F,F),second_index(K,L)) ,\=(E,F) , (E>F->retract(similar_intermediate1(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H))) ; retract(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)))) , fail.

trim_similar_intermediate1_second_index:-similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(K,L)) , \=(G,K) , (G>K->retract(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) ; retract(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(K,L)))) , fail.


trim_similar_intermediate2_first_index:-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar_intermediate2(arguments(A,B),size(C,D),first_index(F,F),second_index(K,L)) ,\=(E,F) , (E>F->retract(similar_intermediate2(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H))) ; retract(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)))) , fail.

trim_similar_intermediate2_second_index:-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(K,L)) , \=(H,L) , (H>L->retract(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) ; retract(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(K,L)))) , fail.


trim_similar_var1:-similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar_var1(arguments(A,B),size(C,D),first_index(F,F),second_index(K,L)) , \=(E,F) , (E>F->retract(similar_var1(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H))) ; retract(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)))) , fail. 
