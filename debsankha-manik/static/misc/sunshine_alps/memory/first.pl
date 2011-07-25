file_search_path(road , 'sunshine_alps').
:-dynamic(consulted/0).
:-dynamic(similar/4).
:-dynamic(similar_intermediate1/4).
:-dynamic(similar_intermediate2/4).
:-dynamic(similar_var1/4).
:-dynamic(similar_var2/4).
:-dynamic(used/1).
:-dynamic first/1.
used([[f],[f,l]]).
used([[e],[e,f]]).
used([[b],[b,k,l]]).
used([[a],[a,m,n]]).
first(similar(arguments(2,1),size(2,1),first_index(1,1),second_index(1,1))).
first(similar(arguments(2,1),size(3,1),first_index(1,1),second_index(1,1))).
consult_required:-consult(road(similarity)), consult(road(primitive)) , consult(road(generate_specific_superset)) , consult(road(permute_fixed)) , consult(road(learn)) , consult(road(make_rule_similar_first_index)) , consult(road(make_rule_similar_second_index_first_entry)) , consult(road(make_rule_similar_second_index_second_entry)), consult(road(make_rule_similar_intermediate1_first_index)) , consult(road(make_rule_similar_intermediate1_second_index_first_entry)), consult(road(make_rule_similar_intermediate2_first_index)) , consult(road(make_rule_similar_intermediate2_second_index_second_entry)) , consult(road(make_rule_similar_var1_first_index)) ,  consult(road(size_rules)) , consult(road(generate_specific_superset)).
first(_G0,_G1):-consulted->not(extract(first)),rule_var(_G0,_G1),not(reextract(first));consult_required,not(extract(first)),rule_var(_G0,_G1),not(reextract(first)),asserta(consulted).
first(_G0,_G1):-not(rule_var(_G0,_G1))->not(reextract(first)),fail;fail.
