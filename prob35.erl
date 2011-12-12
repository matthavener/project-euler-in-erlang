-module(prob60).
-export([solve/3, primes/1, concat_num/2, 
         is_all_pairs/2, is_prime/2, combination/3, 
         dense_list_to_tuple/1, is_pair/2, is_all_uniq/1]).

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

concat_num(A,B) ->
    round(math:pow(10, length(integer_to_list(B)))*A)+B.

is_prime(Num, Primes) when is_tuple(Primes) and (Num > size(Primes)) ->
    false;
is_prime(Num, Primes) when is_tuple(Primes) ->
    element(Num, Primes);
is_prime(Num,Primes) ->
    exit({bad_arg, Num, Primes}).

is_pair({X,Y}, PrimesT) ->
    is_prime(concat_num(X,Y), PrimesT) and is_prime(concat_num(Y,X), PrimesT).

is_all_pairs(L, _) when length(L) < 2 -> 
    true;
is_all_pairs(L, Primes) -> 
    lists:all(fun({X,Y}) -> is_prime(concat_num(X,Y), Primes) end, [ {A,B} || A <- L, B <- L]). 

combination(_, [], _) -> 
    [];
combination(1, List, Pred) -> 
    [ [X]   || X <- List, Pred([X])];
combination(N, [H|T], Pred) -> 
    [ [H|X] || X <- combination(N-1, T, Pred), Pred([H|X]) ] ++ combination(N, T, Pred).
    
is_all_uniq([], _) ->
    true;
is_all_uniq([H|L], H) ->
    false;
is_all_uniq([H|L], C) ->
    is_all_uniq(L, H).
is_all_uniq(L) -> is_all_uniq(L, 0).

solve(Max, Max, Candidates, _, _) -> Candidates;
solve(Cur, Max, Candidates, HeadPrimes, PairsS) ->
    NewCandidates = [ [H|C] || C <- Candidates, H <- HeadPrimes, 
                      lists:all(fun(X) -> sets:is_element({X, H}, PairsS) and (X =/= H) end, C) ], 
    io:format("reduced ~w candidates to ~w for ~w setsize~n",
            [length(Candidates), length(NewCandidates), Cur]),
    solve(Cur+1, Max, NewCandidates, HeadPrimes, PairsS).

solve(N, PrimesL, ComboNum) ->
%    PrimesL = primes(100000000),
    io:format("found ~w primes ~n", [length(PrimesL)]),
    PrimesT = dense_list_to_tuple(PrimesL),
    {Head,_} = lists:split(ComboNum, PrimesL),
    io:format("found ~w subset of primes ~n", [length(Head)]),
    Pairs = [ {X,Y} || X <- Head, Y <- Head, X =/= Y, is_pair({X,Y}, PrimesT) ],
    PairsL = [ [X,Y] || {X,Y} <- Pairs ],
    io:format("found ~w pairs of primes ~n", [length(Pairs)]),
    PairsS = sets:from_list(Pairs),
    Fives = solve(2, N, PairsL, Head, PairsS), 
    io:format("found ~w fives of primes ~n", [length(Fives)]),
    Fives.


