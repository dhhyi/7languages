-module(ss3_message).

-export([message/1, main/1]).

message(success) -> io:format("Success~n");
message({error, Message}) -> io:format("error: ~s~n", [Message]).

main(_) ->
  message(success),
  message({error, "Something went wrong"}).
