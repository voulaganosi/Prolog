parent(cronus,hestia).
parent(cronus,hades).
parent(cronus,poseidon).
parent(cronus,zeus).
parent(cronus,demeter).
parent(rhea,hestia).
parent(rhea,hades).
parent(rhea,poseidon).
parent(rhea,zeus).
parent(rhea,demeter).
parent(zeus,athena).
parent(zeus,ares).
parent(zeus,hebe).
parent(zeus,hephaestus).
parent(zeus,persephone).
parent(hera,athena).
parent(hera,ares).
parent(hera,hebe).
parent(hera,hephaestus).
parent(demeter,persephone).
male(cronus).
male(hades).
male(poseidon).
male(zeus).
male(ares).
male(hephastus).
female(rhea).
female(hestia).
female(hera).
female(demeter).
female(persephone).
female(athena).
female(hebe).


son(X,Y) :-
	male(X),
	parent(Y,X).


father(X,Y) :-
	male(X),
	parent(X,Y).

mother(X,Y) :-
	female(X),
	parent(X,Y).


daughter(X,Y) :-
	female(X),
	parent(Y,X).


grandfather(X,Z) :-
	male(X),
	parent(X,Y),
	parent(Y,Z).


grandmother(X,Z) :-
	female(X),
	parent(X,Y),
	parent(Y,Z).



brother(X,Y) :-
	male(X),
	parent(Z,X),
	parent(Z,Y),
	X\=Y.


sister(X,Y) :-
	female(X),
	parent(Z,Y),
	parent(Z,X),
	X\=Y.

brothers(X,Y) :-
	brother(X,Y).

brothers(X,Y) :-
	sister(X,Y).


aunt(X,Y) :-
	female(X),
	parent(Z,Y),
	brothers(Z,X).	


uncle(X,Y) :-
	male(X),
	parent(Z,Y),
	brothers(Z,X).