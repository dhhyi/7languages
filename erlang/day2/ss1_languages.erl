-module(ss1_languages).

-export([start/0]).

languages() ->
  [{erlang, "A functional language"},
   {prolog, "A logic language"},
   {haskell, "A functional language"},
   {ruby, "An OO language"},
   {python, "A dynamic language"}].

find(Lang) ->
  case lists:keyfind(Lang, 1, languages()) of
    {Lang, Desc} -> Desc;
    _ -> "Not found"
  end.

start() ->
  Key = erlang,
  io:format("~p: ~p~n", [Key, find(Key)]).
