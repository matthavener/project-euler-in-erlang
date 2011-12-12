-module(prob20).
-export([solve/0]).

fact(0, Acc) -> Acc;
fact(N, Acc) -> fact(N-1, Acc*N).
fact(N) -> fact(N, 1).

solve() ->
    lists:sum([ X-$0 || X <- integer_to_list(fact(100)) ]).


