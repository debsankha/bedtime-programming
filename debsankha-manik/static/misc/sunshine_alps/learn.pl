:-dynamic(change_learn/0).


learn:-(not(change_learn)->consult(similarity) , consult(make_rule_similar_first_index) , consult(make_rule_similar_second_index_first_entry) , consult(make_rule_similar_second_index_second_entry), consult(make_rule_similar_intermediate1_first_index) , consult(make_rule_similar_intermediate1_second_index_first_entry), consult(make_rule_similar_intermediate2_first_index) , consult(make_rule_similar_intermediate2_second_index_second_entry) , consult(make_rule_similar_var1_first_index) ,  consult(size_rules) , consult(generate_specific_superset) ; true) , remove_previously_asserted , start , nl ,write('enter the name of the predicate for the examples that you gave') ,nl, read(X) , Y=..[X,A,B], concat(X,'.pl',Z) , concat('/home/dibya/ACADEMICS/prolog/programs/sunshine_alps/memory/' ,Z,Z1) , open(Z1,append,Streaming) , not(telling(Z1)) , tell(Z1) ,  write('file_search_path(road , \'\/home\/dibya\/ACADEMICS\/prolog\/programs\/sunshine_alps\').') , nl , write(':-dynamic(consulted/0).') , nl , write(':-dynamic(similar/4).') , nl , write(':-dynamic(similar_intermediate1/4).') , nl , write(':-dynamic(similar_intermediate2/4).') , nl , write(':-dynamic(similar_var1/4).') , nl , write(':-dynamic(similar_var2/4).') , nl , write(':-dynamic(used/1).') , nl , write(:- dynamic X/1) , write('.') , nl , not(memory(X)) , write('consult_required:-consult(road(similarity)), consult(road(primitive)) , consult(road(generate_specific_superset)) , consult(road(permute_fixed)) , consult(road(learn)) , consult(road(make_rule_similar_first_index)) , consult(road(make_rule_similar_second_index_first_entry)) , consult(road(make_rule_similar_second_index_second_entry)), consult(road(make_rule_similar_intermediate1_first_index)) , consult(road(make_rule_similar_intermediate1_second_index_first_entry)), consult(road(make_rule_similar_intermediate2_first_index)) , consult(road(make_rule_similar_intermediate2_second_index_second_entry)) , consult(road(make_rule_similar_var1_first_index)) ,  consult(road(size_rules)) , consult(road(generate_specific_superset)).') , nl , write(Y:-((consulted-> not(extract(X)) , rule_var(A,B) , not(reextract(X)) ; (consult_required , not(extract(X)) , rule_var(A,B) , not(reextract(X)), asserta(consulted))))), write('.') , nl , write(Y:- (not(rule_var(A,B))-> not(reextract(X)) , fail ; fail)) , write('.') ,  told.

extract(X):- Z=..[X,similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))] , Z , retract(Z) , asserta(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , fail.

extract(X):- Z=..[X,similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))] , Z , retract(Z) , asserta(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , fail.

extract(X):- Z=..[X,similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))] , Z , retract(Z) , asserta(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , fail.

extract(X):- Z=..[X,similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))] , Z , retract(Z) , asserta(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , fail.

extract(X):- Z=..[X,similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))] , Z , retract(Z) , asserta(similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , fail.


reextract(X):- similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , Z=..[X,similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))] , retract(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , asserta(Z) , fail.

reextract(X):- similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , Z=..[X,similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))] , retract(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , asserta(Z) , fail.

reextract(X):- similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , Z=..[X,similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))] , retract(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , asserta(Z) , fail.

reextract(X):- similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , Z=..[X,similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))] , retract(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , asserta(Z) , fail.

reextract(X):- similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , Z=..[X,similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))] , retract(similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , asserta(Z) , fail.


memory(Y) :- (used(X) , write(used(X)) , write('.') , nl , fail) ; (similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , Z=..[Y,similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))] , write(Z) , write('.') , nl , fail) ; (similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , Z=..[Y,similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))] , write(Z) , write('.') , nl , fail) ; (similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , Z=..[Y,similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))] , write(Z) , write('.') , nl , fail) ;  (similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , Z=..[Y,similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))] , write(Z) , write('.') , nl , fail) ;  (similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , Z=..[Y,similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H))] , write(Z) , write('.') , nl , fail).
  
   
  

rule(A,B):-not(change_learn) , (master(A,B)->retractall(superset(K,L,M,N,O)), nl ,write('statement_true!') ; retractall(superset(K1,L1,M1,N1,O1)) , nl, write('statement false')) , nl ,write('am i right?') , nl, write('please answer yes or no') , nl , read(X) , (=(X,no)-> asserta(change_learn),  not(reassert_facts) , learn , nl , write('i have tried to relearn, please ask me again.') ; true) , !.


rule_var(A,B):- not(change_learn) , master(A,B).


rule(A,B):-change_learn , makelist([A,B],2,1,C) , find(1,C,C1) , size_of(N,C1) , factorial(N, Factn), generate_specific(C1,N,N,Factn,C1new) , (master(C1new,B)->retractall(superset(K,L,M,N,O)), nl ,write('statement_true!') ; retractall(superset(K1,L1,M1,N1,O1)) , nl, write('statement false')) , nl ,write('am i right?') , nl, write('please answer yes or no') , nl , read(X) , (=(X,no)-> nl , write('sorry i am too young to handle this concept. try something simpler please. show some mercy!') ; true) , !.

master(A,B):- not(var(A)) , not(var(B)) , makelist([A,B],2,1,C) , find(1,C,C1) ,  find(2,C,C2) , size_of(N1,C1) ,  size_of(N2,C2) , ((not(similar(K,L,M,N))-> fail ; find_second_size_similar(N2,N1) ,  find_index_similar_first_index(2,1,N2,N1,J) , Jint is integer(J)  , find_index_similar_second_index_first_entry(2,1,N2,N1,I1) , I1int is integer(I1) , find_index_similar_second_index_second_entry(2,1,N2,N1,I2) , I2int is integer(I2) , generate_specific(C1,N1,Jint,I2int,X) , generate_specific(C2,N2,Jint,I1int,Y) ,  =(X,Y)) ; (not(similar_intermediate1(K1,L1,M1,O1))-> fail ; find_second_size_similar_intermediate1(N2,N1) , find_index_similar_intermediate1_first_index(2,1,N2,N1,P) , Pint is integer(P) , find_index_similar_intermediate1_second_index_first_entry(2,1,N2,N1,P1) , P1int is integer(P1) , check_similar_intermediate1(C1,C2,N1,N2,Pint,P1int)) ; (not(similar_intermediate2(K2,L2,M2,O2))->fail ; find_second_size_similar_intermediate2(N2,N1) , find_index_similar_intermediate2_first_index(2,1,N2,N1,U) , Uint is integer(U) , find_index_similar_intermediate2_second_index_second_entry(2,1,N2,N1,U1) , U1int is integer(U1) , check_similar_intermediate2(C1,C2,N1,N2,Uint,U1int)) ; (not(similar_var1(K3,L3,M3,O3))-> fail ; find_second_size_similar_var1(N2,N1) , find_index_similar_var1_first_index(2,1,N2,N1,J1) , J1int is integer(J1) , doall(generate_fixed_size(1,C1,N1,J1int)) , doall(generate_fixed_size(2,C2,N2,J1int)) , check_similar_var1(J1int,N1,N2))  ; (not(similar_var2(K4,L4,M4,O4))->fail ; find_second_size_similar_var2(N2,N1) , not(generate(C)) , check_similar_var2(N1,N2))).



master(A,B):- var(A) , not(var(B)) , makelist([A,B],2,1,C) ,  find(1,C,C1) ,  find(2,C,C2) ,  size_of(N2,C2) ,  (((not(similar(K,L,M,N))-> false ; ( (find_second_size_similar(N2,N1) , size_of(N1,C1)) ; (subset_similar , generate_integer(N1,N2,1)))  , find_index_similar_first_index(2,1,N2,N1,J) , Jint is integer(J)  , find_index_similar_second_index_first_entry(2,1,N2,N1,I1) , I1int is integer(I1) , find_index_similar_second_index_second_entry(2,1,N2,N1,I2) , I2int is integer(I2) , generate_specific_var(C1,N1,Jint,I2int,X) , generate_specific(C2,N2,Jint,I1int,Y) ,  =(X,Y)) ; (not(similar_intermediate1(K1,L1,M1,O1))-> false ; ((find_second_size_similar_intermediate1(N2,N1) , size_of(N1,C1)) ; (subset_similar_intermediate1 , generate_integer(N1,N2,1))), find_index_similar_intermediate1_first_index(2,1,N2,N1,P) , Pint is integer(P) , find_index_similar_intermediate1_second_index_first_entry(2,1,N2,N1,P1) , P1int is integer(P1) , check_similar_intermediate1_variable(C1,C2,N1,N2,Pint,P1int)) ; (not(similar_intermediate2(K2,L2,M2,O2))-> false ; ((find_second_size_similar_intermediate2(N2,N1) , size_of(N1,C1)) ; (subset_similar_intermediate2 , generate_integer(N1,N2,1))) ,  find_index_similar_intermediate2_first_index(2,1,N2,N1,U) , Uint is integer(U) , find_index_similar_intermediate2_second_index_second_entry(2,1,N2,N1,U1) , U1int is integer(U1) , check_similar_intermediate2_variable(C1,C2,N1,N2,Uint,U1int)) ; (not(similar_var1(K3,L3,M3,O3))-> false ; ((find_second_size_similar_var1(N2,N1) , size_of(N1,C1)) ; (subset_similar_var1 , generate_integer(N1,N2,1))) , find_index_similar_var1_first_index(2,1,N2,N1,J1) , J1int is integer(J1) ,  check_similar_var1_variable(J1int,C1,C2,N1,N2)) ; (not(similar_var2(K4,L4,M4,O4))->false ; ((find_second_size_similar_var2(N2,N1) , size_of(N1,C1)) ; (subset_similar_var2 , generate_integer(N1,N2,1)))  , check_similar_var2_variable(C1,C2,N1,N2)))).


check_similar_var1(J1,N1,N2):-superset(1,N1,J1,X,Y) , superset(2,N2,J1,Z,W) , =(Y,W).

check_similar_var2(N1,N2):-superset(1,N1,X,Y,Z) , superset(2,N2,K,L,M) , =(M,Z).

remove_previously_asserted:-(not(similar(A,B,C,D))-> true ; retractall(similar(A1,B1,C1,D1))) , (not(similar_var1(A2,B2,C2,D2))-> true ; retractall(similar_var1(A3,B3,C3,D3))) ,  (not(similar_var2(A4,B4,C4,D4))-> true ; retractall(similar_var2(A5,B5,C5,D5))) ,  (not(similar_intermediate1(A6,B6,C6,D6))-> true ; retractall(similar_intermediate1(A7,B7,C7,D7))) , (not(similar_intermediate2(A8,B8,C8,D8))-> true ; retractall(similar_intermediate2(A9,B9,C9,D9))).


check_similar_intermediate1(C1,C2,N1,N2,Pint,P1int):- generate_specific(C2,N2,Pint,P1int,X) , is_similar_intermediate1(C1,X).

is_similar_intermediate1(C1,X):- \=(C1,[]) , \=(X,[]) , find(1,X,B) , scan(A,C1,D) , =(B,D) , ! , renew(X,B,Xnew) , renew(C1,B,C1new) , is_similar_intermediate1(C1new,Xnew). 

is_similar_intermediate1(X,[]):-!.
is_similar_intermediate1([],[]):-!.


check_similar_intermediate2(C1,C2,N1,N2,Uint,U1int):- generate_specific(C1,N1,Uint,U1int,X) , is_similar_intermediate2(C2,X).

is_similar_intermediate2(C2,X):- \=(C2,[]) , \=(X,[]) , find(1,X,B) , scan(A,C2,D) , =(B,D) , ! , renew(X,B,Xnew) , renew(C2,B,C2new) , is_similar_intermediate1(C2new,Xnew). 

is_similar_intermediate2(X,[]):-!.
is_similar_intermediate2([],[]):-!.

reassert_facts:-used(A) , retract(used(A)) , size_of(X,A) , find(1,A,A1) , find(2,A,A2) , size_of(N,A1) , factorial(N, Factn), generate_specific(A1,N,N,Factn,A1new) , asserta(true([A1new,A2])) , write([A1new,A2]) , nl , fail.


check_similar_intermediate1_variable(C1,C2,N1,N2,Pint,P1int) :- generate_specific(C2,N2,Pint,P1int,X) , permutation(N1,Pint,P) , generate_integer(A,P,1) , generate_specific_var(C1,N1,Pint,A,Y) , =(X,Y). 


check_similar_intermediate2_variable(C1,C2,N1,N2,Uint,U1int):- generate_specific_var(C1,N1,Uint,U1int,X) , permutation(N2,Uint,U) , generate_integer(A,U,1) , generate_specific(C2,N2,Uint,A,Y) , =(X,Y).



generate_integer(X,Y,M) :- Y>=0 , Y>M , M1 is M+1 , generate_integer(X1,Y,M1) , X is X1+1.
generate_integer(1,Y,M) :- Y>=0.

check_similar_var1_variable(J1int,C1,C2,N1,N2) :- permutation(N1,Jint,J1) , generate_integer(A,J1,1) , generate_specific_var(C1,N1,Jint,A,X) , generate_integer(B,J1,1) , generate_specific_var(C2,N2,Jint,B,Y) , =(X,Y).


check_similar_var2_variable(C1,C2,N1,N2) :- J is max(N1,N2) , generate_integer(A,J,1) , permutation(N1,A,I1) , permutation(N2,A,I2) , generate_integer(K1,I1,1) , generate_integer(K2,I2,1) , generate_specific_var(C1,N1,A,K1,X) , generate_specific_var(C2,N2,A,K2,Y) , =(X,Y). 
