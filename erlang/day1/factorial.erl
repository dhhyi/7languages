-module(factorial).

-export([factorial/1, start/0]).

factorial(0) -> 1;
factorial(N) -> N * factorial(N - 1).

start() -> io:format("Factorial of 5 is ~p~n", [factorial(5)]).
