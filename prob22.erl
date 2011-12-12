-module(prob22).
-export([solve/0]).

% added [ and ] around the file.txt list

solve() ->
    {ok, L} = file:script("names.txt"),

    lists:foldl(
            fun(Name, {Pos, CurScore}) ->
                { Pos+1, CurScore + Pos*lists:sum([ X-64 || X <- Name]) }
            end,
            { 1, 0 },
            lists:sort(L)).
