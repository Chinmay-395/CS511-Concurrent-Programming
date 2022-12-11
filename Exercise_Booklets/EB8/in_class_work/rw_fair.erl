-module(rw_fair).
-compile(nowarn_export_all).
-compile(export_all).

%%%% RW server code

rw_loop() ->       
    receive
	{From,start_read} ->
	    From!ok,
	    rw_reader_loop(1),
	    rw_loop();
	%% {From,stop_read} ->
	%%     rw_loop(R-1);
	{From,start_write} ->
	    From!ok,
	    receive
		{From,stop_write} ->
		    rw_loop()
	    end
    end.

rw_reader_loop(0) ->
    ok;
rw_reader_loop(R) when R>0 ->
    receive
	{_From,start_read} ->
	    rw_reader_loop(R+1);
	{_From,stop_read} ->
	    rw_reader_loop(R-1);
	{From,start_write} ->
	    [ receive {From,stop_read} -> ok end || _ <- lists:seq(1,R)],
	    From!ok,
	    receive 
		{From,stop_write} ->
		    ok
	    end
    end.

start_read() ->
    rw!{self(),start_read},
    receive
	ok ->
	    ok
    end.

stop_read() ->
    rw!{self(),stop_read}.

start_write() ->
    rw!{self(),start_write},
    receive
	ok ->
	    ok
    end.

stop_write() ->
    rw!{self(),stop_write}.			  

make_rw() ->
    S = spawn(?MODULE,rw_loop,[]),
    register(rw,S).

%%%% RW client code

start() ->
    make_rw(),
    spawn(fun client1/0),
    spawn(fun client2/0).
        
client1() ->
    start_read(),
    %% read
    stop_read().

client2() ->
    start_write(),
    %% write
    stop_write().
       
