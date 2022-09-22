-module(translate_sync).

-export([main/1]).

loop() ->
  receive
    {Sender, "casa"} -> Sender ! "house";
    {Sender, "blanca"} -> Sender ! "white";
    {Sender, "hola"} -> Sender ! "hello";
    {Sender, _} -> Sender ! "unknown"
  end,
  loop().

translate(To, Word) ->
  To ! {self(), Word},
  receive
    T ->
      io:format("Got translation ~p for ~p.~n", [T, Word]),
      T
  end.

main(_) ->
  Tranlator = spawn(fun loop/0),
  translate(Tranlator, "casa"),
  Tr = translate(Tranlator, "blanca"),
  translate(Tranlator, "nada"),
  translate(Tranlator, "hola"),
  io:format("saved: ~p~n", [Tr]).
