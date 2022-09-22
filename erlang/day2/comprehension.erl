-module(comprehension).

-export([main/1]).

main(_) ->
  List = lists:seq(1, 10),
  NewList = [X * X || X <- List, X < 5],
  io:format("~p~n~p~n", [List, NewList]).
