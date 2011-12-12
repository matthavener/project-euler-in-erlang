-module(prob23).
-export([solve/0, primes/1, divisors/2, combination/2]).

primes(Prime, Max, Primes,Integers) when Prime > Max ->
    lists:reverse([Prime|Primes], Integers); % appends Integers to reversed Primes 
primes(Prime, Max, Primes, Integers) ->
    [NewPrime|NewIntegers] = [ X || X <- Integers, X rem Prime =/= 0 ],
    primes(NewPrime, Max, [Prime|Primes], NewIntegers).
primes(N) ->
    primes(2, round(math:sqrt(N)), [], lists:seq(3,N,2)).

combination(_, [])    -> [];
combination(1, List)  -> [ [X]   || X <- List];
combination(N, [H|T]) -> [ [H|X] || X <- combination(N-1, T)] ++ combination(N, T).

prod(N) -> lists:foldl(fun(X, Acc) -> X*Acc end, 1, N).

divisors(N, Primes = [P|_], Acc) when N rem P == 0 ->
    divisors(N div P, Primes, [P|Acc]);
divisors(N, [P|Primes], Acc) ->
    divisors(N, Primes, Acc).

divisors(N, Primes) ->
    PrimeDivisors = [1|divisors(N, lists:reverse(Primes), [])],
    [ prod(combination(N, PrimeDivisors)) || N <- lists:seq(1,N) ].

is_abundant(N) ->
    true.

abundant_numbers(Max) ->
    [ N || N <- lists:seq(2, Max), is_abundant(N) ].

solve() ->
    Max = 28231,
    Primes = primes(Max),
    D = divisors(16392, Primes).
%    ANs = abundant_numbers(28123),
%    Sums = [ A+B || A <- ANs, B <- ANs ].

