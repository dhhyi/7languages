% sorted(List, X).

% min_in_list/2 (List, Min)
min_in_list([Min],Min).
min_in_list([H,K|T],M) :-
    H =< K,
    min_in_list([H|T],M);
    H > K,
    min_in_list([K|T],M).

% https://stackoverflow.com/questions/60919189/prolog-remove-element-from-list

% remove_one/3 (Element, InputList, OutputList)
remove_one(_, [], []).
remove_one(R, [R|T], T).
remove_one(R, [H|T], [H|T2]) :- H \= R, remove_one(R, T, T2).

% sorted/2 (UnsortedList, SortedList)
sorted([], []).
sorted(List, [H|Tail]) :-
    % write('at '), write(List), write(', '), write(H), write(', '), write(Tail), nl,
    min_in_list(List, H),
    % write('min in '), write(List), write(' is '), write(H), nl,
    remove_one(H, List, Remain),
    % write('split '), write(List), write(' is '), write(H), write(' and '), write(Remain), nl,
    sorted(Remain, Tail).

% sorted([1,3,2,5,4,0],X).
