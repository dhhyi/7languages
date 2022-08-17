cat(lion).
cat(tiger).

dorothy(X, Y, Z) :- X = lion, Y = tiger, Z = bear.

twin_cats(X, Y) :- cat(X), cat(Y).

% twin_cats(X, Y) :- cat(X), cat(Y), X \= Y.

% twin_cats(A, B).