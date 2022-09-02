-module(doctor).

-export([loop/0]).

loop() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("creating new gun\n"),
      register(revolver, spawn_link(fun() -> roulette:roulette(3) end)),
      loop();
    {'EXIT', From, Reason} ->
      io:format("process ~p exited with reason ~p\n", [From, Reason]),
      self() ! new,
      loop()
  end.
