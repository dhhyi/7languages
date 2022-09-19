% backpack(Items, Backpack, Limit)
backpack(Items, Backpack, Limit) :-
    sublist(Perm, Items),
    append(Backpack, Remain, Perm),
    Backpack \= [],
    sum_list(Backpack, BackpackSum),
    sum_list(Remain, RemainSum),
    Space is Limit - BackpackSum,
    BackpackSum =< Limit,
    min_list(Remain, Min),
    Space =< Min,
    nl, write(Backpack), write(' items with remaining space '), write(Space).
