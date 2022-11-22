-module(bar2).

-compile(export_all).

start(W, M) ->
    S = spawn(?MODULE, server, [0, 0, false]),
    [spawn(?MODULE, patriots, [S]) || _ <- lists:seq(1, W)],
    [spawn(?MODULE, jets, [S]) || _ <- lists:seq(1, M)],
    spawn(?MODULE, itGotLate, [3000, S]).

itGotLate(Time, S) ->
    timer:sleep(Time),
    R = make_ref(),
    S ! {self(), R, itGotLate},
    receive
        {S, R, ok} ->
            done
    end.

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

%CountersforPatriotsavailableforjustifyingingressofJets,false=it
server(Patriots, false) ->
    %didnotgetlateyet
    receive
        {_From, patriots} ->
            server(Patriots + 1);
        {From, Ref, jets} when Patriots > 1 ->
            From ! {self(), Ref, ok},
            server(Patriots - 2)
    end.

server(Patriots,true)->%CountersforPatriotsavailableforjustifyingingressofJets,true=itgotlate
error(not_implemented);
