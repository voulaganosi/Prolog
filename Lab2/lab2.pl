and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).

xor(0,0,0).
xor(0,1,1).
xor(1,0,1).
xor(1,1,0).

halfadder(A,B,C,S) :-
	and(A,B,C),
	xor(A,B,S).



fulladder(A,B,Cin,Cout,S) :-
	halfadder(A,B,C1,S1),
	halfadder(Cin, S1, C2, S),
	or(C1,C2,Cout).


bit(X2,X1,X0,Y2,Y1,Y0,Cin,S2,S1,S0,Cout) :-
						fulladder(X0,Y0,Cin,T0,S0),
						fulladder(X1,Y1,T0,T1,S1),
						fulladder(X2,Y2,T1,Cout,S2).