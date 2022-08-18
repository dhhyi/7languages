con([], List, List).
con([H|T], List, [H|Con]) :- con(T, List, Con).

