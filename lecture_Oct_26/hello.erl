-module(hello).
% -export([hello/0]).
% -export([arith/2]).
% -export([what_day/1]).
% -export([fact/1]).
% compile(export_all).
-export([hello/0, arith/2, what_day/1, fact/1]).
hello() -> " Hello , world ! ".
arith(X, Y) ->
    % io:format(" Arguments : ~ p ~ p ~ n ", [X, Y]),
    Sum = X + Y,
    Diff = X - Y,
    Prod = X * Y,
    Quo = X div Y,
    % io:fwrite(" ~ p ~ p ~ p ~ p ~ n ", [Sum, Diff, Prod, Quo]),
    {Sum, Diff, Prod, Quo}.
% arith(2, 4).
what_day(saturday) -> weekend;
what_day(sunday) -> weekend;
what_day(_) -> weekday.

fact(0) -> 1;
fact(N) when N > 0 -> N * fact(N - 1).
