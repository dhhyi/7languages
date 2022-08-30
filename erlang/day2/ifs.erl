-module(ifs).

-export([start/0]).

start() ->
  {ok, [X]} = io:fread("Enter a number: ", "~d"),

  if X > 0 -> io:format("X is greater than 0~n");
     X < 0 -> io:format("X is less than 0~n");
     true -> io:format("X is 0~n")
  end.
