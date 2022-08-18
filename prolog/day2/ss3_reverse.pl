rev([], []).
rev([H|T], R) :- rev(T, R1), append(R1, [H], R).
