-module(prob9).
-export([solve/0]).

solve() ->
    Pairs = [ {A,B} || A <- lists:seq(1,1000), B <- lists:seq(1, A) ], 
    Pytha = [ {A,B,math:sqrt(A*A + B*B)} || {A,B} <- Pairs ],
    [X,Y,Z] = [ {A,B,C} || {A,B,C} <- Pytha, C == trunc(C), A+B+trunc(C) == 1000 ],
    X*Y*Z.


                
                
