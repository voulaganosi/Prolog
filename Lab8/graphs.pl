next_to(a,b).
next_to(a,c).
next_to(a,f).
next_to(b,c).
next_to(b,d).
next_to(b,e).
next_to(c,d).
next_to(d,e).
next_to(d,f). 

next(X,Y) :-
	next_to(X,Y).

next(X,Y) :-
	next_to(Y,X). 

link(a,b,3).
link(a,c,4).
link(a,f,1).
link(b,c,5).
link(b,d,3).
link(b,e,2).
link(c,d,2).
link(d,e,1).
link(d,f,5). 


existspath(X,Y) :-
	next_to(X,Y).
existspath(X,Y) :-
	next_to(X,Z),
	existspath(Z,Y). 


path(X,Y,[X,Y]) :-
	next(X,Y).

path(X,Y,[X|L]) :-
	next(X,Z),
	path(Z,Y,L).
	

pathlength(X,Y,[X,Y],1) :-
	next(X,Y).

pathlength(X,Y,[X|Path],Length) :-	
	next(X,Z),
	pathlength(Z,Y,Path,LengthN),
	Length is LengthN+1.

pathcost(X,Y,[X,Y],Cost) :-
	next(X,Y),
	link(X,Y,Cost).

pathcost(X,Y,[X|Path],Cost) :-
	next(X,Z),
	link(X,Z,A),
	pathcost(Z,Y,Path,CostN),
	Cost is CostN + A.



pathloop(X,Y,V,[X|L]):-
	next_to(X,Z),
	pathloop(Z,Y,[X|V],L),
	not(member(Z,V)).
	
pathloop(X,Y,V,[X,Y]):-
	next_to(X,Y).