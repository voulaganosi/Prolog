region(r1, 2110, [1,2]).
region(r2, 2210, [4,5,8]).
region(r3, 2310, [3,6]).
region(r4, 2410, [7,10,11,15]).
region(r5, 2510, [9,12]).
region(r6, 2610, [13,14]).

telephone(2310-6-64221,name(andriopoulos, nikos)).
telephone(2510-12-24234,name(papantoniou,kiki)).

next_to(2,1).
next_to(1,4).
next_to(4,5).
next_to(4,8).
next_to(5,8).
next_to(5,9).
next_to(8,9).
next_to(5,3).
next_to(3,6).
next_to(6,7).
next_to(9,12).
next_to(12,15).
next_to(15,10).
next_to(10,11).
next_to(7,10).
next_to(13,14).

next(X,Y) :-
	next_to(X,Y).
next(X,Y) :-
	next_to(Y,X). 

path(X,Y,[X,Y]):-
	next(X,Y).
path(X,Y,[X|Path]):-
	next(X,Z),
	
	path(Z,Y,Path),
	Z\=Y.

pathloop(X,Y,V,[X|L]):-
	next_to(X,Z),
	pathloop(Z,Y,[X|V],L),
	not(member(Z,V)).
	
pathloop(X,Y,V,[X,Y]):-
	next_to(X,Y).
	

which_sector_area(T-E-L,SECTOR,E):-
	telephone(T-E-L,_),
	
	region(SECTOR,T,X),
	member(E,X).

same_sector(X,Y):-
	region(_,_,L),
	member(X,L),
	member(Y,L).

can_call(X,Y,ROUTE):-
	telephone(_-E-_,name(X,_)),
	telephone(_-V-_,name(Y,_)),
	pathloop(E,V,[],ROUTE).
	

can_call2(X,Y,R,P):-
	telephone(A-B-C,name(X,D)),
	telephone(E-F-G,name(Y,H)),
	pathloop2(B,F,[],R,P).


pathloop2(X,Y,L,[X|L2],P):-
	next(X,Z),
	same_sector(X,Z),
	X \= Z,
	X \= Y,
	not(member(Z,L)),
	pathloop2(Z,Y,[X|L],L2,P).

pathloop2(X,Y,L,[X|L2],P):-
	next(X,Z),
	not(same_sector(X,Z)),
	X \= Z,
	X \= Y,
	not(member(Z,L)),
	pathloop2(Z,Y,[X|L],L2,P1),
	P is P1+1.

pathloop2(X,Y,L,[X,Y],0):-
	X \= Y,
	next(X,Y),
	same_sector(X,Y),
	not(member(Y,L)).

pathloop2(X,Y,L,[X,Y],1):-
	X \= Y,
	next(X,Y),
	not(same_sector(X,Y)),
	not(member(Y,L)).





ateitalk:-
	write('Wellcome to ATEITALK.'),
	nl,
	write('Choose one of the following operations: '),
	nl,
	write('1. Verify Connection of 2 Areas. '),
	nl,
	write('2. Find Sector and Area of a Telephone Number. '),
	nl,
	write('3. Find Route and Cost of a specific call. '),
	nl,
	write('4. Exit. '),
	nl,
	write('Choice -> '),
	read(A),
	nl,
	creator(A).

creator(2):-
	write('Give telephone Number :'),
	read(B),
	nl,
	which_sector_area(B,Sector,Area),
	write('Sector : '),
	write(Sector),
	nl,
	write('Area   : '),
	write(Area).

creator(3):-
	write('Give First Name :'),
	read(B),
	nl,
	write('Give Second Name :'),
	read(C),
	nl,
	can_call2(B,C,Path,Cost),
	write('Path : '),
	write(Path),
	nl,
	write('Cost : '),
	write(Cost).


creator(1):-
	write('Give First Area :'),
	read(B),
	nl,
	write('Give Second Area :'),
	read(C),
	nl,
	next(B,C).
