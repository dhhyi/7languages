% https://stackoverflow.com/questions/3965054/prolog-find-minimum-in-a-list

list_min([L|Ls], Min) :-
    list_min(Ls, L, Min).

list_min([], Min, Min).
list_min([L|Ls], Min0, Min) :-
    Min1 is min(L, Min0),
    list_min(Ls, Min1, Min).


min_in_list([Min],Min).                 % We've found the minimum

min_in_list([H,K|T],M) :-
    H =< K,                             % H is less than or equal to K
    write('Direction '), write(H), write(' =< '), write(K), nl,
    min_in_list([H|T],M);               % so use H
    H > K,                              % H is greater than K
    write('Direction '), write(H), write(' > '), write(K), nl,
    min_in_list([K|T],M).               % so use K

% min_in_list([3,4,2,1,5,6],W).
