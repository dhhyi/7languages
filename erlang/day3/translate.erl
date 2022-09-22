-module(translate).

-export([main/1]).

loop() ->
  receive
    "casa" -> io:format("house\n");
    "blanca" -> io:format("white\n");
    "hola" -> io:format("hello\n");
    _ -> io:format("unknown\n")
  end,
  loop().

main(_) ->
  Pid = spawn(fun loop/0),
  Pid ! "casa",
  Pid ! "blanca",
  Pid ! "nada",
  Pid ! "hola".
