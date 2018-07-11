word([p,s,a,r,i], oudetero).
word([g,a,t,a], thiliko).
word([s,k,i,l,o,s], arseniko).
word([a,n,a,t,a,s,i], thiliko).



check2(X,[X|[X|Tail]]).

check2(X,[Head|Tail]) :-
	check2(X,Tail).


sumcheck([X|[Y|Tail]]) :-
	X + Y =:= 100.

sumcheck([Head|Tail]) :-
	sumcheck(Tail).


checkonly2(X,[X|Tail]) :-
	member(X,Tail).

checkonly2(X,[Head|Tail]) :-
	checkonly2(X,Tail).

only2(X,L) :-
	delete(L,X,L1),
	delete(L1,X,L2),
	not(member(X,L2)).


dups_out([X|T],[X|NT]) :-
	not(member(X,T)),
	dups_out(T,NT).

dups_out([X|T],NT) :-
	member(X,T),
	dups_out(T,NT).

dups_out([X],[X]).



memberlist(X,[H|T]) :-
	member(X,H).

memberlist(X,[H|T]) :-
	memberlist(X,T).


a6(L1,L2) :-
	member(word(_,thiliko),L1),
	member([t,a],word([L],_)),
	append(word(_,_),[],L2).


process([],[]).

process([H|T], [H|NT]) :-
	thelw(H),
	process(T,NT).

process([H|T],NT) :-
	not(thelw(H)),
	process(T,NT).

thelw(X) :-
	word(X,thiliko),
	append(_,[t,a|_],X).