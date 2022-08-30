-module(cases).

-export([start/0]).

start() ->
    Animal = fox,
    case Animal of
        dog -> io:format("Woof~n");
        cat -> io:format("Meow~n");
        _ -> io:format("What?~n")
    end.
