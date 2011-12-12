-module(prob2).
-export([solve/0]).

fib(L = [H|_], Max) when H > Max ->
   L; 
fib(L = [B,A|_], Max) ->
    fib([A+B|L], Max).

fib(N) ->
   fib([2,1],N). 

solve() ->
    lists:sum([ X || X <- fib(4000000), X rem 2 == 0 ]).
