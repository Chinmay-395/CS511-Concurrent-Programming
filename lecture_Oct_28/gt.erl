-module(gt).
-compile(nowarn_export_all).
-compile(export_all).
-author("E.B.").
%%% (Non-empty) General trees
%%%  gt := {node,D,List gt}
%%%
%%   7
%%  / \
%% 3   55
%%   / | \
%%  12 77 93
%%% paths_to_leaves(t1())
%% [ [0], [1,0], [1,1], [1,2]]

% helper function
reverse([]) -> [];
reverse([H | T]) -> reverse(T) ++ [H].

t1() ->
    {node, 7, [
        {node, 3, []},
        {node, 55, [
            {node, 12, []},
            {node, 77, []},
            {node, 93, []}
        ]}
    ]}.
sum([]) ->
    0;
sum([H | T]) ->
    H + sum(T).
%% size of general tree
sizegt({node, _D, CH}) ->
    1 + sum(lists:map(fun sizegt/1, CH)).

mirror({empty}) -> {empty};
mirror({node, D, CH}) -> {node, D, reverse(lists:map(fun mirror/1, CH))}.
%% 
% 
% mapgt(F,{node,D,CH})
% preorder({node,D,CH})
% level(N,{node,D,CH}) 
% path_to_leaves({node,D,CH})
% fold(F,G,{node,D,CH})
