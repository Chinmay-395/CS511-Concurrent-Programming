-module(crit).
-compile(nowarn_export_all).
-compile(export_all).

start() ->
    spawn(?MODULE, restarter, []).
 
restarter() ->
    process_flag(trap_exit,true),
    C = spawn_link(?MODULE,critic,[]),
    register(critic,C),
    receive
	{'EXIT', Pid, normal} -> % not a crash
	    ok;
	{'EXIT', Pid, shutdown} -> % manual termination, not a crash
	    ok;
	{'EXIT', Pid, _} ->
	    restarter()
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
    {From, {"Rage Against the Turing Machine", "Unit Testify"}} ->
      From ! {self(), "They are great!"};
    {From, {"System of a Downtime", "Memoize"}} ->
      From ! {self(), "They're not Johnny Crash but they're good."};
    {From, {"Johnny Crash", "The Token Ring of Fire"}} ->
      From ! {self(), "Simply incredible."};
   {From, {_Band, _Album}} ->
      From ! {self(), "They are terrible!"}
  end,
  critic().
