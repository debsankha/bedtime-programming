:-dynamic(similar_var1/4).
:-dynamic(similar_var1_used_step1/4).
:-dynamic(similar_var1_used_step2/4).
:-dynamic(similar_var1_used_step3/4).
:-dynamic(done1_similar_var1/2).
:-dynamic(done2_similar_var1/1).
:-dynamic(done3_similar_var1/1).
:-dynamic(done4_similar_var1/1).
:-dynamic(first_index_depends_first_size_similar_var1/0).
:-dynamic(first_index_depends_second_size_similar_var1/0).

















/* check whether first index depends only on C in size(C,D) */

not_first_index_depends_first_size_similar_var1:- similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar_var1(arguments(A,B),size(C,D1),first_index(E1,E1),second_index(F1,G1)) , \=(D,D1) , \=(E1,E).

/* check whether first index depends only on D in size(C,D) */

not_first_index_depends_second_size_similar_var1:- similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar_var1(arguments(A,B),size(C1,D),first_index(E1,E1),second_index(F1,G1)) , \=(C1,C), \=(E1,E).



/*finds the first index for similar_var1 statements of unknown size by lowest order polynomial interpolation*/

find_index_similar_var1_first_index(A,B,N2,N1,J):-(not(not_first_index_depends_first_size_similar_var1)->asserta(first_index_depends_first_size_similar_var1) ; (not(not_first_index_depends_second_size_similar_var1)->asserta(first_index_depends_second_size_similar_var1) ; true)) , find_index_similar_var1_first_index1(A,B,N2,N1,J) , retractall(done1_similar_var1(X,Y)) ,!. 


find_index_similar_var1_first_index1(A,B,N2,N1,J):- similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , (first_index_depends_first_size_similar_var1->not(done1_similar_var1(C,D1)) ; (first_index_depends_second_size_similar_var1->not(done1_similar_var1(C1,D)) ; not(done1_similar_var1(C,D)))), asserta(done1_similar_var1(C,D)) , retract(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , asserta(similar_var1_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) ,  calculate_similar_var1(A,B,C,D,N2,N1,Y) , calculate_similar_var1(A,B,C,D,C,D,X) , S is E/X , S1 is S*Y , retract(similar_var1_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , asserta(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))), find_index_similar_var1_first_index1(A,B,N2,N1,J1) , J is J1+S1.

find_index_similar_var1_first_index1(A,B,N2,N1,0):- !.

calculate_similar_var1(A,B,C,D,N2,N1,Y):- (first_index_depends_first_size_similar_var1 -> 
(
calculate_first_index_first_size_similar_var1(A,B,C,D,N2,N1,Y) , not(reassert_similar_var1_used_step2), retractall(done2_similar_var1(X))
) 
; 
(first_index_depends_second_size_similar_var1 -> 
(
calculate_first_index_second_size_similar_var1(A,B,C,D,N2,N1,Y) , not(reassert_similar_var1_used_step2), retractall(done2_similar_var1(X))
) 
; 
(calculate_first_index_both_similar_var1(A,B,C,D,N2,N1,Y) , not(reassert_similar_var1_used_step2) , retractall(done3_similar_var1(X)) , retractall(done4_similar_var1(X))
)
)
) .

calculate_first_index_first_size_similar_var1(A,B,C,D,N2,N1,Y):- similar_var1(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H)) , retract(similar_var1(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))) , asserta(similar_var1_used_step2(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))) , \=(C,C1) , not(done2_similar_var1(C1)) , asserta(done2_similar_var1(C1)) , calculate_first_index_first_size_similar_var1(A,B,C,D,N2,N1,X) , Y is X*(N2-C1).

calculate_first_index_first_size_similar_var1(A,B,C,D,N2,N1,1):- not(similar_var1(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))).


calculate_first_index_second_size_similar_var1(A,B,C,D,N2,N1,Y):- similar_var1(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H)) , retract(similar_var1(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))) , asserta(similar_var1_used_step2(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))) , \=(D,D1) , not(done2_similar_var1(D1)) , asserta(done2_similar_var1(D1)) , calculate_first_index_second_size_similar_var1(A,B,C,D,N2,N1,X) , Y is X*(N1-D1).

calculate_first_index_second_size_similar_var1(A,B,C,D,N2,N1,1):- not(similar_var1(arguments(A1,B1),size(Cee,Dee),first_index(E,E),second_index(G,H))).

calculate_first_index_both_similar_var1(A,B,C,D,N2,N1,Y):- similar_var1(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H)) , retract(similar_var1(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))) , asserta(similar_var1_used_step2(arguments(A,B),size(C1,D1),first_index(E,E),second_index(G,H))) , (=(C,C1)-> (not(done4_similar_var1(D1))->(asserta(done4_similar_var1(D1)) , calculate_first_index_both_similar_var1(A,B,C,D,N2,N1,X) , Y is X*(N1-D1)) ; calculate_first_index_both_similar_var1(A,B,C,D,N2,N1,Y)) ; (=(D,D1)->(not(done3_similar_var1(C1))->(asserta(done3_similar_var1(C1)) , calculate_first_index_both_similar_var1(A,B,C,D,N2,N1,X) , Y is X*(N2-C1)) ; calculate_first_index_both_similar_var1(A,B,C,D,N2,N1,Y)) ; calculate_first_index_both_similar_var11(A,B,C1,D1,C,D,N2,N1,Y))).

calculate_first_index_both_similar_var11(A,B,C1,D1,C,D,N2,N1,Y):- (done3_similar_var1(C1)->calculate_first_index_both_similar_var1(A,B,C,D,N2,N1,Y) ; (done4_similar_var1(D1)->calculate_first_index_both_similar_var1(A,B,C,D,N2,N1,Y) ; (findall(C1,similar_var1(arguments(A1,B1),size(C1,Dee),first_index(E,E),second_index(F,G)),M) , findall(D1,similar_var1(arguments(A1,B1),size(Cee,D1),first_index(E,E),second_index(F,G)),M1) , size_of(Lc,M) , size_of(Ld,M1) , trimc_similar_var1(C,D,C1,D1,Lcsub) , not(reassert_similar_var1_used_step3) , trimd_similar_var1(C,D,C1,D1,Ldsub) , not(reassert_similar_var1_used_step3), Lcnew is Lc-Lcsub, Ldnew is Ld-Ldsub , calculate_first_index_both_similar_var12(A,B,C1,D1,C,D,N2,N1,Lcnew,Ldnew,Y)))).

calculate_first_index_both_similar_var12(A,B,C1,D1,C,D,N2,N1,Lcnew,Ldnew,Y):- Lcnew>Ldnew , asserta(done3_similar_var1(C1)) ,  calculate_first_index_both_similar_var1(A,B,C,D,N2,N1,X) , Y is X*(N2-C1).
calculate_first_index_both_similar_var12(A,B,C1,D1,C,D,N2,N1,Lcnew,Ldnew,Y):- Lcnew<Ldnew , asserta(done4_similar_var1(D1)) , calculate_first_index_both_similar_var1(A,B,C,D,N2,N1,X) , Y is X*(N1-D1).
/*calculate_first_index_both_similar_var12(A,B,C1,D1,C,D,N2,N1,Lc,Ld,Y):- =(Lc,0) ,=(Ld,0) , asserta(done4_similar_var1(D1)) , calculate_first_index_both_similar_var1(A,B,C,D,N2,N1,X) , Y is X*((N1-D1).*/

calculate_first_index_both_similar_var1(A,B,C,D,N2,N1,1):- not(similar_var1(arguments(A1,B1),size(Cee,Dee),first_index(E,E),second_index(G,H))).

reassert_similar_var1_used_step2:-similar_var1_used_step2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar_var1_used_step2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , fail.


trimc_similar_var1(C,D,C1,D1,Lcsub) :- similar_var1(arguments(A,B),size(C1,Dee),first_index(E,E),second_index(F,G)) , retract(similar_var1(arguments(A,B),size(C1,Dee),first_index(E,E),second_index(F,G))) , asserta(similar_var1_used_step3(arguments(A,B),size(C1,Dee),first_index(E,E),second_index(F,G))) , (done4_similar_var1(Dee)-> (trimc_similar_var1(C,D,C1,D1,J) , Lcsub is J+1) ; (=(Dee,D)-> (trimc_similar_var1(C,D,C1,D1,J) , Lcsub is J-1) ; (similar_var1(arguments(A,B),size(C,Dee),first_index(E1,E1),second_index(F1,G1))-> (trimc_similar_var1(C,D,C1,D1,J) , Lcsub is J+1) ; trimc_similar_var1(C,D,C1,D1,Lcsub)))). 

trimc_similar_var1(C,D,C1,D1,0) :- not(similar_var1(arguments(A,B),size(C1,Dee),first_index(E,E),second_index(F,G))).

trimd_similar_var1(C,D,C1,D1,Ldsub) :- similar_var1(arguments(A,B),size(Cee,D1),first_index(E,E),second_index(F,G)) , retract(similar_var1(arguments(A,B),size(Cee,D1),first_index(E,E),second_index(F,G))) , asserta(similar_var1_used_step3(arguments(A,B),size(Cee,D1),first_index(E,E),second_index(F,G))) , (done3_similar_var1(Cee)-> (trimd_similar_var1(C,D,C1,D1,J) , Ldsub is J+1) ; (=(Cee,C)-> (trimd_similar_var1(C,D,C1,D1,J) , Ldsub is J-1) ; (similar_var1(arguments(A,B),size(Cee,D),first_index(E1,E1),second_index(F1,G1))-> (trimd_similar_var1(C,D,C1,D1,J) , Ldsub is J+1) ; trimd_similar_var1(C,D,C1,D1,Ldsub)))).

trimd_similar_var1(C,D,C1,D1,0) :- not(similar_var1(arguments(A,B),size(Cee,D1),first_index(E,E),second_index(F,G))).

reassert_similar_var1_used_step3:-similar_var1_used_step3(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar_var1_used_step3(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , fail.


   


 
