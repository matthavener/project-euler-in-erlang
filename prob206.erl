-module(prob206).
-export([solve/0]).

solve(Cur, [$1,_,$2,_,$3,_,$4,_,$5,_,$6,_,$7,_,$8,_,$9,_,$0]) ->
    Cur;
solve(Cur, _) ->
    N = Cur+10,
    solve(N, integer_to_list(N*N)).

solve() ->
    solve(trunc(math:sqrt(1020304050607080900)), none).

