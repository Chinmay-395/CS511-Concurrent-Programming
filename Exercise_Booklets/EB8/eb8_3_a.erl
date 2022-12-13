-module(eb8_3_a).
-compile(nowarn_export_all).
-compile(export_all).

start() ->
    S = spawn(?MODULE, server, [0]),
    [spawn(?MODULE, client, [S])|| _ <- lists:seq(1, 5)].

client(S) ->
    S!{continue},
    S!{continue},
    S!{continue},
    S!{counter,self()},
    receive
        {final,Val} ->
            io:format("THE VAL ~w ~n",[Val])
    end.
    
server(CounterValue) ->
    % io:format("THE CURRENT VAL ~w ~n",[CounterValue]),
    receive
        {continue} ->
            server(CounterValue+1);
        {counter,From} ->
            % io:format("THE COUNTER ~w ~n",[CounterValue]),
            From!{final,CounterValue}
            % server(CounterValue)
    end.
