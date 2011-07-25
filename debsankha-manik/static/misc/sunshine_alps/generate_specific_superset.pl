generate_specific(A,X,L,N,[B|C]):- \=(L,0) , ! , X>=L , permutation(X,L,G) , G>=N ,  D is L-1 , M is X-1 , find_max_remainder(D,M,N,Max,N1) , find(Max,A,B) , renew(A,B,Anew) , generate_specific(Anew,M,D,N1,C).

generate_specific(Anew,X,0,N,[]):-!.


generate_specific_var(A,X,L,N,[B|C]):- \=(L,0) , ! , X>=L , permutation(X,L,G) , G>=N ,  D is L-1 , M is X-1 , find_max_remainder(D,M,N,Max,N1) , find(Max,A,B) , renew_ref_index(A,X,Max,1,Anew) , generate_specific_var(Anew,M,D,N1,C).

generate_specific_var(Anew,X,0,N,[]):-!.


doall(X):-not(all_called).

all_called:-call(X) , fail.


generate_fixed_size(A,B,X,L):-  X>=L , permute_fixed(B,L,C) ,  findall(L ,superset(A,X,L,W,Z),D) , size_of(R,D)  ,S is R+1 , asserta(superset(A,X,L,S,C)).






factorial(N,M):- \=(N,0) , N1 is N-1 , factorial(N1,M1) , M is N*M1.
factorial(0,1):-!.


permutation(A,B,C):-factorial(A,N1) , D is A-B , factorial(D,N2) , Y is N1/N2 , C is integer(Y).

find_max_remainder(D,M,N,Max,N1):- permutation(M,D,C) , Y is N/C , (integer(Y)->Max is Y , N1 is C ;  floor_of(Y1,Y) , Max is Y1+1 , N1 is (N-(Y1*C))) ,!.


floor_of(Y1,Y):-N is integer(Y) , Y>=N , Y1 is N.
floor_of(Y1,Y):-N is integer(Y) , Y<N , Y1 is N-1.


renew_ref_index([A|B],X,Index,M,R) :- Y is X+1 , \=(M,Y) , ! ,  M1 is M+1 , (\=(M,Index)-> renew_ref_index(B,X,Index,M1,C) , =(R,[A|C]) ; renew_ref_index(B,X,Index,M1,R)).

renew_ref_index(A,X,Index,M,[]):- M is X+1 , !. 
