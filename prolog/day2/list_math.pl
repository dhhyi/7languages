count(0, []).
count(Count, [H|T]) :- count(TailCount, T), Count is TailCount + 1.

sum(0, []).
sum(Sum, [H|T]) :- sum(TailSum, T), Sum is TailSum + H.

average(Average, List) :- sum(Sum, List), count(Count, List), Average is Sum / Count.
