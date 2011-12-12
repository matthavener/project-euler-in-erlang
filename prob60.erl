-module(prob60).
-export([solve/0, rotations/1]).

primes(Prime, Max, Primes,Integers) when Prime > Max ->
    lists:reverse([Prime|Primes], Integers); % appends Integers to reversed Primes 
primes(Prime, Max, Primes, Integers) ->
    [NewPrime|NewIntegers] = [ X || X <- Integers, X rem Prime =/= 0 ],
    primes(NewPrime, Max, [Prime|Primes], NewIntegers).

primes(N) ->
    primes(2, round(math:sqrt(N)), [], lists:seq(3,N,2)).

dense_list_to_tuple([], Acc, _)  -> 
    list_to_tuple(lists:reverse(Acc));    
dense_list_to_tuple([H|T], Acc, N) when H == N ->
    dense_list_to_tuple(T, [true|Acc], N+1);
dense_list_to_tuple(L, Acc, N) ->
    dense_list_to_tuple(L, [false|Acc], N+1).

dense_list_to_tuple(N) ->
    dense_list_to_tuple(N, [], 1).

rotate_at(N, X) ->
    { First, Rest } = lists:split(X, integer_to_list(N)),
    list_to_integer(Rest ++ First).

rotations(N) ->
    [ rotate_at(N, X)  || X <- lists:seq(0, trunc(math:log10(N))) ].

check_rotations(N, P) ->
    lists:all(fun(X) -> element(X, P) end, rotations(N)).

solve() ->
    P = dense_list_to_tuple(primes(1001000)),
    length([ X || X <- lists:seq(1,1000000), check_rotations(X, P) ]).
