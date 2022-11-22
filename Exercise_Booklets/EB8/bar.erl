-module(bar).
-compile(export_all).
start(W, M) ->
    S = spawn(?MODULE, server, [0, 0]),
    [spawn(?MODULE, woman, [S]) || _ <- lists:seq(1, W)],
    [spawn(?MODULE, man, [S]) || _ <- lists:seq(1, M)].
%ReferencetoPIDofserver
patriots(S) ->
    S ! {self(), patriots}.
%ReferencetoPIDofserver
jets(S) ->
    Ref = make_ref(),
    S ! {self(), Ref, jets},
    receive
        {S, Ref, ok} ->
            ok
    end.
%CountersforPatriotsavailableforjustifyingingressofJets
server(Patriots) ->
    receive
        {_From, patriots} ->
            server(Patriots + 1);
        {From, Ref, jets} when Patriots > 1 ->
            From ! {self(), Ref, ok},
            server(Patriots - 2)
    end.
