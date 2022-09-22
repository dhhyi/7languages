-module(listfunctions).

-export([main/1]).

l() -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].

% main(_) ->
%   Print = fun(X) -> io:format("~p~n", [X]) end,
%   lists:foreach(Print, l()).

% main(_) ->
%   Print = fun(X) -> io:format("~p~n", [X]) end,
%   List = lists:map(fun(X) -> X * X end, l()),
%   lists:foreach(Print, List).

% main(_) ->
%   Print = fun(X) -> io:format("~p~n", [X]) end,
%   Small = fun(X) -> X < 5 end,
%   List = lists:filter(Small, l()),
%   lists:foreach(Print, List).

main(_) ->
  io:format("~p~n", [l()]),
  Adder = fun(X, Acc) -> X + Acc end,
  Sum = lists:foldl(Adder, 0, l()),
  io:format("Sum is ~p~n", [Sum]).
