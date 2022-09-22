-module(cart).

-export([main/1]).

roundup(X) -> math:ceil(X * 100) / 100.

sum(List) -> roundup(lists:foldl(fun(Acc, X) -> Acc + X end, 0, List)).

main(_) ->
  Cart = [{pencil, 3, 0.40}, {pen, 1, 0.50}, {paper, 10, 0.20}],
  TaxedCart = [{I, Q, P, roundup(P * 1.19)} || {I, Q, P} <- Cart],
  Prices = [roundup(P * Q) || {_, Q, _, P} <- TaxedCart],
  Sum = sum(Prices),
  io:format("~p~n~p~nTotal: ~p~n", [TaxedCart, Prices, Sum]).
