-module(jd).
-compile(export_all).
-compile(nowarn_export_all).

start() ->
    spawn(?MODULE, critic, []).

judge(Pid, Band, Album) ->
    Pid ! {self(), {Band, Album}},
    receive
        {Pid, Criticism} -> Criticism
    after 2000 ->
        timeout
    end.

critic() ->
    receive
        {From, {"Rage Against the Turing Machine", "Unified Testify"}} ->
            From ! {self(), "They are great!"};
        {From, {"System of Downtime", "Memoize"}} ->
            From ! {self(), "They are not Johnny Crash but they are good"};
        {From, {"Johnny Crash", "The token ring of fire"}} ->
            From ! {self(), "Simply incredible"};
        {From, {_Band, _Album}} ->
            From ! {self(), "They are terrible!"}
    end.
% critic().
