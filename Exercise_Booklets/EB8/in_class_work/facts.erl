-module(facts).
-compile(export_all).


fact(0) ->
    1;
fact(N) when N>0 ->
    N*fact(N-1).

loop(C) ->
    receive
	{From,Ref,N,op} ->
	    From!{res,Ref,fact(N)},
	    loop(C+1);
	{From,Ref,read} ->
	    From!{status,Ref,C},
	    loop(C);
	stop ->
	    stop
    end.

start() ->
    S = spawn(?MODULE,loop,[0]),
    R1 = make_ref(),
    S!{self(),R1,10,op},
    R2 = make_ref(),
    S!{self(),R2,12,op},
    receive
	{res,R2,N} ->
	    io:format("Fact of 12 is~w~n",[N]),
	    receive 
		{res,R1,M} ->
		    io:format("Fact of 10 is~w~n",[M])
	    end
    end.

