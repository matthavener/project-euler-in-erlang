-module(prob36).
-export([solve/0, is_num/1]).

is_num(X) ->
    (X == list_to_integer(lists:reverse(integer_to_list(X)))) and
    (X == erlang:list_to_integer(lists:reverse(erlang:integer_to_list(X,2)),2)).

solve() ->
    lists:sum([ X || X <- lists:seq(1,999999), is_num(X) ]).

