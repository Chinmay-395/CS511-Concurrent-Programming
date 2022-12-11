-module(gg).
-compile(export_all).
start(N) ->
    S = spawn(?MODULE, server, []),
    [spawn(?MODULE, client, [S]) || _ <- lists:seq(1, N)].
server()->
  {Pid,Ref,Number} ->
  
client(S) ->
  Ref = make_ref(),
  From ! {self(),Ref,start},
  
  
exit ( incomplete ).	
