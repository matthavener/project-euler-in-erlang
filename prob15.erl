-module(prob15).
-export([solve/1]).

matrix_get(X, Y, M) when (X > 0) and (X =< 20) and (Y > 0) and (Y =< 20) ->
    element(X + (Y-1)*20, M);
matrix_get(_,_,M) -> M.

matrix_set(X, Y, NewVal, M) when (X > 0) and (X =< 20) and (Y > 0) and (Y =< 20) ->
    setelement(X + (Y-1)*20, M, NewVal);
matrix_get(_,_,_,_) -> 0.

% need to go forwards here
reduce
reduce(M, 0, Y, Max) -> 
    reduce(M, Max, Y).
reduce(M, X, Y, Max) ->
    V = matrix_get(X, Y, M),
    M1 = matrix_set(X+1, Y, M, matrix_get(X+1, Y, M)),
    M2 = matrix_set(X, Y+1, M1, matrix_get(X, Y+1, M1)),
    reduce(M2, X-1, Y, Max).


solve(0, M) -> M;
solve(Countdown, M) ->
    solve(Countdown, reduce(M, N, N, N)).

solve(N) ->
    M = list_to_tuple([1,lists:duplicate(N*N-1, 0)]),
    solve(N*N, M).

