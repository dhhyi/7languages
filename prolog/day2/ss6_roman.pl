% roman(List, Sum)

roman([i], 1).
roman([v], 5).
roman([x], 10).
roman([l], 50).
roman([c], 100).
roman([d], 500).
roman([m], 1000).

roman([X|[Y|T]], Sum) :-
    T \= [],
    roman([X], Xv),
    roman([Y], Yv),
    Yv > Xv,
    roman(T, S2),
    Sum is Yv - Xv + S2.

roman([X|T], Sum) :-
    T \= [],
    roman([X], S1),
    roman(T, S2),
    Sum is S1 + S2.

% roman([c,x,l,i,i],X).
% roman([m,m,x,x,i,i],X).
% roman([m,c,m,l,x,x,x,v],X).
