-module(prob17).
-export([solve/0, w/1]).

w(0) -> "";
w(1) -> "one";
w(2) -> "two";
w(3) -> "three";
w(4) -> "four";
w(5) -> "five";
w(6) -> "six";
w(7) -> "seven";
w(8) -> "eight";
w(9) -> "nine";
w(10) -> "ten";
w(11) -> "eleven";
w(12) -> "twelve";
w(13) -> "thirteen";
w(14) -> "fourteen";
w(15) -> "fifteen";
w(16) -> "sixteen";
w(17) -> "seventeen";
w(18) -> "eighteen";
w(19) -> "nineteen";
w(20) -> "twenty";
w(30) -> "thirty";
w(40) -> "forty";
w(50) -> "fifty";
w(60) -> "sixty";
w(70) -> "seventy";
w(80) -> "eighty";
w(90) -> "ninety";

w(N) when (N >= 20) and (N < 100) ->
    w((N div 10) * 10) ++ w(N rem 10);
w(N) when (N >= 100) and (N < 1000) and ((N rem 100) =/= 0) ->
    w(N div 100) ++ "hundredand" ++ w(N rem 100);
w(N) when (N >= 100) and (N < 1000) ->
    w(N div 100) ++ "hundred";
w(1000) -> "onethousand".

solve() -> 
    lists:sum([ length(w(X)) || X <- lists:seq(1,1000) ]).
        
