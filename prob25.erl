-module(prob25).
-export([solve/0]).

fib(_, B, Max, Term) when B >= Max -> Term;
fib(A, B, Max, Term) -> fib(B+A, A, Max, Term+1).

solve() ->
    {Max,[]} = string:to_integer([$1|lists:duplicate(999, $0)]),
    fib(1,1,Max,1).
