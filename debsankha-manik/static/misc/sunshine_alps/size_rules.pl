/*/******** this section is for the similar predicate*********/






/*checks whether the matches are always for lists of equal size */

sizes_same_similar:-not(not_sizes_same_similar).

not_sizes_same_similar:-similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , \=(C,D).

/*checks whether list no 2 is always of the same size in the similar statements*/ 

second_entry_same_similar(T):-not(not_second_entry_same_similar) , similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , =(T,D) , ! .

not_second_entry_same_similar:-similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar(arguments(A,B),size(C1,D1),first_index(E1,E1),second_index(F1,G1)) ,\=(D,D1).

/* checks whether list no 1 is always ofthe same size in the similar statements */

first_entry_same_similar(T):-not(not_first_entry_same_similar) , similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , =(T,C) , ! .

not_first_entry_same_similar:-similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) ,similar(arguments(A,B),size(C1,D1),first_index(E1,E1),second_index(F1,G1)), \=(C,C1).


/*checks whether a given input of sizes conform with the size rules, which follow from the examples given */

check_size_rules_similar(N1,N2):- (sizes_same_similar-> =(N1,N2) ; true) , (first_entry_same_similar(T)-> =(N2,T) ; true) , (second_entry_same_similar(T)-> =(N1,T) ; true).

/*checks whether the sizes of the second list is in general smaller than the first list, if the other size_rules do not hold*/

not_subset:- used(A) , find(1,A,A1) , find(2,A,A2) , size_of(N1,A1) , size_of(N2,A2) , A1>=A2.

subset_similar:-not_sizes_same_similar, not_second_entry_same_similar , not(not_subset).




/******** this section is for the similar_intermediate1 predicate*********/






/*checks whether the matches are always for lists of equal size */

sizes_same_similar_intermediate1:-not(not_sizes_same_similar_intermediate1).

not_sizes_same_similar_intermediate1:-similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , \=(C,D).

/*checks whether list no 2 is always of the same size in the similar_intermediate1 statements*/ 

second_entry_same_similar_intermediate1(T):-not(not_second_entry_same_similar_intermediate1) , similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , =(T,D) , ! .

not_second_entry_same_similar_intermediate1:-similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar_intermediate1(arguments(A,B),size(C1,D1),first_index(E1,E1),second_index(F1,G1)) ,\=(D,D1).

/* checks whether list no 1 is always ofthe same size in the similar_intermediate1 statements */

first_entry_same_similar_intermediate1(T):-not(not_first_entry_same_similar_intermediate1) , similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , =(T,C) , ! .

not_first_entry_same_similar_intermediate1:-similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) ,similar_intermediate1(arguments(A,B),size(C1,D1),first_index(E1,E1),second_index(F1,G1)), \=(C,C1).


/*checks whether a given input of sizes conform with the size rules, which follow from the examples given */

check_size_rules_similar_intermediate1(N1,N2):- (sizes_same_similar_intermediate1-> =(N1,N2) ; true) , (first_entry_same_similar_intermediate1(T)-> =(N2,T) ; true) , (second_entry_same_similar_intermediate1(T)-> =(N1,T) ; true).

/*checks whether the sizes of the second list is in general smaller than the first list, if the other size_rules do not hold*/

not_subset:- used(A) , find(1,A,A1) , find(2,A,A2) , size_of(N1,A1) , size_of(N2,A2) , A1>=A2.

subset_similar_intermediate1:-not_sizes_same_similar_intermediate1, not_second_entry_same_similar_intermediate1 , not(not_subset). 


/******** this section is for the similar_intermediate2 predicate*********/






/*checks whether the matches are always for lists of equal size */

sizes_same_similar_intermediate2:-not(not_sizes_same_similar_intermediate2).

not_sizes_same_similar_intermediate2:-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , \=(C,D).

/*checks whether list no 2 is always of the same size in the similar_intermediate2 statements*/ 

second_entry_same_similar_intermediate2(T):-not(not_second_entry_same_similar_intermediate2) , similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , =(T,D) , ! .

not_second_entry_same_similar_intermediate2:-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar_intermediate2(arguments(A,B),size(C1,D1),first_index(E1,E1),second_index(F1,G1)) ,\=(D,D1).

/* checks whether list no 1 is always ofthe same size in the similar_intermediate2 statements */

first_entry_same_similar_intermediate2(T):-not(not_first_entry_same_similar_intermediate2) , similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , =(T,C) , ! .

not_first_entry_same_similar_intermediate2:-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) ,similar_intermediate2(arguments(A,B),size(C1,D1),first_index(E1,E1),second_index(F1,G1)), \=(C,C1).


/*checks whether a given input of sizes conform with the size rules, which follow from the examples given */

check_size_rules_similar_intermediate2(N1,N2):- (sizes_same_similar_intermediate2-> =(N1,N2) ; true) , (first_entry_same_similar_intermediate2(T)-> =(N2,T) ; true) , (second_entry_same_similar_intermediate2(T)-> =(N1,T) ; true).

/*checks whether the sizes of the second list is in general smaller than the first list, if the other size_rules do not hold*/

not_subset:- used(A) , find(1,A,A1) , find(2,A,A2) , size_of(N1,A1) , size_of(N2,A2) , A1>=A2.

subset_similar_intermediate2:-not_sizes_same_similar_intermediate2, not_second_entry_same_similar_intermediate2 , not(not_subset). 


/******** this section is for the similar_var1 predicate*********/






/*checks whether the matches are always for lists of equal size */

sizes_same_similar_var1:-not(not_sizes_same_similar_var1).

not_sizes_same_similar_var1:-similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , \=(C,D).

/*checks whether list no 2 is always of the same size in the similar_var1 statements*/ 

second_entry_same_similar_var1(T):-not(not_second_entry_same_similar_var1) , similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , =(T,D) , ! .

not_second_entry_same_similar_var1:-similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar_var1(arguments(A,B),size(C1,D1),first_index(E1,E1),second_index(F1,G1)) ,\=(D,D1).

/* checks whether list no 1 is always ofthe same size in the similar_var1 statements */

first_entry_same_similar_var1(T):-not(not_first_entry_same_similar_var1) , similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , =(T,C) , ! .

not_first_entry_same_similar_var1:-similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) ,similar_var1(arguments(A,B),size(C1,D1),first_index(E1,E1),second_index(F1,G1)), \=(C,C1).


/*checks whether a given input of sizes conform with the size rules, which follow from the examples given */

check_size_rules_similar_var1(N1,N2):- (sizes_same_similar_var1-> =(N1,N2) ; true) , (first_entry_same_similar_var1(T)-> =(N2,T) ; true) , (second_entry_same_similar_var1(T)-> =(N1,T) ; true).

/*checks whether the sizes of the second list is in general smaller than the first list, if the other size_rules do not hold*/

not_subset:- used(A) , find(1,A,A1) , find(2,A,A2) , size_of(N1,A1) , size_of(N2,A2) , A1>=A2.

subset_similar_var1:-not_sizes_same_similar_var1, not_second_entry_same_similar_var1 , not(not_subset). 
 



/******** this section is for the similar_var2 predicate*********/






/*checks whether the matches are always for lists of equal size */

sizes_same_similar_var2:-not(not_sizes_same_similar_var2).

not_sizes_same_similar_var2:-similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , \=(C,D).

/*checks whether list no 2 is always of the same size in the similar_var2 statements*/ 

second_entry_same_similar_var2(T):-not(not_second_entry_same_similar_var2) , similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , =(T,D) , ! .

not_second_entry_same_similar_var2:-similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar_var2(arguments(A,B),size(C1,D1),first_index(E1,E1),second_index(F1,G1)) ,\=(D,D1).

/* checks whether list no 1 is always ofthe same size in the similar_var2 statements */

first_entry_same_similar_var2(T):-not(not_first_entry_same_similar_var2) , similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , =(T,C) , ! .

not_first_entry_same_similar_var2:-similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) ,similar_var2(arguments(A,B),size(C1,D1),first_index(E1,E1),second_index(F1,G1)), \=(C,C1).


/*checks whether a given input of sizes conform with the size rules, which follow from the examples given */

check_size_rules_similar_var2(N1,N2):- (sizes_same_similar_var2-> =(N1,N2) ; true) , (first_entry_same_similar_var2(T)-> =(N2,T) ; true) , (second_entry_same_similar_var2(T)-> =(N1,T) ; true).

/*checks whether the sizes of the second list is in general smaller than the first list, if the other size_rules do not hold*/
=
not_subset:- used(A) , find(1,A,A1) , find(2,A,A2) , size_of(N1,A1) , size_of(N2,A2) , A1>=A2.

subset_similar_var2:-not_sizes_same_similar_var2, not_second_entry_same_similar_var2 , not(not_subset).*/ 






/*polynomial interpolation for sizes for the similar predicates*/

:-dynamic(done5_similar/1).
:-dynamic(done6_similar/1).

not_second_size_depends_first_size_similar:-similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar(arguments(A1,B1),size(C,D1),first_index(E1,E1),second_index(F1,G1)) , \=(D1,D).

find_second_size_similar(T,Size):-(not(not_second_size_depends_first_size_similar)->((find_second_size_similar1(T,Size) , retract_done5_similar) ; (retract_done5_similar , fail)) ;  fail).

find_second_size_similar1(T,Size):- similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , (done5_similar(C)->fail ; asserta(done5_similar(C))) , retract(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) ,  compute_similar(T,Y) , retract_done6_similar , compute_similar(C,X) , retract_done6_similar , S is D/X, S1 is Y*S , asserta(similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , find_second_size_similar1(T,Newsize) , Size is S1+Newsize ,!.

find_second_size_similar1(T,0):- not(terminate_find_similar).

terminate_find_similar :- similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , not(done5_similar(C)). 

compute_similar(T,Y):- similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , (done6_similar(C)->fail ; asserta(done6_similar(C))) , compute_similar(T,Y1) , Y is Y1*(T-C).

compute_similar(T,1):- not(terminate_compute_similar).

terminate_compute_similar:-similar(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , not(done6_similar(C)).

retract_done5_similar:-retractall(done5_similar(X)).

retract_done6_similar:-retractall(done6_similar(X)). 



/*polynomial interpolation for sizes for the similar_intermediate1 predicate*/

:-dynamic(done5_similar_intermediate1/1).
:-dynamic(done6_similar_intermediate1/1).

not_second_size_depends_first_size_similar_intermediate1:-similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar_intermediate1(arguments(A1,B1),size(C,D1),first_index(E1,E1),second_index(F1,G1)) , \=(D1,D).

find_second_size_similar_intermediate1(T,Size):-(not(not_second_size_depends_first_size_similar_intermediate1)->((find_second_size_similar_intermediate11(T,Size) , retract_done5_similar_intermediate1) ; (retract_done5_similar_intermediate1 , fail)) ; fail).

find_second_size_similar_intermediate11(T,Size):- similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , (done5_similar_intermediate1(C)->fail ; asserta(done5_similar_intermediate1(C))) , retract(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) ,  compute_similar_intermediate1(T,Y) , retract_done6_similar_intermediate1 , compute_similar_intermediate1(C,X) , retract_done6_similar_intermediate1 , S is D/X, S1 is Y*S , asserta(similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , find_second_size_similar_intermediate11(T,Newsize) , Size is S1+Newsize ,!.

find_second_size_similar_intermediate11(T,0):- not(terminate_find_similar_intermediate1).

terminate_find_similar_intermediate1 :- similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , not(done5_similar_intermediate1(C)). 

compute_similar_intermediate1(T,Y):- similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , (done6_similar_intermediate1(C)->fail ; asserta(done6_similar_intermediate1(C))) , compute_similar_intermediate1(T,Y1) , Y is Y1*(T-C).

compute_similar_intermediate1(T,1):- not(terminate_compute_similar_intermediate1).

terminate_compute_similar_intermediate1:-similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , not(done6_similar_intermediate1(C)).

retract_done5_similar_intermediate1:-retractall(done5_similar_intermediate1(X)).

retract_done6_similar_intermediate1:-retractall(done6_similar_intermediate1(X)). 

/*polynomial interpolation for sizes for the similar_intermediate2 predicate*/

:-dynamic(done5_similar_intermediate2/1).
:-dynamic(done6_similar_intermediate2/1).

not_second_size_depends_first_size_similar_intermediate2:-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar_intermediate2(arguments(A1,B1),size(C,D1),first_index(E1,E1),second_index(F1,G1)) , \=(D1,D).

find_second_size_similar_intermediate2(T,Size):-(not(not_second_size_depends_first_size_similar_intermediate2)->((find_second_size_similar_intermediate21(T,Size) , retract_done5_similar_intermediate2) ; (retract_done5_similar_intermediate2 , fail)) ; fail).

find_second_size_similar_intermediate21(T,Size):- similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , (done5_similar_intermediate2(C)->fail ; asserta(done5_similar_intermediate2(C))) , retract(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) ,  compute_similar_intermediate2(T,Y) , retract_done6_similar_intermediate2 , compute_similar_intermediate2(C,X) , retract_done6_similar_intermediate2 , S is D/X, S1 is Y*S , asserta(similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , find_second_size_similar_intermediate21(T,Newsize) , Size is S1+Newsize ,!.

find_second_size_similar_intermediate21(T,0):- not(terminate_find_similar_intermediate2).

terminate_find_similar_intermediate2 :- similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , not(done5_similar_intermediate2(C)). 

compute_similar_intermediate2(T,Y):- similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , (done6_similar_intermediate2(C)->fail ; asserta(done6_similar_intermediate2(C))) , compute_similar_intermediate2(T,Y1) , Y is Y1*(T-C).

compute_similar_intermediate2(T,1):- not(terminate_compute_similar_intermediate2).

terminate_compute_similar_intermediate2:-similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , not(done6_similar_intermediate2(C)).

retract_done5_similar_intermediate2:-retractall(done5_similar_intermediate2(X)).

retract_done6_similar_intermediate2:-retractall(done6_similar_intermediate2(X)). 

/*polynomial interpolation for sizes for similar_var1 predicates*/

:-dynamic(done5_similar_var1/1).
:-dynamic(done6_similar_var1/1).

not_second_size_depends_first_size_similar_var1:-similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar_var1(arguments(A1,B1),size(C,D1),first_index(E1,E1),second_index(F1,G1)) , \=(D1,D).

find_second_size_similar_var1(T,Size):-(not(not_second_size_depends_first_size_similar_var1)->((find_second_size_similar_var11(T,Size) , retract_done5_similar_var1) ; (retract_done5_similar_var1 , fail)) ; fail).

find_second_size_similar_var11(T,Size):- similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , (done5_similar_var1(C)->fail ; asserta(done5_similar_var1(C))) , retract(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) ,  compute_similar_var1(T,Y) , retract_done6_similar_var1 , compute_similar_var1(C,X) , retract_done6_similar_var1 , S is D/X, S1 is Y*S , asserta(similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , find_second_size_similar_var11(T,Newsize) , Size is S1+Newsize ,!.

find_second_size_similar_var11(T,0):- not(terminate_find_similar_var1).

terminate_find_similar_var1 :- similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , not(done5_similar_var1(C)). 

compute_similar_var1(T,Y):- similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , (done6_similar_var1(C)->fail ; asserta(done6_similar_var1(C))) , compute_similar_var1(T,Y1) , Y is Y1*(T-C).

compute_similar_var1(T,1):- not(terminate_compute_similar_var1).

terminate_compute_similar_var1:-similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , not(done6_similar_var1(C)).

retract_done5_similar_var1:-retractall(done5_similar_var1(X)).

retract_done6_similar_var1:-retractall(done6_similar_var1(X)). 


/*polynomial interpolation for sizes for similar_var2 predicates*/

:-dynamic(done5_similar_var2/1).
:-dynamic(done6_similar_var2/1).

not_second_size_depends_first_size_similar_var2:-similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , similar_var2(arguments(A1,B1),size(C,D1),first_index(E1,E1),second_index(F1,G1)) , \=(D1,D).

find_second_size_similar_var2(T,Size):-(not(not_second_size_depends_first_size_similar_var2)->((find_second_size_similar_var21(T,Size) , retract_done5_similar_var2) ; (retract_done5_similar_var2 , fail)) ; fail).

find_second_size_similar_var21(T,Size):- similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , (done5_similar_var2(C)->fail ; asserta(done5_similar_var2(C))) , retract(similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) ,  compute_similar_var2(T,Y) , retract_done6_similar_var2 , compute_similar_var2(C,X) , retract_done6_similar_var2 , S is D/X, S1 is Y*S , asserta(similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G))) , find_second_size_similar_var21(T,Newsize) , Size is S1+Newsize ,!.

find_second_size_similar_var21(T,0):- not(terminate_find_similar_var2).

terminate_find_similar_var2 :- similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , not(done5_similar_var2(C)). 

compute_similar_var2(T,Y):- similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , (done6_similar_var2(C)->fail ; asserta(done6_similar_var2(C))) , compute_similar_var2(T,Y1) , Y is Y1*(T-C).

compute_similar_var2(T,1):- not(terminate_compute_similar_var2).

terminate_compute_similar_var2:-similar_var2(arguments(A,B),size(C,D),first_index(E,E),second_index(F,G)) , not(done6_similar_var2(C)).

retract_done5_similar_var2:-retractall(done5_similar_var2(X)).

retract_done6_similar_var2:-retractall(done6_similar_var2(X)). 


/* this section should be replaced by rules for subset relations later*/

subset_similar:-fail.
subset_similar_intermediate1:-fail.
subset_similar_intermediate2:-fail.
subset_similar_var1:-fail.
subset_similar_var2:-fail.








