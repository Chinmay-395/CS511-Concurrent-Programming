-module(rw).
-compile(nowarn_export_all).
-compile(export_all).

%%%% RW server

loop(R,W) ->  %% R=number of readers reading, W=number of writers writing
    receive
	{From,start_read} when W==0 ->
	    From!ok,
	    loop(R+1,W);
	{_From,stop_read} ->
	    loop(R-1,W);
	{From,start_write} when R==0 and W==0 ->
	    From!ok,
	    loop(R,W+1);
	{_From,stop_write} ->
	    loop(R,W-1)
    end.

make_rw() ->
    S = spawn(?MODULE,loop,[0,0]),
    register(rw,S).

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
			  
%%%% Client code

client1() ->
    start_read(),
    %% read
    stop_read().

client2() ->
    start_write(),
    %% write
    stop_write().
