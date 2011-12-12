-module(prob14).
-export([solve/0]).

collatz(1, Times) -> Times;
collatz(N, Times) when N rem 2 == 0 ->
    collatz(trunc(N div 2), Times+1);
collatz(N, Times) ->
    collatz(3*N+1, Times+1).

solve(0, AccN, AccIters) -> {AccN, AccIters};
solve(N, AccN, AccIters) ->
    Iters = collatz(N, 0),
    if
        Iters > AccIters -> solve(N-1, N, Iters);
        true -> solve(N-1, AccN, AccIters)
    end.

solve() ->
    solve(1000000, 1, 1).


