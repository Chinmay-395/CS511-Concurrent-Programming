-module(eb8_4_new).
-compile(export_all).
start(Freq) ->
    L = [ spawn(? MODULE , client , [] ) || _ <- lists : seq (1 ,2) ] ,
    spawn(? MODULE , timer , [ Freq , L ] ).

timer(0,L) ->
    io:format("ENDED"),
    ok;

timer ( Freq , L ) when Freq>0->
    timer:sleep(Freq),
    [Pid!{Pid,tick}||Pid<-L],
    timer(Freq-1,L).
client() ->
receive
    {From, tick } ->
        io:format("THE TICK ~p ~n",[From]),
        client()
    end.
