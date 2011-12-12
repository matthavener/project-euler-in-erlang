-module(prob21).
-export([solve/0]).

sum_divisors(N, N, Acc) ->
    Acc;
sum_divisors(N, Div, Acc) when (N rem Div) == 0 ->
    sum_divisors(N, Div+1, Acc+Div);
sum_divisors(N, Div, Acc) ->
    sum_divisors(N, Div+1, Acc).

sum_divisors(N) ->
    sum_divisors(N, 1, 0).

is_pair(X, Y, LT) ->
    (element(X, LT) == Y) and (element(Y, LT) == X) and (X =/= Y).

solve() ->
    LD = [ sum_divisors(N) || N <- lists:seq(1,10000) ],
    LT = list_to_tuple(LD),
    lists:sum([ X+Y || X <- lists:seq(1,10000), Y <- lists:seq(1,X),
            is_pair(X,Y,LT) ]).
