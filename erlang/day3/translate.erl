-module(translate).

-export([start/0]).

loop() ->
  receive
    "casa" -> io:format("house\n");
    "blanca" -> io:format("white\n");
    "hola" -> io:format("hello\n");
    _ -> io:format("unknown\n")
  end,
  loop().

start() ->
  Pid = spawn(fun loop/0),
  Pid ! "casa",
  Pid ! "blanca",
  Pid ! "nada",
  Pid ! "hola".
