-module(prob67).
-export([solve/0]).

max(A,B) when A > B -> A;
max(_,B) -> B.

combine(_, [], Acc) -> 
    lists:reverse(Acc);
combine([L,R|RestPrev], [H|RestNext], Acc) ->
    combine([R|RestPrev], RestNext, [H+max(L,R)|Acc]).

solve([L]) -> 
    L;
solve([Prev,Next|Rest]) ->
    io:format("Prev ~w~n", [Prev]),
    NewNext = combine(Prev, Next, []),
    solve([NewNext|Rest]).

solve() ->
    {ok,T} = file:script("triangle.txt"),
    RT = lists:reverse(T),
    solve(RT).
