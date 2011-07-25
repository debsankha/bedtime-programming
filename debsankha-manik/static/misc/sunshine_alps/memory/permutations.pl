file_search_path(road , 'sunshine_alps').
:-dynamic(consulted/0).
:-dynamic(similar/4).
:-dynamic(similar_intermediate1/4).
:-dynamic(similar_intermediate2/4).
:-dynamic(similar_var1/4).
:-dynamic(similar_var2/4).
:-dynamic(used/1).
:-dynamic permutations/1.
used([[a,b,c],[b,a,c]]).
used([[b,c,g,h],[h,g,c,b]]).
used([[b,c,a],[a,b,c]]).
used([[c,b,a],[a,b,c]]).
used([[e,b,d,c],[e,b,c,d]]).
used([[a,c,b,d],[a,b,c,d]]).
permutations(similar_intermediate1(arguments(2,1),size(3,3),first_index(3,3),second_index(1,_G33))).
permutations(similar_intermediate1(arguments(2,1),size(4,4),first_index(4,4),second_index(1,_G33))).
permutations(similar_intermediate2(arguments(2,1),size(3,3),first_index(3,3),second_index(_G32,1))).
permutations(similar_intermediate2(arguments(2,1),size(4,4),first_index(4,4),second_index(_G32,1))).
consult_required:-consult(road(similarity)), consult(road(primitive)) , consult(road(generate_specific_superset)) , consult(road(permute_fixed)) , consult(road(learn)) , consult(road(make_rule_similar_first_index)) , consult(road(make_rule_similar_second_index_first_entry)) , consult(road(make_rule_similar_second_index_second_entry)), consult(road(make_rule_similar_intermediate1_first_index)) , consult(road(make_rule_similar_intermediate1_second_index_first_entry)), consult(road(make_rule_similar_intermediate2_first_index)) , consult(road(make_rule_similar_intermediate2_second_index_second_entry)) , consult(road(make_rule_similar_var1_first_index)) ,  consult(road(size_rules)) , consult(road(generate_specific_superset)).
permutations(_G0,_G1):-consulted->not(extract(permutations)),rule_var(_G0,_G1),not(reextract(permutations));consult_required,not(extract(permutations)),rule_var(_G0,_G1),not(reextract(permutations)),asserta(consulted).
permutations(_G0,_G1):-not(rule_var(_G0,_G1))->not(reextract(permutations)),fail;fail.
