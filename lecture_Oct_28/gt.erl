-module(gt).
-compile(nowarn_export_all).
-compile(export_all).
-author("E.B.").
%%% (Non-empty) General trees
%  gt := {node,D,List gt}
%%%
%%   7
%%  / \
%% 3   55
%%   / | \
%%  12 77 93
%%% paths_to_leaves(t1())
%% [ [0], [1,0], [1,1], [1,2]]
-type gt(A) :: {node, A, list(gt(A))}.
-spec f(integer()) -> atom().
f(1) -> anAtom;
f(2) -> 2.

% helper function
reverse([]) -> [];
reverse([H | T]) -> reverse(T) ++ [H].

% -spec t1() -> gt(integer()).
t1() ->
    {node, 7, [
        {node, 3, []},
        {node, 55, [
            {node, 12, []},
            {node, 77, []},
            {node, 93, []}
        ]}
    ]}.

% sum of all values in the list
sum([]) ->
    0;
sum([H | T]) ->
    H + sum(T).

%% size of general tree
-spec sizegt(gt(_A)) -> integer().
sizegt({node, _D, CH}) ->
    1 + sum(lists:map(fun sizegt/1, CH)).

-spec sumgt(gt(_A)) -> integer().
sumgt({node, D, CH}) -> D + sum(lists:map(fun sumgt/1, CH)).

mirror({empty}) -> {empty};
mirror({node, D, CH}) -> {node, D, reverse(lists:map(fun mirror/1, CH))}.
% gt:mirror(gt:t1()).
% {node,7,
%       [{node,55,[{node,93,[]},{node,77,[]},{node,12,[]}]},
%        {node,3,[]}]}
%%
%

% mapgt(F, {node, D, []}) -> {node, F(D), empty};
mapgt(_, {empty}) -> {empty};
mapgt(F, {node, D, CH}) -> {node, F(D), lists:map(fun mapgt/2, CH)}.

% preorder({node, X, []}) -> [X];
% preorder2({node, D, CH}) -> [D] ++ lists:flatten(lists:map(preorder(CH))).
preorder({node, D, CH}) -> [D | lists:flatten(lists:map(fun preorder/1, CH))].
%
prepend(_N, []) -> [];
prepend(N, [H | T]) -> [N | H] ++ prepend(N, T).

-spec is_leaf(gt(_A)) -> boolean().
is_leaf({node, _D, []}) -> true;
is_leaf(_) -> false.

add_prefixes(_I, []) ->
    [];
add_prefixes(I, [H | T]) ->
    lists:map(fun(L) -> [I | L] end, H) ++ add_prefixes(I + 1, T).

paths_to_leaves({node, _D, []}) ->
    [[]];
paths_to_leaves({node, _D, CH}) ->
    add_prefixes(0, lists:map(fun paths_to_leaves/1, CH)).

enumerate(List) ->
    {List1, _} = lists:mapfoldl(fun(T, Acc) -> {{Acc, T}, Acc + 1} end, 1, List),
    List1.

-spec prune(integer(), gt(A)) -> gt(A).
prune(0, {node, D, _CH}) ->
    {node, D, []};
prune(N, {node, D, CH}) when N > 0 ->
    {node, D, lists:map(fun(L) -> prune(N - 1, L) end, CH)}.

-spec level(integer(), gt(A)) -> list(A).
level(0, {node, D, _CH}) ->
    [D];
level(N, {node, _D, CH}) when N > 0 ->
    lists:flatten(lists:map(fun(T) -> level(N - 1, T) end, CH)).

% -spec foldT(fun((A) -> B), fun((list(B)) -> B), gt(A)) -> B.
foldT(F, G, {node, D, CH}) ->
    F(D, G(lists:map(fun(T) -> foldT(F, G, T) end, CH))).

% 1> rd(state, {port, clients}).
% state
% 2> rd(client, {pid, acc}).
% client
% 3> State = #state{port=9921, clients=[#client{pid = "A", acc = <<85>>}, #client{pid = "B", acc = <<73>>}, #client{pid = "C", acc = <<56>>}]}.
% #state{port = 9921,
%        clients = [#client{pid = "A",acc = <<"U">>},
%                   #client{pid = "B",acc = <<"I">>},
%                   #client{pid = "C",acc = <<"8">>}]}
% 4> #client.pid.
% 2
% 5> Find = fun(Pid, State) -> lists:keyfind(Pid, #client.pid, State#state.clients) =/= false end.
% #Fun<erl_eval.12.50752066>
% 6> Find("B", State).
% true
% 7> Find("Z", State).
% false
theListOfStuff() -> [{1, 'B', 1}, {1, 'A', 3}, {3, 'C', 2}, {2, 'D', 4}, {2, 'B', 5}].
workFunction(NewLocation) -> lists:map(fun(L) -> element(1, hd(L)) end, NewLocation).

% helperFunc(Shipping_State,EachContainer)->
% lists:keyfind(
%     EachContainer,
%     #container.id,
%     Shipping_State#shipping_state.containers
% ).
