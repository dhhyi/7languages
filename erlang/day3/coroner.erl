-module(coroner).

-export([loop/0]).

loop() ->
  process_flag(trap_exit, true),
  receive
    {monitor, Process} ->
      link(Process),
      io:format("monitoring process ~p\n", [Process]),
      loop();
    {'EXIT', From, Reason} ->
      io:format("process ~p exited with reason ~p\n", [From, Reason]),
      loop()
  end.
