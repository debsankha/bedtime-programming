get_all_facts(N,[],[]):-not(used(_,N)).
get_all_facts(N,[H|T],[H2|T2]):-used(_,N),get_rem_links(N),setof(L,equal(N,L),H),setof(NU,null(N,NU),H2),M is N+1,get_all_facts(M,T,T2).

intersection_many([A],A).
intersection_many([A,B],X):-intersection(A,B,X).
intersection_many([A,B|C],X):-intersection(A,B,I),intersection_many([I|C],X).

get_common_facts(L):-get_all_facts(1,LI,Nulls),intersection_many(LI,CP),intersection_many(Nulls,CN),
	open('common_facts.pl',write,File),set_output(File),writef('<equals>'),nl,
	not((member(M,CP),not((member(T,M),write(T),writef('\t'),fail)),nl,fail)),
	writef('</equals>\n<nulls>\n'),not((member(Z,CN),write(Z),nl,fail)),writef('</nulls>\n'),
	writef('<diffs>\n'),not((diff(Op,Num,2),write(Num),writef('\t'),write(Op),nl,fail)),writef('</diffs>\n'),
	writef('<len>'),used(A,_),length(A,LNG),write(LNG),writef('</len>'),
	close(File),shell('python write_kb.py'),consult(formed_rule),listing(true).

