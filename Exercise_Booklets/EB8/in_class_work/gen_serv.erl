-module(gen_serv).
-compile(nowarn_export_all).
-compile(export_all).

fact(0) ->
    1;
fact(N) when N>0 ->
    N*fact(N-1).

loop(C,F) ->
    receive
	{From,N,Ref,op} ->
	    case catch(F(N)) of 
		{'EXIT',_Reason} ->
		    From!{res,Ref,error},
		    loop(C+1,F);
		MaybeResult when is_atom(MaybeResult) ->
		    From!{res,Ref,error},
		    loop(C+1,F);
		Result ->
		    From!{res,Ref,Result},
		    loop(C+1,F)
	    end;
	{From,Ref,read} ->
	    From!{res,Ref,C},
	    loop(C,F);
	{_From,G,update} ->
	    loop(C,G);
	stop  ->
	    stop
    end.

start() ->
    spawn(?MODULE,loop,[0,fun fact/1]).
  
