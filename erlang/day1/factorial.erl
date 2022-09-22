-module(factorial).

-export([factorial/1, main/1]).

factorial(0) -> 1;
factorial(N) -> N * factorial(N - 1).

main(_) -> io:format("Factorial of 5 is ~p~n", [factorial(5)]).
