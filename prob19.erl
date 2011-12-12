-module(prob19).
-export([solve/0]).

solve(Days, Acc, Fin) when Days > Fin -> Acc;
solve(Days, Acc, Fin) ->
    case calendar:gregorian_days_to_date(Days) of 
        {_, _, 1} -> solve(Days+7, Acc+1, Fin);
        _ -> solve(Days+7, Acc, Fin)
    end.

solve() ->
    solve(calendar:date_to_gregorian_days({1901, 1, 6}),
          0,
          calendar:date_to_gregorian_days({2000, 12, 31})+1
         ).
