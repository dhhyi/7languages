-module(cases).

-export([main/1]).

main(_) ->
  Animal = fox,
  case Animal of
    dog -> io:format("Woof~n");
    cat -> io:format("Meow~n");
    _ -> io:format("What?~n")
  end.
