-module(ss3_message).

-export([message/1, start/0]).

message(success) -> io:format("Success~n");
message({error, Message}) -> io:format("error: ~s~n", [Message]).

start() ->
  message(success),
  message({error, "Something went wrong"}).
