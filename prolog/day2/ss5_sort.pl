% sorted(List, X).

min_in_list([Min],Min).

min_in_list([H,K|T],M) :-
    H =< K,
    min_in_list([H|T],M);
    H > K,
    min_in_list([K|T],M).

% https://stackoverflow.com/questions/60919189/prolog-remove-element-from-list

remover(_, [], []).
remover(R, [R|T], T2) :- remover(R, T, T2).
remover(R, [H|T], [H|T2]) :- H \= R, remover(R, T, T2).
% remove(_, [], []).
% remove(E, [H|T], T) :- E == H.

sorted([], []).
% sorted([A], [A]).

sorted(List, [H|Tail]) :-
    % write('at '), write(List), write(', '), write(H), write(', '), write(Tail), nl,
    min_in_list(List, H),
    % write('min in '), write(List), write(' is '), write(H), nl,
    remover(H, List, Remain),
    % write('split '), write(List), write(' is '), write(H), write(' and '), write(Remain), nl,
    sorted(Remain, Tail).

% sorted([1,3,2,5,4,0],X).
