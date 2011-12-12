-module(prob30).
-export([solve/0]).

is_num(X, Pow) -> 
    lists:sum([ math:pow(N-$0, Pow) || N <- integer_to_list(X) ]) == X.


solve() ->
    lists:sum([ X || X <- lists:seq(2, 10000000), is_num(X, 5) ]).
