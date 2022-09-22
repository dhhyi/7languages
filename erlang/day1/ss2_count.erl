-module(ss2_count).

-export([main/1]).

counttoten(10) -> io:format("10~n");
counttoten(N) ->
  if N < 10 ->
       io:format("~w ", [N]),
       counttoten(N + 1)
  end.

main(_) -> counttoten(-100).
