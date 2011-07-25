member_of(X,[X|_]):-!.
member_of(X,[Y|Z]):- =(Z,[]) , member_of(X,Z) , =(X,Y).
