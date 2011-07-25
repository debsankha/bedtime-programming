:-dynamic(link_with_list_no/2).
:-dynamic(exception/2).
:-dynamic(diff/3).
:-dynamic(count/1).
:-dynamic(link_with_other_lists/4).
:-dynamic(cont/2).
:-dynamic(null/2).
:-dynamic(equal/2).

/* Finding the partition */

link_with_other_lists(N,PH,L,Num):-used(Total,N),length(Total,Lng),numlist(2,Lng,Range),link_wid_others(N,PH,LinkLi),member(Num,Range),reverse(LinkLi,[H|T]),(=(H,Num)->(=(T,L));(=(L,[none]))).

find_rec_pattern(P,N):-length(P,Totlen),retractall(exception(_,_)),retractall(cont(_,_)),retractall(count(_)),retractall(diff(_,_,_)),retractall(link_with_list_no(_,_)),asserta(count(1)),not((member(PH,P),count(Ind),retractall(count(_)),Ind1 is Ind+1,asserta(count(Ind1)), not((link_with_other_lists(N,PH,L,Num),/*reverse(L,[Num|LT0]),*/

((length(PH,1),used(TotLi,N),nth1(Num,TotLi,Oth),=(PH,[PHelem]),nth1(Pos,Oth,PHelem),length(Oth,Pos),last(L,tail))->(append(L,[first],LT));(=(L,LT))),
	(link_with_list_no(Num,Li)-> 
		(diff(Diff,Num,_)->
			(append(Diff,Li,LT)->
				(retractall(link_with_list_no(Num,_)),asserta(link_with_list_no(Num,LT)),((\=(LT,[none]))->(assertz(cont(Ind,N)));1=1));
			(assertz(exception(Ind,N))));
		(retractall(link_with_list_no(Num,_)),asserta(link_with_list_no(Num,LT)),append(Diff,Li,LT),\=(Diff,[]),assertz(diff(Diff,Num,Ind)),((\=(LT,[none]))->(assertz(cont(Ind,N)));1=1)));
	(asserta(link_with_list_no(Num,LT)))),fail)),
	fail)),
	setof(Ex,exception(Ex,X),ExLi),setof(Cont,cont(Cont,Y),ContLi),subtract(ExLi,ContLi,PureEx),length(PureEx,Len1),length(ContLi,Len2),Len1<Len2.


right_partition(P,N):-used([First|_],N),partition(First,P),find_rec_pattern(P,N),P=[A,B|_],link_wid_self(N,A,L1),link_wid_self(N,B,L2),append(L1,Rest,L2),asserta(diff(Rest,1,2)),!.

/* Finding the rules
We have:
	exception(Ind,N)
	cont(Ind,N) */

/*Step I : get the rest of the list */

slice(I,L,L,I).					/*removes the first I elements of a list if 4th arg is  is 0*/
slice(I,[H|T],X,N):-N<I,M is N+1,slice(I,T,X,M).

apply_diff(Op,0,Li,Li).				/*applies the /1 /2 times on /3 , ans is /4 */
apply_diff(Op,Count,Li,X):-append([Op,[New],[Li]],Tot),F=..Tot,call(F),Count2 is Count-1,apply_diff(Op,Count2,New,X).

get_rest_others(N,[],Num):-used(Total,N),length(Total,L),Num is L+1.
get_rest_others(N,[H|T],Num):-used(Total,N),nth1(Num,Total,Arg),(diff(Op,Num,2)->(exception(G,_),Count is G-1,apply_diff(Op,Count,Arg,H));=(H,Arg)),Num2 is Num+1,get_rest_others(N,T,Num2).


get_rest(N,[X|Y]):-used([H|T],N),right_partition(P,N),exception(I,_),slice(I,P,L,1),append(L,X),get_rest_others(N,Y,2).

/* get_rest(N,L) gives the rest of the list, now the fun really begins */

link_wid_list_no(N,M,L,Narg):-used([Farg|_],N),(subset(M,Farg)->(link_with_other_lists(N,M,L,Narg),\=(L,[none]));
	(link_with_others(N,M,FL),reverse(FL,[Narg|L]))).


get_rem_others(N,Num1):-get_rest(N,Total),nth1(Num1,Total,Arg),((=(Arg,[]))->(assertz(null(N,Num1)));
	(link_wid_list_no(N,Arg,FTL,Num1),not((partition(Arg,P),
	not((member(M,P),link_wid_list_no(N,M,FL,Num1),
	not((link_wid_list_no(N,M,SL,W),W>Num1,nth1(W,Total,Arg2),
	link_wid_list_no(N,Arg2,STL,W),append(FTL,LI1,FL),append(STL,LI2,SL),
	assertz(equal(N,[Num1,W,LI1,LI2])),fail)),fail)),fail)))),!.



get_rem_links(N):-get_rest(N,[H|T]),retractall(null(N,_)),((=(H,[]))->(assertz(null(N,1)));true),link_wid_self(N,H,LR),reverse(LR,RL),retractall(equal(N,_)),not((partition(H,P),
	not((member(M,P),link_wid_self(N,M,OL),reverse(OL,LO),not((link_wid_list_no(N,M,L,Narg),\=(L,[none]),nth1(Narg,[H|T],RestArg),link_wid_list_no(N,RestArg,TL,Narg),append(TL,Rest,L),append(RL,Rest0,LO),assertz(equal(N,[1,Narg,Rest0,Rest])),fail)),fail)),fail))
	,length([H|T],Lngth0),((Lngth0>2)->(Lngth is Lngth0-1,numlist(2,Lngth,NumLi),not((member(Index,NumLi),writef('calling: '),write(Index),nl,get_rem_others(N,Index),fail)));true),((last([H|T],LastEl),=(LastEl,[]))->(assertz(null(N,Lngth0)));true).
