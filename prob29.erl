-module(prob29).
-export([solve/0]).

solve() ->
    lists:usort([ trunc(math:pow(A,B)) || 
                A <- lists:seq(2,100), 
                B <- lists:seq(2,100) ]).

