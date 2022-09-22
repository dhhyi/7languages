-module(ss1_splitstring).

-export([countwords/1, main/1]).

% countwords(String) -> length(string:split(String, " ", all)).

countwords([]) -> 0;
countwords([String]) ->
  [_ | T] = string:split(String, " "),
  countwords(T) + 1;
countwords(String) -> countwords([String]).

main(_) ->
  io:format("Number of words in \"Hello, world!\" is ~p~n", [countwords("Hello, world!")]).
