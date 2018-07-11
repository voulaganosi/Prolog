word([h,e,l,l,o]).
word([m,a,n]).
word([w,o,m,a,n]).
word([b,o,o,k]).
word([m,o,t,h,e,r]).
word([c,o,m,p,u,t,e,r]).
word([c,a,r]).
word([p,r,o,l,o,g]).
word([p,e,n,c,i,l]).
word([t,a,b,l,e]).


changeletter(Word,CorrectWord) :-
	append(Begin,[Letter|End],Word),
	word(CorrectWord),
	append(Begin,[Letter1|End],CorrectWord),
	Letter1\= Letter.


swapletters(Word, CorrectWord) :-
	append(Begin,[Letter1,Letter2|End],Word),
	word(CorrectWord),
	append(Begin,[Letter2,Letter1|End],CorrectWord).

exchangeletters(Word, CorrectWord) :-
	append(Begin,[Letter1|End1],Word),
	append(NBegin,[Letter2|End],End1),
	word(CorrectWord),
	append(Begin,[Letter2|NBegin],Correct1),
	append(Correct1,[Letter1|End],CorrectWord).


delete2(Word,CorrectWord) :-
	append(Begin,[Letter1|End1],Word),
	append(NBegin,[Letter2|End],End1),
	word(CorrectWord),
	append(Begin,NBegin,Correct1),
	append(Correct1,End,CorrectWord).

movefront(Word,CorrectWord) :-
	append(Begin,[L|End],Word),
	append(B1,B2,Begin),
	word(CorrectWord),
	append(B1,[L|B2],B3),
	append(B3,End,CorrectWord).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
correct(W,CW):- changeletter(W,CW), write(changeletter).  
correct(W,CW,changeletter):- changeletter(W,CW).  
correct(W,CW,changeletter):- changeletter(W,CW).  
correct(W,CW,changeletter):- changeletter(W,CW).  
correct(W,CW,changeletter):- changeletter(W,CW).  
correct(W,CW,changeletter):- changeletter(W,CW).  
correct(W,CW,dontknow).       

sp([]).
sp([X|Y]) :-
	correct(W,CW).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    