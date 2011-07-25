file_search_path(road , 'sunshine_alps').
:-dynamic(consulted/0).
:-dynamic(similar/4).
:-dynamic(similar_intermediate1/4).
:-dynamic(similar_intermediate2/4).
:-dynamic(similar_var1/4).
:-dynamic(similar_var2/4).
:-dynamic(used/1).
used([[b,c,d],[a,b,c,d]]).
used([[a,c,d],[a,b,c,d]]).
used([[a,b,d],[a,b,c,d]]).
used([[a,b,c],[a,b,c,d]]).
used([[b,c],[a,b,c]]).
used([[a,c],[a,b,c]]).
used([[a,b],[a,b,c]]).
similar_intermediate2(arguments(2,1),size(4,3),first_index(3,3),second_index(_G23,1)).
similar_intermediate2(arguments(2,1),size(3,2),first_index(2,2),second_index(_G23,1)).
consult_required:-consult(road(similarity)), consult(road(primitive)) , consult(road(generate_specific_superset)) , consult(road(permute_fixed)) , consult(road(learn)) , consult(road(make_rule_similar_first_index)) , consult(road(make_rule_similar_second_index_first_entry)) , consult(road(make_rule_similar_second_index_second_entry)), consult(road(make_rule_similar_intermediate1_first_index)) , consult(road(make_rule_similar_intermediate1_second_index_first_entry)), consult(road(make_rule_similar_intermediate2_first_index)) , consult(road(make_rule_similar_intermediate2_second_index_second_entry)) , consult(road(make_rule_similar_var1_first_index)) ,  consult(road(size_rules)) , consult(road(generate_specific_superset)).
my_delete(_G0,_G1):-consulted->rule_var(_G0,_G1);consult_required,rule_var(_G0,_G1),asserta(consulted).
