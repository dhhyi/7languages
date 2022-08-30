-module(ss2_count).

-export([start/0]).

counttoten(10) -> io:format("10~n");
counttoten(N) ->
  if N < 10 ->
       io:format("~w ", [N]),
       counttoten(N + 1)
  end.

start() -> counttoten(-100).
