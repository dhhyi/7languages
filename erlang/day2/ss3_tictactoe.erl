-module(ss3_tictactoe).

-export([start/0]).

dump(Board) -> io:format("~p ~p ~p~n~p ~p ~p~n~p ~p ~p~n", Board).

allfilled(Board) -> lists:all(fun(X) -> (X == x) or (X == o) end, Board).

tictactoe([X, _, _, X, _, _, X, _, _]) -> X;
tictactoe([_, X, _, _, X, _, _, X, _]) -> X;
tictactoe([_, _, X, _, _, X, _, _, X]) -> X;
tictactoe([X, X, X, _, _, _, _, _, _]) -> X;
tictactoe([_, _, _, X, X, X, _, _, _]) -> X;
tictactoe([_, _, _, _, _, _, X, X, X]) -> X;
tictactoe([X, _, _, _, X, _, _, _, X]) -> X;
tictactoe([_, _, X, _, X, _, X, _, _]) -> X;
tictactoe(Board) ->
  case allfilled(Board) of
    true -> draw;
    false -> undecided
  end.

start() ->
  Board = [o, x, o, x, x, o, o, o, 0],
  dump(Board),
  io:format("Winner is: ~p~n", [tictactoe(Board)]).
