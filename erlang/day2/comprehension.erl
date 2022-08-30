-module(comprehension).

-export([start/0]).

start() ->
  List = lists:seq(1, 10),
  NewList = [X * X || X <- List, X < 5],
  io:format("~p~n~p~n", [List, NewList]).
