:-dynamic(link_with_list_no/2).
:-dynamic(exception/2).
:-dynamic(diff/2).
:-dynamic(count/1).
:-dynamic(link_with_other_lists/4).
:-dynamic(cont/2).

link_with_other_lists(P,Ind,L,Num):-used(Total,1),length(Total,Lng),numlist(1,Lng,Range),member(Num,Range),link_wid_others(P,Ind,LinkLi),reverse(LinkLi,[H|T]),(=(H,Num)->(=(T,L));(=(L,[none]))).

right_partition(P,N):-used([First|_],N),partition(First,P),find_rec_pattern(P,N),!.

find_rec_pattern(P,N):-length(P,Totlen),retractall(exception(_,_)),retractall(cont(_,_)),retractall(count(_)),retractall(diff(_,_)),retractall(link_with_list_no(_,_)),asserta(count(1)),not((member(PH,P),count(Ind),retractall(count(_)),Ind1 is Ind+1,asserta(count(Ind1)), not((link_with_other_lists(P,Ind,L,Num),/*reverse(L,[Num|LT0]),*/

((length(PH,1),used(TotLi,N),nth1(Num,TotLi,Oth),=(PH,[PHelem]),nth1(Pos,Oth,PHelem),length(Oth,Pos),last(L,tail))->(append(L,[first],LT));(=(L,LT))),
	(link_with_list_no(Num,Li)-> 
		(diff(Diff,Num)->
			(append(Diff,Li,LT)->
				(retractall(link_with_list_no(Num,_)),asserta(link_with_list_no(Num,LT)),((\=(LT,[none]))->(asserta(cont(PH,N)));1=1));
			(assertz(exception(PH,N))));
		(retractall(link_with_list_no(Num,_)),asserta(link_with_list_no(Num,LT)),append(Diff,Li,LT),\=(Diff,[]),asserta(diff(Diff,Num)),((\=(LT,[none]))->(asserta(cont(PH,N)));1=1)));
	(asserta(link_with_list_no(Num,LT)))),fail)),
	fail)),
	setof(Ex,exception(Ex,X),ExLi),setof(Cont,cont(Cont,Y),ContLi),subtract(ExLi,ContLi,PureEx),length(PureEx,Len1),length(ContLi,Len2),Len1<Len2.



