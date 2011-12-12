-module(prob60).
-export([solve/2, primes/1, combination/2, combination/3, is_all_pairs/2]).

primes(Prime, Max, {Primes,Integers}) when Prime > Max ->
   Primes ++ Integers;
primes(Prime, Max, AccIn) ->
   {Primes, Integers} = AccIn,
   [NewPrime|NewIntegers] = lists:filter(fun(X) -> X rem Prime =/= 0 end, Integers),
   primes(NewPrime, Max, {[Prime|Primes], NewIntegers}).

primes(N) ->
   primes(2, round(math:sqrt(N)), {[], lists:seq(3,N,2)}).

concat_num(A, B) ->
   {Int, []} = string:to_integer(lists:concat([integer_to_list(A),integer_to_list(B)])),
   Int.

is_prime(Num, Primes) ->
   lists:member(Num, Primes).

is_pair([X,Y],Primes) -> 
    is_prime(concat_num(X,Y), Primes).

combination(_, [])    -> [];
combination(1, List)  -> [ [X]   || X <- List];
combination(N, [H|T]) -> [ [H|X] || X <- combination(N-1, T)] ++ combination(N, T).

combination(_, [], _)  -> 
    [];
combination(1, List, _) -> 
    [ [X] || X <- List ];
combination(N, [H|T], Pred) -> 
    lists:filter(
                 Pred,
                 [ [H|X] || X <- combination(N-1, T, Pred) ])
    ++ combination(N, T, Pred).

is_all_pairs([], _) -> true;
is_all_pairs([_], _) -> true;
is_all_pairs(L, Primes) -> 
    lists:all(fun(X) -> is_pair(X, Primes) end, 
              combination(2, L)).

solve(N, Primes) ->
    combination(N, Primes, fun(X) -> is_all_pairs(X, Primes) end).
