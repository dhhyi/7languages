-module(double).

-export([start/0]).

double([]) -> [];
double([H | T]) -> [H + H | double(T)].

start() ->
  List = [1, 2, 3, 4, 5],
  io:format("~p~n", [double(List)]).
