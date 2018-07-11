melos(X,[X|Tail]).
melos(X,[Head|Tail]) :-
	melos(X,Tail).

sum([], 0).

sum([Head|Tail], X) :-
	sum(Tail,X1),
	X is X1+Head.


teleytaio([X], X).

teleytaio([H|T],X) :-
	teleytaio(T,X).

element([X|T],1,X).

element([H|T],N,X) :-
	N1 is N-1,
	element(T,N1,X).

max([],0).
max([Head|Tail], X) :-
	max(Tail,X),
	X > Head.

max([Head|Tail], Head) :-
	max(Tail,X),
	X < Head.
	
	
del(H,[H|T],T).


del(X,[H|T],[H|NL]) :-
	del(X,T,NL).


delall(H,[],[]).

delall(H,[H|T],L) :-
	delall(H,T,L).
	

delall(X,[H|T],[H|L]) :-
	X \= H,
	delall(X,T,L).