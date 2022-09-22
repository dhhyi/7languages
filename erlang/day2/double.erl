-module(double).

-export([main/1]).

double([]) -> [];
double([H | T]) -> [H + H | double(T)].

main(_) ->
  List = [1, 2, 3, 4, 5],
  io:format("~p~n", [double(List)]).
