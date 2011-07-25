:-dynamic(match/0).
:-dynamic(similar_used_step1/4).
:-dynamic(similar_used_step2/4).
:-dynamic(similar_var1_used_step1/4).
:-dynamic(similar_var1_used_step2/4).
:-dynamic(similar_done/4).
:-dynamic(first_entry_same_similar/1).
:-dynamic(second_entry_same_similar/1).
:-dynamic(sizes_same_similar/0).
:-dynamic(first_entry_same_similar_var1/1).
:-dynamic(second_entry_same_similar_var1/1).
:-dynamic(similar_var1_done/4).
:-dynamic(sizes_same_similar_var1/0).
:-dynamic(first_entry_same_similar_var2/1).
:-dynamic(second_entry_same_similar_var2/1).
:-dynamic(similar_var2_done/4).
:-dynamic(sizes_same_similar_var2/0).
:-dynamic(similar_intermediate1_used_step1/4).
:-dynamic(similar_intermediate1_used_step2/4).
:-dynamic(similar_intermediate2_used_step1/4).
:-dynamic(similar_intermediate2_used_step2/4).
:-dynamic(first_entry_same_similar_intermediate1/1).
:-dynamic(second_entry_same_similar_intermediate1/1).
:-dynamic(sizes_same_similar_intermediate1/0).
:-dynamic(first_entry_same_similar_intermediate2/1).
:-dynamic(second_entry_same_similar_intermediate2/1).
:-dynamic(sizes_same_similar_intermediate2/0).
:-dynamic(similar_intermediate1_done/4).
:-dynamic(similar_intermediate2_done/4).
:-dynamic(subset_similar/0).
:-dynamic(subset_similar_intermediate1/0).
:-dynamic(subset_similar_intermediate2/0).
:-dynamic(subset_similar_var1/0).
:-dynamic(subset_similar_var2/0).



find_index_similar_first_index(A,B,N1,N2,J):-step(A,B,N1,N2,F) , J is F, retractall(similar_used_step1(K,L,M,N)) , !. 

step(A,B,N1,N2,F):-similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , (not(similar_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)))-> asserta(similar_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))), retract(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , calculate(A,B,N1,N2,X) , not(reassert) , (match->calculate(A,B,C,D,Y) , not(reassert) , S is E/Y , X1 is S*X , =(F,R+X1) , asserta(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , retractall(match) ,step(A,B,N1,N2,R); asserta(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , step(A,B,N1,N2,F));fail).

step(A,B,N1,N2,0):- not((similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)), not(similar_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))))) , !.


calculate(A,B,N1,N2,Y):-similar(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H)) , retract(similar(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H))) , asserta(similar_used_step2(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H))) , change_with_cond_similar(N1,N2,C,D,Y,X) , calculate(A,B,N1,N2,X).

calculate(A,B,N1,N2,1):-not(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))). 



reassert:-similar_used_step2(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H)) , retract(similar_used_step2(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , asserta(similar(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , fail.



find_index_similar_second_index_first(A,B,N1,N2,J):-step2(A,B,N1,N2,F) , J is F, retractall(similar_used_step1(K,L,M,N)) , !.
 


step2(A,B,N1,N2,F):-similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , (not(similar_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)))-> asserta(similar_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))), retract(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , calculate(A,B,N1,N2,X) , not(reassert) , (match->calculate(A,B,C,D,Y) , not(reassert) , S is G/Y , X1 is S*X , =(F,R+X1) , asserta(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , retractall(match) ,step2(A,B,N1,N2,R); asserta(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , step2(A,B,N1,N2,F));fail).



step2(A,B,N1,N2,0):- not((similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)), not(similar_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))))) , !.


find_index_similar_second_index_second(A,B,N1,N2,J):-step3(A,B,N1,N2,F) , J is F, retractall(similar_used_step1(K,L,M,N)) , !.


step3(A,B,N1,N2,F):-similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , (not(similar_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)))-> asserta(similar_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))), retract(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , calculate(A,B,N1,N2,X) , not(reassert) , (match->calculate(A,B,C,D,Y) , not(reassert) , S is H/Y , X1 is S*X , =(F,R+X1) , asserta(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , retractall(match) ,step3(A,B,N1,N2,R); asserta(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , step3(A,B,N1,N2,F));fail).



step3(A,B,N1,N2,0):- not((similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)), not(similar_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))))) , !.



find_index_similar_var1_first_index(A,B,N1,N2,J):-step_var1(A,B,N1,N2,F) , J is F, retractall(similar_var1_used_step1(K,L,M,N)) , !. 

step_var1(A,B,N1,N2,F):-similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , (not(similar_var1_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)))-> asserta(similar_var1_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))), retract(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , calculate_var1(A,B,N1,N2,X) , not(reassert_var1) , (match->calculate_var1(A,B,C,D,Y) , not(reassert_var1) , S is E/Y , X1 is S*X , =(F,R+X1) , asserta(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , retractall(match) ,step_var1(A,B,N1,N2,R); asserta(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , step_var1(A,B,N1,N2,F));fail).

step_var1(A,B,N1,N2,0):- not((similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)), not(similar_var1_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))))) , !.


calculate_var1(A,B,N1,N2,Y):-similar_var1(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H)) , retract(similar_var1(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H))) , asserta(similar_var1_used_step2(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H))) , change_with_cond_similar_var1(N1,N2,C,D,Y,X) , calculate_var1(A,B,N1,N2,X).

calculate_var1(A,B,N1,N2,1):-not(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))). 


reassert_var1:-similar_var1_used_step2(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H)) , retract(similar_var1_used_step2(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , asserta(similar_var1(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , fail.


size_rules_similar:-(first_rule_similar->true ; retractall(first_entry_same_similar(X))), not(reassert_similar_done) , (second_rule_similar->true ; retractall(second_entry_same_similar(X))) , not(reassert_similar_done) , (third_rule_similar-> true ; true) , (not(check_subset_relationship_similar)->asserta(subset_similar) ; true).

first_rule_similar:- not(size_rule_first_entry_similar).

size_rule_first_entry_similar:-similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar_done(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , similar(arguments(A,B),size(K,L),first_index(F,F),second_index(M,N)) , (not(first_entry_same_similar(C))->asserta(first_entry_same_similar(C)) ; true) , \=(C,K).

reassert_similar_done:-similar_done(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H)) , retract(similar_done(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , asserta(similar(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , fail.



second_rule_similar:-not(size_rule_second_entry_similar).



size_rule_second_entry_similar:-similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar_done(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , similar(arguments(A,B),size(K,L),first_index(F,F),second_index(M,N)) , (not(first_entry_same_similar(D))->asserta(second_entry_same_similar(D)) ; true) , \=(D,L).



third_rule_similar:-not(size_same_similar) , asserta(sizes_same_similar).



size_same_similar:-similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , \=(C,D).

size_same_similar:-not(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))).


size_rules_similar_var1:-(first_rule_similar_var1->true ; retractall(first_entry_same_similar_var1(X))), not(reassert_similar_var1_done) , (second_rule_similar_var1->true ; retractall(second_entry_same_similar_var1(X))) , not(reassert_similar_var1_done) , (third_rule_similar_var1-> true ; true), (not(check_subset_relationship_similar_var1)->asserta(subset_similar_var1) ; true).

first_rule_similar_var1:- not(size_rule_first_entry_similar_var1).

size_rule_first_entry_similar_var1:-similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar_var1_done(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , similar_var1(arguments(A,B),size(K,L),first_index(F,F),second_index(M,N)) , (not(first_entry_same_similar_var1(C))->asserta(first_entry_same_similar_var1(C)) ; true) , \=(C,K).

reassert_similar_var1_done:-similar_var1_done(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H)) , retract(similar_var1_done(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , asserta(similar_var1(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , fail.



second_rule_similar_var1:-not(size_rule_second_entry_similar_var1).



size_rule_second_entry_similar_var1:-similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar_var1_done(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , similar_var1(arguments(A,B),size(K,L),first_index(F,F),second_index(M,N)) , (not(first_entry_same_similar_var1(D))->asserta(second_entry_same_similar_var1(D)) ; true) , \=(D,L).



third_rule_similar_var1:-not(size_same_similar_var1) , asserta(sizes_same_similar_var1).



size_same_similar_var1:-similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , \=(C,D).

size_same_similar_var1:-not(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))).


size_rules_similar_var2:-(first_rule_similar_var2->true ; retractall(first_entry_same_similar_var2(X))), not(reassert_similar_var2_done) , (second_rule_similar_var2->true ; retractall(second_entry_same_similar_var2(X))) , not(reassert_similar_var2_done) , (third_rule_similar_var2-> true ; true) , (not(check_subset_relationship_similar_var2)->asserta(subset_similar_var2) ; true).

first_rule_similar_var2:- not(size_rule_first_entry_similar_var2).

size_rule_first_entry_similar_var2:-similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar_var2_done(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , similar_var2(arguments(A,B),size(K,L),first_index(F,F),second_index(M,N)) , (not(first_entry_same_similar_var2(C))->asserta(first_entry_same_similar_var2(C)) ; true) , \=(C,K).

reassert_similar_var2_done:-similar_var2_done(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H)) , retract(similar_var2_done(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , asserta(similar_var2(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , fail.



second_rule_similar_var2:-not(size_rule_second_entry_similar_var2).



size_rule_second_entry_similar_var2:-similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar_var2_done(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , similar_var2(arguments(A,B),size(K,L),first_index(F,F),second_index(M,N)) , (not(first_entry_same_similar_var2(D))->asserta(second__entry_same_similar_var2(D)) ; true) , \=(D,L).



third_rule_similar_var2:-not(size_same_similar_var2) , asserta(sizes_same_similar_var2).



size_same_similar_var2:-similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , \=(C,D).

size_same_similar_var2:-not(similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))).


find_index_similar_intermediate1_first_index(A,B,N1,N2,J):- step_similar_intermediate1(A,B,N1,N2,F) , J is F, retractall(similar_intermediate1_used_step1(K,L,M,N)) , !. 

step_similar_intermediate1(A,B,N1,N2,F):-similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , (not(similar_intermediate1_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)))-> asserta(similar_intermediate1_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))), retract(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , calculate_similar_intermediate1(A,B,N1,N2,X) , not(reassert_similar_intermediate1) , (match->calculate_similar_intermediate1(A,B,C,D,Y) , not(reassert_similar_intermediate1) , S is E/Y , X1 is S*X , =(F,R+X1) , asserta(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , retractall(match) ,step_similar_intermediate1(A,B,N1,N2,R); asserta(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , step_similar_intermediate1(A,B,N1,N2,F));fail).

step_similar_intermediate1(A,B,N1,N2,0):- not((similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)), not(similar_intermediate1_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))))) , !.


calculate_similar_intermediate1(A,B,N1,N2,Y):-similar_intermediate1(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H)) , retract(similar_intermediate1(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H))) , asserta(similar_intermediate1_used_step2(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H))) , change_with_cond_similar_intermediate1(N1,N2,C,D,Y,X) , calculate_intermediate1(A,B,N1,N2,X).

calculate_intermediate1(A,B,N1,N2,1):-not(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))). 



reassert_similar_intermediate1:-similar_intermediate1_used_step2(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H)) , retract(similar_intermediate1_used_step2(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , asserta(similar_intermediate1(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , fail.


find_index_similar_intermediate2_first_index(A,B,N1,N2,J):- step_similar_intermediate2(A,B,N1,N2,F) , J is F, retractall(similar_intermediate2_used_step1(K,L,M,N)) , !. 

step_similar_intermediate2(A,B,N1,N2,F):-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , (not(similar_intermediate2_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)))-> asserta(similar_intermediate2_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))), retract(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , calculate_similar_intermediate2(A,B,N1,N2,X) , not(reassert_similar_intermediate2) , (match->calculate_similar_intermediate2(A,B,C,D,Y) , not(reassert_similar_intermediate2) , S is E/Y , X1 is S*X , =(F,R+X1) , asserta(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , retractall(match) ,step_similar_intermediate2(A,B,N1,N2,R); asserta(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , step_similar_intermediate2(A,B,N1,N2,F));fail).

step_similar_intermediate2(A,B,N1,N2,0):- not((similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)), not(similar_intermediate2_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))))) , !.


calculate_similar_intermediate2(A,B,N1,N2,Y):-similar_intermediate2(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H)) , retract(similar_intermediate2(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H))) , asserta(similar_intermediate2_used_step2(arguments(A,B),size(C,D),first_index(F,F),second_index(G,H))) , change_with_cond_similar_intermediate2(N1,N2,C,D,Y,X) , calculate_intermediate2(A,B,N1,N2,X).

calculate_intermediate2(A,B,N1,N2,1):-not(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))). 



reassert_similar_intermediate2:-similar_intermediate2_used_step2(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H)) , retract(similar_intermediate2_used_step2(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , asserta(similar_intermediate2(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , fail.



find_index_similar_intermediate1_second_index_first(A,B,N1,N2,J):-step_intermediate1_2(A,B,N1,N2,F) , J is F, retractall(similar_intermediate1_used_step1(K,L,M,N)) , !.
 


step_intermediate1_2(A,B,N1,N2,F):-similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , (not(similar_intermediate1_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)))-> asserta(similar_intermediate1_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))), retract(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , calculate_similar_intermediate1(A,B,N1,N2,X) , not(reassert_similar_intermediate1) , (match->calculate_similar_intermediate1(A,B,C,D,Y) , not(reassert_similar_intermediate1) , S is G/Y , X1 is S*X , =(F,R+X1) , asserta(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , retractall(match) ,step_intermediate1_2(A,B,N1,N2,R); asserta(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , step_intermediate1_2(A,B,N1,N2,F));fail).



step_intermediate1_2(A,B,N1,N2,0):- not((similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)), not(similar_intermediate1_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))))) , !.


find_index_similar_intermediate2_second_index_second(A,B,N1,N2,J):-step_intermediate2_2(A,B,N1,N2,F) , J is F, retractall(similar_intermediate2_used_step1(K,L,M,N)) , !.
 


step_intermediate2_2(A,B,N1,N2,F):-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , (not(similar_intermediate2_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)))-> asserta(similar_intermediate2_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))), retract(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , calculate_similar_intermediate2(A,B,N1,N2,X) , not(reassert_similar_intermediate2) , (match->calculate_similar_intermediate2(A,B,C,D,Y) , not(reassert_similar_intermediate2) , S is H/Y , X1 is S*X , =(F,R+X1) , asserta(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , retractall(match) ,step_intermediate2_2(A,B,N1,N2,R); asserta(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , step_intermediate2_2(A,B,N1,N2,F));fail).



step_intermediate2_2(A,B,N1,N2,0):- not((similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)), not(similar_intermediate2_used_step1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))))) , !.




size_rules_similar_intermediate1:-(first_rule_similar_intermediate1->true ; retractall(first_entry_same_similar_intermediate1(X))), not(reassert_similar_intermediate1_done) , (second_rule_similar_intermediate1->true ; retractall(second_entry_same_similar_intermediate1(X))) , not(reassert_similar_intermediate1_done) , (third_rule_similar_intermediate1-> true ; true) , (not(check_subset_relationship_similar_intermediate1)->asserta(subset_similar_intermediate1) ; true).

first_rule_similar_intermediate1:- not(size_rule_first_entry_similar_intermediate1).

size_rule_first_entry_similar_intermediate1:-similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar_intermediate1_done(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , similar_intermediate1(arguments(A,B),size(K,L),first_index(F,F),second_index(M,N)) , (not(first_entry_same_similar_intermediate1(C))->asserta(first_entry_same_similar_intermediate1(C)) ; true) , \=(C,K).

reassert_similar_intermediate1_done:-similar_intermediate1_done(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H)) , retract(similar_intermediate1_done(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , asserta(similar_intermediate1(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , fail.



second_rule_similar_intermediate1:-not(size_rule_second_entry_similar_intermediate1).



size_rule_second_entry_similar_intermediate1:-similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar_intermediate1_done(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , similar_intermediate1(arguments(A,B),size(K,L),first_index(F,F),second_index(M,N)) , (not(first_entry_same_similar_intermediate1(D))->asserta(second_entry_same_similar_intermediate1(D)) ; true) , \=(D,L).



third_rule_similar_intermediate1:-not(size_same_similar_intermediate1) , asserta(sizes_same_similar_intermediate1).



size_same_similar_intermediate1:-similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , \=(C,D).

size_same_similar_intermediate1:-not(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))).


size_rules_similar_intermediate2:-(first_rule_similar_intermediate2->true ; retractall(first_entry_same_similar_intermediate2(X))), not(reassert_similar_intermediate2_done) , (second_rule_similar_intermediate2->true ; retractall(second_entry_same_similar_intermediate2(X))) , not(reassert_similar_intermediate2_done) , (third_rule_similar_intermediate2-> true ; true) , (not(check_subset_relationship_similar_intermediate2)->asserta(subset_similar_intermediate2) ; true).

first_rule_similar_intermediate2:- not(size_rule_first_entry_similar_intermediate2).

size_rule_first_entry_similar_intermediate2:-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar_intermediate2_done(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , similar_intermediate2(arguments(A,B),size(K,L),first_index(F,F),second_index(M,N)) , (not(first_entry_same_similar_intermediate2(C))->asserta(first_entry_same_similar_intermediate2(C)) ; true) , \=(C,K).

reassert_similar_intermediate2_done:-similar_intermediate2_done(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H)) , retract(similar_intermediate2_done(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , asserta(similar_intermediate2(arguments(A,B),size(N1,N2),first_index(F,F),second_index(G,H))) , fail.



second_rule_similar_intermediate2:-not(size_rule_second_entry_similar_intermediate2).



size_rule_second_entry_similar_intermediate2:-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , retract(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , asserta(similar_intermediate2_done(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))) , similar_intermediate2(arguments(A,B),size(K,L),first_index(F,F),second_index(M,N)) , (not(first_entry_same_similar_intermediate2(D))->asserta(second_entry_same_similar_intermediate2(D)) ; true) , \=(D,L).



third_rule_similar_intermediate2:-not(size_same_similar_intermediate2) , asserta(sizes_same_similar_intermediate2).



size_same_similar_intermediate2:-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , \=(C,D).

size_same_similar_intermediate2:-not(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))).


check_subset_relationship_similar:- similar(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H)) , (not(greater_similar(A,B,C,D,E,F,G,H))-> generate_integer(I,D,1) , (similar(arguments(A,B),size(C,I),first_index(E1,F1),second_index(G1,H1))-> fail ; true) ; true).   

greater_similar(A,B,C,D,E,F,G,H) :- similar(arguments(A,B),size(C,D1),first_index(E1,F1),second_index(G1,H1)) , C<D1.

check_subset_relationship_similar_intermediate1:- similar_intermediate1(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H)) , (not(greater_similar_intermediate1(A,B,C,D,E,F,G,H))-> generate_integer(I,D,1) , \=(I,C), (similar_intermediate1(arguments(A,B),size(C,I),first_index(E1,F1),second_index(G1,H1))-> fail ; true) ; true).   

greater_similar_intermediate1(A,B,C,D,E,F,G,H) :- similar_intermediate1(arguments(A,B),size(C,D1),first_index(E1,F1),second_index(G1,H1)) , C<D1.



check_subset_relationship_similar_intermediate2:- similar_intermediate2(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H)) , (not(greater_similar_intermediate2(A,B,C,D,E,F,G,H))-> generate_integer(I,D,1) , \=(I,C),  (similar_intermediate2(arguments(A,B),size(C,I),first_index(E1,F1),second_index(G1,H1))-> fail ; true) ; true).   

greater_similar_intermediate2(A,B,C,D,E,F,G,H) :- similar_intermediate2(arguments(A,B),size(C,D1),first_index(E1,F1),second_index(G1,H1)) , C<D1 .


check_subset_relationship_similar_var1:- similar_var1(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H)) , (not(greater_similar_var1(A,B,C,D,E,F,G,H))-> generate_integer(I,D,1) , (similar_var1(arguments(A,B),size(C,I),first_index(E1,F1),second_index(G1,H1))-> fail ; true) ; true).   

greater_similar_var1(A,B,C,D,E,F,G,H) :- similar_var1(arguments(A,B),size(C,D1),first_index(E1,F1),second_index(G1,H1)) , C<D1 .



check_subset_relationship_similar_var2:- similar_var2(arguments(A,B),size(C,D),first_index(E,F),second_index(G,H)) , (not(greater_similar_var2(A,B,C,D,E,F,G,H))-> generate_integer(I,D,1) , (similar_var2(arguments(A,B),size(C,I),first_index(E1,F1),second_index(G1,H1))-> fail ; true) ; true).   

greater_similar_var2(A,B,C,D,E,F,G,H) :- similar_var2(arguments(A,B),size(C,D1),first_index(E1,F1),second_index(G1,H1)) , C<D1 .

