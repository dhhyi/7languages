-module(fibonacci).

-export([fib/1, main/1]).

fib(0) -> 1;
fib(1) -> 1;
fib(N) -> fib(N - 1) + fib(N - 2).

main(_) -> io:format("Fibonacci of 6 is ~p~n", [fib(6)]).
