sizes_dependent_similar_second_entry_same :- similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar(arguments(A,B),size(C,D1),first_index(F,F),second_index(G,H)) , \=(D,D1) .



sizes_dependent_similar_first_entry_same :-  similar(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar(arguments(A,B),size(C1,D),first_index(F,F),second_index(G,H)) , \=(C,C1) .


sizes_dependent_similar_intermediate1_second_entry_same :- similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar_intermediate1(arguments(A,B),size(C,D1),first_index(F,F),second_index(G,H)) , \=(D,D1) .



sizes_dependent_similar_intermediate1_first_entry_same :-  similar_intermediate1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar_intermediate1(arguments(A,B),size(C1,D),first_index(F,F),second_index(G,H)) , \=(C,C1) .


sizes_dependent_similar_intermediate2_second_entry_same :- similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar_intermediate2(arguments(A,B),size(C,D1),first_index(F,F),second_index(G,H)) , \=(D,D1) .



sizes_dependent_similar_intermediate2_first_entry_same :-  similar_intermediate2(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar_intermediate2(arguments(A,B),size(C1,D),first_index(F,F),second_index(G,H)) , \=(C,C1) .



/*sizes_dependent_similar_intermediate2_second_entry_same :- true.
sizes_dependent_similar_intermediate2_first_entry_same :- true.*/

sizes_dependent_similar_var1_second_entry_same :-  similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar_var1(arguments(A,B),size(C,D1),first_index(F,F),second_index(G,H)) , \=(D,D1) .


sizes_dependent_similar_var1_first_entry_same :- similar_var1(arguments(A,B),size(C,D),first_index(E,E),second_index(G,H)) , similar_var1(arguments(A,B),size(C1,D),first_index(F,F),second_index(G,H)) , \=(C,C1) .


change_with_cond_similar(N1,N2,C,D,Y,X):- (not(sizes_dependent_similar_second_entry_same)->change_first_dependent_only(N1,C,Y,X) ; (not(sizes_dependent_similar_first_entry_same)->change_second_dependent_only(N2,D,Y,X) ; change(N1,N2,C,D,Y,X))). 

change_with_cond_similar_intermediate1(N1,N2,C,D,Y,X):- (not(sizes_dependent_similar_intermediate1_second_entry_same)->change_first_dependent_only(N1,C,Y,X) ; (not(sizes_dependent_similar_intermediate1_first_entry_same)->change_second_dependent_only(N2,D,Y,X) ; change(N1,N2,C,D,Y,X))). 

change_with_cond_similar_intermediate2(N1,N2,C,D,Y,X):- (not(sizes_dependent_similar_intermediate2_second_entry_same)->change_first_dependent_only(N1,C,Y,X) ; (not(sizes_dependent_similar_intermediate2_first_entry_same)->change_second_dependent_only(N2,D,Y,X) ; change(N1,N2,C,D,Y,X))). 


change_with_cond_similar_var1(N1,N2,C,D,Y,X):- (not(sizes_dependent_similar_var1_second_entry_same)->change_first_dependent_only(N1,C,Y,X) ; (not(sizes_dependent_similar_var1_first_entry_same)->change_second_dependent_only(N2,D,Y,X) ; change(N1,N2,C,D,Y,X))). 
 

change(N1,N2,C,D,Y,X):- =(C,N1) , =(D,N2) ,=(Y,X).
change(N1,N2,C,D,Y,X):- =(C,N1) , \=(D,N2) ,=(Y,X*(N2-D)) , (match->true ; asserta(match)).
change(N1,N2,C,D,Y,X):- \=(C,N1) , =(D,N2) ,=(Y, X*(N1-C)) , (match->true ;asserta(match)).
change(N1,N2,C,D,Y,X):- \=(C,N1) , \=(D,N2) ,(\=(C,D)-> =(Y, X*(N1-C)*(N2-D)) ; =(Y,X*(N1-C))) , (match->true ; asserta(match)).
 
change_first_dependent_only(N1,C,Y,X):- \=(C,N1) , =(Y,X*(N1-C)) , (match->true ; asserta(match)).
change_first_dependent_only(N1,C,Y,X):- =(C,N1) , =(Y,X) , (match->true ; asserta(match)).
change_second_dependent_only(N2,D,Y,X):- \=(D,N2) , =(Y,X*(N2-D)) , (match->true ; asserta(match)).
change_second_dependent_only(N2,D,Y,X):- =(D,N2) , =(Y,X) , (match->true ; asserta(match)).

