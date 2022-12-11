-module(barr).
-compile(nowarn_export_all).
-compile(export_all).

%%%% Barrier code here

%%% coordinator(N,M,L) 
%% N is the size of the barrier
%% M is the number of processes yet to arrive
%% L is the PID of the processed that have already arrived

coordinator(N,0,L) ->
    [ From!ok || From <- L],
    coordinator(N,N,[]);
coordinator(N,M,L) when M>0 ->
    receive 
	{From,arrived} ->
	    coordinator(N,M-1,[From|L])
    end.

barrier() ->
    coordinator!{self(),arrived},
    receive 
	ok ->
	    ok
    end.

make_barrier(N) ->
    S = spawn(?MODULE,coordinator,[N,N,[]]),
    case whereis(coordinator) of
	undefined ->
	    ok;
	_PID when is_pid(_PID) ->
	    unregister(coordinator)
    end,
    register(coordinator,S).
   
%%%% Client code here

start() ->
    make_barrier(3),
    spawn(?MODULE,client1,[]),
    spawn(?MODULE,client2,[]),
    spawn(?MODULE,client3,[]),
    ok.

client1() ->
    io:format("a~n"),
    barrier(),
    io:format("1~n"),
    client1().

client2() ->
    io:format("b~n"),
    barrier(),
    io:format("2~n"),
    client2().

client3() ->
    io:format("c~n"),
    barrier(),
    io:format("3~n"),
    client3().
