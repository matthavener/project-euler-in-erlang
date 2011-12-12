-module(prob48).
-export([solve/0, pow_mod/4]).

pow_mod(N, 0, _, _) ->
    N;
pow_mod(N, Acc, Num, Mod) -> 
    pow_mod((N*Num) rem Mod, Acc-1, Num, Mod).

solve() ->
    Mod = 10000000000,
    L = [ pow_mod(1, N, N, Mod) || N <- lists:seq(2,1000) ],
    N = lists:sum(L) + 1, 
    {L, N, N rem Mod}.

