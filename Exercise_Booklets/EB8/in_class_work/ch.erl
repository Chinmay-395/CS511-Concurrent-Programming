-module(ch).
-compile(nowarn_export_all).
-compile(export_all).

%% Simple example illustrating the use of the "after" clause
my_flush() ->
    receive
	_ ->
	    my_flush()
    after 0 ->
	    ok
    end.

%% linking and exit example.
chain(0) ->
    receive
	_ ->
	    ok
    after 3000 ->
	    exit(done)
    end;
chain(N) when N>0 ->
    spawn_link(?MODULE,chain,[N-1]),
    receive
	_ ->
	    ok
    end.

	
