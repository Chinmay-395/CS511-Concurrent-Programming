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

% how to implement path_to_leaves using accumulator
% how to pass the value from parent function to child function
% is there anything similar to (Ocaml)Lists.mapi in Erlang
get_the_index_of_list(Ele, ListVal) -> lists:nth(Ele, ListVal).

% path_to_leaves({node, _D, []}) ->
%     [[]];
% path_to_leaves({node, N, L}) ->
%     lists:flatten(
%         lists:map(
%             fun(I, N) ->
%                 (lists:map(fun(X) -> I ++ X end, N))
%             end,
%             lists:map(fun path_to_leaves/1, L)
%         )
%     ).

% Another Attempt
% index_substituter({node,D,L},VAL) -> {node,VAL,L}
% convert_into_index([], _I) -> [];
% convert_into_index([H|T], I) ->  ++ convert_into_index(T, I + 1).
% % gt:convert_into_index(gt:t1()).
% update_tree({node, D, CH}) ->
%     {node, D, list:map(
% 								update_tree(
% 									convert_into_index(CH, 0)
% 								)
% 							)
% 		}.

% path_to_leaves(T) ->
% 	lists:map(
% 		remove_initial_root(
% 			path_to_leaves_helper(
% 				update_tree(T)
% 			)
% 		)
% 	)

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
