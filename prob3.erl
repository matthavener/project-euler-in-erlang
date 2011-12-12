-module(prob3).
-export([solve/0]).

primes(Prime, Max, Primes,Integers) when Prime > Max ->
    lists:reverse(Primes, Integers); % appends Integers to reversed Primes 
primes(Prime, Max, Primes, Integers) ->
    [NewPrime|NewIntegers] = [ X || X <- Integers, X rem Prime =/= 0 ],
    primes(NewPrime, Max, [Prime|Primes], NewIntegers).

primes(N) ->
    primes(2, round(math:sqrt(N)), [], lists:seq(3,N,2)).

solve() ->
    N = 600851475143,
    MaxFac = round(math:sqrt(600851475143)),
    Primes = primes(MaxFac),
    lists:max([X || X <- Primes, N rem X == 0]).
