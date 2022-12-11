-module(jd_restarter).
-compile(export_all).
-compile(nowarn_export_all).

start() ->
    spawn(?MODULE, restarter, []).

restarter() ->
    process_flag(trap_exit, true),
    C = spawn_link(?MODULE, critic, []),
    register(critic, C),
    receive
        {'EXIT', Pid, normal} -> ok;
        {'EXIT', Pid, shutdown} -> ok;
        {'EXIT', Pid, _} -> restarter()
    end.

judge(Band, Album) ->
    critic ! {self(), {Band, Album}},
    Pid = whereis(critic),
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
