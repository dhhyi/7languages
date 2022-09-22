-module(roulette).

-export([main/1, roulette/1]).

roulette(Bullet) ->
  receive
    Bullet ->
      io:format("BANG!~n"),
      exit({roulette, die, at, erlang:time()});
    _ -> io:format("click~n")
  end,
  roulette(Bullet).

main(_) ->
  Rand = round(rand:uniform() * 5 + 1),
  Pistol = spawn(fun() -> roulette(Rand) end),
  Pistol ! 1,
  Pistol ! 2,
  Pistol ! 3,
  Pistol ! 4,
  Pistol ! 5,
  Pistol ! 6.
