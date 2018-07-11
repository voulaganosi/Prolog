region(r1, 2110, [1,2]).
region(r2, 2210, [4,5,8]).
region(r3, 2310, [3,6]).
region(r4, 2410, [7,10,11,15]).
region(r5, 2510, [9,12]).
region(r6, 2610, [13,14]).

next_to(1,2).
next_to(3,6).
next_to(4,5).
next_to(4,8).
next_to(5,9).
next_to(6,7).
next_to(7,10).
next_to(8,9).
next_to(9,12).
next_to(10,11).
next_to(10,15).
next_to(12,15).
next_to(13,14).

telephone(2310-6-64221, name(andriopoulos, nikos)).
telephone(2510-12-24234, name(papantoniou,kiki)).

next(X,Y) :-
	next_to(X,Y).

next(X,Y) :-
	next_to(Y,X).


path(X,Y,Path):-
	path(X,Y,[X],Path).


path(X,Y,_,[X,Y]):-
	connect(X,Y).

path(X,Y,Mem,[X|Path]):-
	not(connect(X,Y)),
	connect(X,Z),
	not(member(Z,Mem)),
	path(Z,Y,[Z|Mem],Path).


connect(X,Y) :-
	next(X,Y).


which_sector_area3(X-Area-_, Sector,Area) :-
	region(Sector,X,_).

same_sector(X,Y):-
	region(Sector,_,L),
	member(X,L),
	member(Y,L).


can_call(O1,O2,Route) :-
	telephone(_-X-_,name(O1,_)),
	telephone(_-Y-_,name(O2,_)),
	path(X,Y,Route).
	