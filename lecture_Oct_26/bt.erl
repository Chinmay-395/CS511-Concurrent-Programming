-module(bt).
-compile(nowarn_export_all).
-compile(export_all).
%% -export([t1/0]).
%% {empty}   empty tree
%% {node,D,LT,RT}  non-empty tree
%%   7
%%  / \
%% 3   77
%%    /
%%   33
fact(0) ->
    1;
% guard
fact(N) when N > 0 ->
    N * fact(N - 1).
t1() ->
    {node, 7, {node, 3, {empty}, {empty}}, {node, 77, {node, 33, {empty}, {empty}}, {empty}}}.
sizet({empty}) ->
    0;
sizet({node, _, LT, RT}) ->
    1 + sizet(LT) + sizet(RT).
mirrort({empty}) ->
    {empty};
mirrort({node, D, LT, RT}) ->
    {node, D, mirrort(RT), mirrort(LT)}.
%% O(n^2)
rev([]) ->
    [];
rev([H | T]) ->
    rev(T) ++ [H].
%% O(n)
frev([], A) ->
    A;
frev([H | T], A) ->
    frev(T, [H | A]).
weekday(saturday) ->
    true;
weekday(sunday) ->
    true;
weekday(_) ->
    false.
