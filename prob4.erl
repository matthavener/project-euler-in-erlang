-module(prob4).
-export([solve/0]).

is_palin(N) ->
    {R, []} = string:to_integer(lists:reverse(integer_to_list(N))),
    N == R.

solve() ->
    lists:max([ X*Y || X <- lists:seq(99, 999), Y <- lists:seq(99, X), is_palin(X*Y) ]).


