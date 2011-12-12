-module(prob24).
-export([perms/1]).

perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])].

solve() ->
    lists:nth(1000000, perms("0123456789")).
