-module(ss3_message).

-export([message/1]).

message(success) -> io:format("Success~n");
message({error, Message}) -> io:format("error: ~s~n", [Message]).
