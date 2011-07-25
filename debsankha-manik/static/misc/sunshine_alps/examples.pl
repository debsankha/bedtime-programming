:-dynamic(true/1).

/*permutation*/

/*true([[a,c,b,d],[a,b,c,d]]).
true([[e,b,d,c],[e,b,c,d]]).
true([[c,b,a],[a,b,c]]).
true([[b,c,a],[a,b,c]]).
true([[b,c,g,h],[h,g,c,b]]).
true([[a,b,c],[b,a,c]]).*/

/*subset*/

/*true([[a,b,c],[a,b,c]]).
true([[a,b],[a,b,c]]).
true([[b,c],[a,b,c]]).
true([[a,c],[a,b,c]]).
true([[a],[a,b,c]]).
true([[b],[a,b,c]]).
true([[c],[a,b,c]]).
true([[a,b],[a,b]]).
true([[a],[a,b]]).
true([[b],[a,b]]).*/


/*third element*/

/*true([c,[a,b,c,d]]).
true([c,[a,b,c,d]]).
true([f,[c,e,f]]).
true([a,[b,d,a]]).*/

/*member*/

/*true([a,[a,b,c]]).
true([b,[a,b,c]]).
true([c,[a,b,c]]).
true([c,[a,b,c,d]]).
true([a,[a,b,c,d]]).
true([b,[a,b,c,d]]).*/

/*first*/

/*true([a,[a,m,n]]).
true([b,[b,k,l]]).
true([e,[e,f]]).
true([f,[f,l]]).*/

/*last*/

/*true([a,[b,n,m,a]]).
true([k,[k,m,l,k]]).
true([a,[o,a]]).
true([y,[f,y]]).*/



/*true([[a,b],[c,b,a]]).
true([[e,f],[e,f,g]]).
true([[a,b,c],[b,c,d,a]]).
true([[a,m,n],[n,j,m,a]]).
true([[b,a],[c,b,a]]).
true([[a,b,c],[b,a,c,l]]).
true([[e,f],[e,a,b]]).
true([[a,b,c],[e,b,c,a]]).*/

/*first element of first list is the same as last element of the second list. The lists are of the same size*/

/*true([[a,b,m],[c,f,a]]).
true([[d,h,k],[f,s,d]]).
true([[e,f,s,g],[a,d,s,e]]).
true([[d,s,a,e],[g,h,k,d]]).*/


/*true([[a,m,n],[n,m,a]]).
true([[b,c,d],[d,c,b]]).
true([[a,b,c],[c,b,a]]).
true([[a,b,c,d],[d,c,b,a]]).
true([[q,w,e,r],[r,e,w,q]]).*/

/*true([[n,m,a],[n,m,a]]).
true([[d,c,b],[d,c,b]]).
true([[c,b,a],[c,b,a]]).
true([[d,c,b,a],[d,c,b,a]]).
true([[r,e,q,w],[r,e,q,w]]).*/


/*true([[a,b],[a,b,c]]).
true([[a,b],[a,k,l]]).
true([[a,c],[k,v,c]]).
true([[a,c],[k,v,d,c]]).
true([[a,c],[a,x,c,f]]).
true([[e,a],[c,d,f,e]]).
true([[a,c,d],[a,f,c,j]]).
true([[a,f,g],[w,e,r,f]]).
true([[a,b,c],[b,c,d,a]]).*/


/*delete*/

/*true([[a,b],[a,b,c]]).
true([[a,c],[a,b,c]]).
true([[b,c],[a,b,c]]).
true([[a,b,c],[a,b,c,d]]).
true([[a,b,d],[a,b,c,d]]).
true([[a,c,d],[a,b,c,d]]).
true([[b,c,d],[a,b,c,d]]).*/


/*tail_permuted*/

true([[b,c,d],[a,b,c,d]]).
true([[c,d,e],[b,c,d,e]]).
true([[b,c,d,e],[a,b,c,d,e]]).
true([[c,d,e,f],[b,c,d,e,f]]).



