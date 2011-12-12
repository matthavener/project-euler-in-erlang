-module(prob5).
-export([solve/0]).

gcd(A, 0) -> A;
gcd(A, B) -> gcd(B, A rem B).

lcm(A,B) -> round((A*B)/gcd(A,B)).

solve() ->
    lists:foldl(fun lcm/2, 1, lists:seq(1,20)).

