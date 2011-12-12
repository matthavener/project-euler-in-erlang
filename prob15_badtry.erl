-module(prob15).
-export([solve/1]).


condense([], Acc) -> Acc;
condense([H|L], Acc) ->
    { Matches, NoMatch } = lists:partition(fun({P,_}) -> P == H end, L),
    Num = lists:foldl(fun({_,N}, A) -> A+N end, 0, Matches),
    condense(NoMatch, [{element(1,H), Num}|Acc]).
condense(L) ->
    C = condense(L, []),
    io:format("condensed ~w to ~w~n", [L, C]),
    C.

down({{X,Y},N}, Size) when X < Size -> [{{X+1,Y},N}];
down(_,_) -> [].
right({{X,Y},N}, Size) when Y < Size -> [{{X,Y+1},N}];
right(_,_) -> [].

find_routes([], Paths, _) -> Paths;
find_routes(Locations, Paths, Size) ->
    NextStep = lists:flatmap(fun(Loc) -> down(Loc, Size) ++ right(Loc, Size) end, Locations),
    { Finished, NewLocations } = lists:partition(fun(X) -> X == {Size,Size} end, NextStep),
    Condensed = condense(NewLocations),
    find_routes(Condensed, Paths+length(Finished), Size).

solve(N) ->
    find_routes([{0,0}], 0, N).
