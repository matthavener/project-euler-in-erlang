-module(prob12).
-export([solve/0, num_divs/1]).

num_divs(N, N, Acc) -> Acc;
num_divs(N, Divisor, Acc) when N rem Divisor == 0 ->
    num_divs(N, Divisor+1, Acc+1);
num_divs(N, Divisor, Acc) ->
    num_divs(N, Divisor+1, Acc).

num_divs(N) ->
    num_divs(N, 1, 0).

solve(N, C, Divs) when Divs > 500 ->
    { N, C };
solve(N, C, Divs) ->
    NewDivs = num_divs(N+C), 
    if NewDivs > Divs -> io:format("~w ~w~n", [N+C, NewDivs]); true -> ok end,
    solve(N+C, C+1, NewDivs).

solve() ->
    solve(1, 1, 0).
    

