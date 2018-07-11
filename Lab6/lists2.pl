append([], L, L).
append([H|L1], L2, [H|L3]) :-
	append(L1,L2,L3).


reverse([],[]).
reverse([H|T],L) :-
	reverse(T,L1),
	append(L1,[H],L).


melos(X,[X|Tail]).
melos(X,[Head|Tail]) :-
	melos(X,Tail).


posneg([],[],[]).
posneg([H|T],LP,LN):-
	H>0,
	posneg(T,LPT,LNT),
	append([H],LPT,LP),
	LN = LNT.

posneg([H|T],LP,LN):-
	H<0,
	posneg(T,LPT,LNT),
	append([H],LNT,LN),
	LP = LPT.


sumlist([], 0).
sumlist([Head|Tail], X) :-
	sumlist(Tail,XTail),
	length(Head, XHead),
	X is XHead + XTail.
	

enwsh([],L,L).
enwsh([Head|Tail],L,Lout) :-
	enwsh(Tail,L,LoutT),
	not(member(Head,LoutT)),
	append([Head],LoutT,Lout).


enwsh([Head|Tail],L,Lout) :-
	enwsh(Tail,L,LoutT),
	member(Head,LoutT),
	LoutT = Lout.


flat([],[]).
flat([Head|Tail],Flat) :-
	flat(Tail,FlatT),
	atomic(Head),
	append([Head],FlatT,Flat).
	

flat([Head|Tail],Flat) :-
	flat(Tail,FlatT),
	not(atomic(Head)),
	flat(Head,FlatH),
	append(FlatH,FlatT,Flat).
	
	
