fact(1,1).
fact(N,Y) :-
	Í>1,
	N1 is N-1,
	fact(N1,Y1),
	Y is Y1*N.


natural(0).
natural(X) :-
	X>0, 
	X1 is X-1,
	natural(X1).


power(X,0,1).
power(X,N,P) :-
	N1 is N-1,
	N>0,
	power(X,N1,P1),
	P is P1*X.


fibo(2,1).
fibo(1,1).
fibo(N,Y) :-
	N>0,
	N1 is N-1,
	N2 is N-2,
	fibo(N1,Y1),
	fibo(N2,Y2),
	Y is Y1 + Y2.



mkd(N,0,N).
mkd(N,M,D) :-
	N<M,
	mkd(M,N,D).

mkd(N,M,D) :-
	M>0,
	N>=M,
	D1 is mod(N,M), 
	mkd(M,D1,D).



run :-
	write('Dwse ton arithmo A '),
	read(A),
	nl,
	write('Dwse ton arithmo B'),
	read(B),
	nl,
	write('I dinami A^B einai '),
	power(A,B,P), write(P),
	nl,
	write('fibonacci(A) = '), 
	fibo(A,X), write(X),
	nl,
	write('O megistos koinos diaireths A, B einai '),
	mkd(A,B,S), write(S).
	

