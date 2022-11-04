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

% let rec paths_to_leaves t = (* 'a gt -> int list list = <fun> *)
%   match t with
%   | Node (n, []) -> [[]]
%   | Node (n, l) -> List.flatten (List.mapi (fun i n -> (List.map (fun x -> i :: x) n))
%                     (List.map paths_to_leaves l))
% -moodule(ic).
% -compile(export_all).
allEmpty(Queue) ->
    {Item, NextQueue} = queue:out(Queue),
    case Item of
        empty -> true;
        {value, {empty}} -> allEmpty(NextQueue);
        {value, {node, _, _, _}} -> false
    end.

isComplete({empty}) ->
    true;
isComplete(Node) ->
    Q = queue:new(),
    Q1 = queue:in(Node, Q),
    isCompleteHelper(Q1).

isCompleteHelper(Queue) ->
    {Item, NextQueue} = queue:out(Queue),
    case Item of
        empty ->
            true;
        {value, {empty}} ->
            allEmpty(NextQueue);
        {value, {node, _, Left, Right}} ->
            isCompleteHelper(queue:in(Right, queue:in(Left, NextQueue)))
    end.

t3() -> {node, 1, {node, 2, {empty}, {empty}}, {node, 3, {empty}, {empty}}}.
t2() -> {node, 1, {node, 2, {empty}, {empty}}, {node, 3, {empty}, {node, 3, {empty}, {empty}}}}.
