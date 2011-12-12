-module(prob34).
-export([solve/0, qfact/1]).

qfact(0) -> 1;
qfact(1) -> 1;
qfact(2) -> 2;
qfact(3) -> 6;
qfact(4) -> 24;
qfact(5) -> 120;
qfact(6) -> 720;
qfact(7) -> 5040;
qfact(8) -> 40320;
qfact(9) -> 362880.

is_num(N) -> 
    N == lists:sum([ qfact(X-$0) || X <- integer_to_list(N) ]).

look(Max, Acc, Max) -> Acc;
look(Cur, Acc, Max) ->
    case is_num(Cur) of 
        true -> 
            io:format("found ~w~n", [Cur]),
            look(Cur+1, Acc+Cur, Max);
        _ -> 
            look(Cur+1, Acc, Max)
    end.

solve() ->
    look(3, 0, 10000000).
