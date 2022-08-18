father(a, b).
father(b, c).

ancestor(X, Y) :- father(X, Y).
ancestor(X, Y) :- father(X, Z), ancestor(Z, Y).
