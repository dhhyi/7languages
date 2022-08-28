-module(ss2_count).
-export([counttoten/1]).

counttoten(10) ->
    10;
counttoten(N) ->
    io:format("~w ", [N]),
    N1 = N + 1,
    counttoten(N1).
