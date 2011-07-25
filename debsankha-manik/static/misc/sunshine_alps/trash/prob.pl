generate(A,[X|M]):-member(X,A) , delete(A,X,A1) , generate(A1,M).
generate(A,[]).
