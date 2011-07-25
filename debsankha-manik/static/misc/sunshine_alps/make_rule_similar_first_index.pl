:-dynamic(similar/4).
:-dynamic(similar_used_step1/4).
:-dynamic(similar_used_step2/4).
:-dynamic(similar_used_step3/4).
:-dynamic(done1_similar/2).
:-dynamic(done2_similar/1).
:-dynamic(done3_similar/1).
:-dynamic(done4_similar/1).
:-dynamic(first_index_depends_first_size_similar/0).
:-dynamic(first_index_depends_second_size_similar/0).

















/* check whether first index depends only on C in size(C,D) */

not_first_index_depends_first_size_similar:- similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar(arguments(A,B),size(C,D1),first_index(E1,E1),second_index(F1,G1)) , \=(D,D1) , \=(E1,E).

/* check whether first index depends only on D in size(C,D) */

not_first_index_depends_second_size_similar:- similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar(arguments(A,B),size(C1,D),first_index(E1,E1),second_index(F1,G1)) , \=(C1,C), \=(E1,E).



/*finds the first index for similar statements of unknown size by lowest order polynomial interpolation*/

find_index_similar_first_index(A,B,N2,N1,J):-(not(not_first_index_depends_first_size_similar)->asserta(first_index_depends_first_size_similar) ; (not(not_first_index_depends_second_size_similar)->asserta(first_index_depends_second_size_similar) ; true)) , find_index_similar_first_index1(A,B,N2,N1,J) , retractall(done1_similar(X,Y)) ,!. 


find_index_similar_first_index1(A,B,N2,N1,J):- similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , (first_index_depends_first_size_similar->not(done1_similar(C,D1)) ; (first_index_depends_second_size_similar->not(done1_similar(C1,D)) ; not(done1_similar(C,D)))), asserta(done1_similar(C,D)) , retract(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , asserta(similar_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) ,  calculate_similar(A,B,C,D,N2,N1,Y) , calculate_similar(A,B,C,D,C,D,X) , S is E/X , S1 is S*Y , retract(similar_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , asserta(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))), find_index_similar_first_index1(A,B,N2,N1,J1) , J is J1+S1.

find_index_similar_first_index1(A,B,N2,N1,0):- !.

calculate_similar(A,B,C,D,N2,N1,Y):- (first_index_depends_first_size_similar -> 
(
calculate_first_index_first_size_similar(A,B,C,D,N2,N1,Y) , not(reassert_similar_used_step2), retractall(done2_similar(X))
) 
; 
(first_index_depends_second_size_similar -> 
(
calculate_first_index_second_size_similar(A,B,C,D,N2,N1,Y) , not(reassert_similar_used_step2), retractall(done2_similar(X))
) 
; 
(calculate_first_index_both_similar(A,B,C,D,N2,N1,Y) , not(reassert_similar_used_step2) , retractall(done3_similar(X)) , retractall(done4_similar(X))
)
)
) .

calculate_first_index_first_size_similar(A,B,C,D,N2,N1,Y):- similar(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H)) , retract(similar(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))) , asserta(similar_used_step2(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))) , \=(C,C1) , not(done2_similar(C1)) , asserta(done2_similar(C1)) , calculate_first_index_first_size_similar(A,B,C,D,N2,N1,X) , Y is X*(N2-C1).

calculate_first_index_first_size_similar(A,B,C,D,N2,N1,1):- not(similar(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))).


calculate_first_index_second_size_similar(A,B,C,D,N2,N1,Y):- similar(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H)) , retract(similar(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))) , asserta(similar_used_step2(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))) , \=(D,D1) , not(done2_similar(D1)) , asserta(done2_similar(D1)) , calculate_first_index_second_size_similar(A,B,C,D,N2,N1,X) , Y is X*(N1-D1).

calculate_first_index_second_size_similar(A,B,C,D,N2,N1,1):- not(similar(arguments(A1,B1),size(Cee,Dee),first_index(E,E),second_index(G,H))).

calculate_first_index_both_similar(A,B,C,D,N2,N1,Y):- similar(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H)) , retract(similar(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))) , asserta(similar_used_step2(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))) , (=(C,C1)-> (not(done4_similar(D1))->(asserta(done4_similar(D1)) , calculate_first_index_both_similar(A,B,C,D,N2,N1,X) , Y is X*(N1-D1)) ; calculate_first_index_both_similar(A,B,C,D,N2,N1,Y)) ; (=(D,D1)->(not(done3_similar(C1))->(asserta(done3_similar(C1)) , calculate_first_index_both_similar(A,B,C,D,N2,N1,X) , Y is X*(N2-C1)) ; calculate_first_index_both_similar(A,B,C,D,N2,N1,Y)) ; calculate_first_index_both_similar1(A,B,C1,D1,C,D,N2,N1,Y))).

calculate_first_index_both_similar1(A,B,C1,D1,C,D,N2,N1,Y):- (done3_similar(C1)->calculate_first_index_both_similar(A,B,C,D,N2,N1,Y) ; (done4_similar(D1)->calculate_first_index_both_similar(A,B,C,D,N2,N1,Y) ; (findall(C1,similar(arguments(A1,B1),size(C1,Dee),first_index(E,E),second_index(F,G)),M) , findall(D1,similar(arguments(A1,B1),size(Cee,D1),first_index(E,E),second_index(F,G)),M1) , size_of(Lc,M) , size_of(Ld,M1) , trimc_similar(C,D,C1,D1,Lcsub) , not(reassert_similar_used_step3) , trimd_similar(C,D,C1,D1,Ldsub) , not(reassert_similar_used_step3), Lcnew is Lc-Lcsub, Ldnew is Ld-Ldsub , calculate_first_index_both_similar2(A,B,C1,D1,C,D,N2,N1,Lcnew,Ldnew,Y)))).

calculate_first_index_both_similar2(A,B,C1,D1,C,D,N2,N1,Lcnew,Ldnew,Y):- Lcnew>Ldnew , asserta(done3_similar(C1)) ,  calculate_first_index_both_similar(A,B,C,D,N2,N1,X) , Y is X*(N2-C1).
calculate_first_index_both_similar2(A,B,C1,D1,C,D,N2,N1,Lcnew,Ldnew,Y):- Lcnew<Ldnew , asserta(done4_similar(D1)) , calculate_first_index_both_similar(A,B,C,D,N2,N1,X) , Y is X*(N1-D1).
/*calculate_first_index_both_similar2(A,B,C1,D1,C,D,N2,N1,Lc,Ld,Y):- =(Lc,0) ,=(Ld,0) , asserta(done4_similar(D1)) , calculate_first_index_both_similar(A,B,C,D,N2,N1,X) , Y is X*((N1-D1).*/

calculate_first_index_both_similar(A,B,C,D,N2,N1,1):- not(similar(arguments(A1,B1),size(Cee,Dee),first_index(E,E),second_index(G,H))).

reassert_similar_used_step2:-similar_used_step2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar_used_step2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , fail.


trimc_similar(C,D,C1,D1,Lcsub) :- similar(arguments(A,B),size(C1,Dee),first_index(E,E),second_index(F,G)) , retract(similar(arguments(A,B),size(C1,Dee),first_index(E,E),second_index(F,G))) , asserta(similar_used_step3(arguments(A,B),size(C1,Dee),first_index(E,E),second_index(F,G))) , (done4_similar(Dee)-> (trimc_similar(C,D,C1,D1,J) , Lcsub is J+1) ; (=(Dee,D)-> (trimc_similar(C,D,C1,D1,J) , Lcsub is J-1) ; (similar(arguments(A,B),size(C,Dee),first_index(E1,E1),second_index(F1,G1))-> (trimc_similar(C,D,C1,D1,J) , Lcsub is J+1) ; trimc_similar(C,D,C1,D1,Lcsub)))). 

trimc_similar(C,D,C1,D1,0) :- not(similar(arguments(A,B),size(C1,Dee),first_index(E,E),second_index(F,G))).

trimd_similar(C,D,C1,D1,Ldsub) :- similar(arguments(A,B),size(Cee,D1),first_index(E,E),second_index(F,G)) , retract(similar(arguments(A,B),size(Cee,D1),first_index(E,E),second_index(F,G))) , asserta(similar_used_step3(arguments(A,B),size(Cee,D1),first_index(E,E),second_index(F,G))) , (done3_similar(Cee)-> (trimd_similar(C,D,C1,D1,J) , Ldsub is J+1) ; (=(Cee,C)-> (trimd_similar(C,D,C1,D1,J) , Ldsub is J-1) ; (similar(arguments(A,B),size(Cee,D),first_index(E1,E1),second_index(F1,G1))-> (trimd_similar(C,D,C1,D1,J) , Ldsub is J+1) ; trimd_similar(C,D,C1,D1,Ldsub)))).

trimd_similar(C,D,C1,D1,0) :- not(similar(arguments(A,B),size(Cee,D1),first_index(E,E),second_index(F,G))).

reassert_similar_used_step3:-similar_used_step3(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar_used_step3(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , fail.


   


 
