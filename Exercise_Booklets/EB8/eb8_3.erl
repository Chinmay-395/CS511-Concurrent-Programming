-module(eb8_3).
-compile(nowarn_export_all).
-compile(export_all).

start() ->
    S = spawn(?MODULE, server, [0]),
    spawn(?MODULE, client1, [S]),
    spawn(?MODULE, client2, [S]).

server(N) ->
    receive
        {From, counter} ->
            From ! {self(), N},
            server(0);
        {continue} ->
            server(N + 1)
    end.

client1(S) ->
    S ! {continue},
    S ! {continue},
    S ! {continue},
    S ! {self(), counter},
    receive
        {_S, N} ->
            io:format("~w~n", [N])
    end.

client2(S) ->
    S ! {continue},
    S ! {continue},
    S ! {self(), counter},
    receive
        {_S, N} ->
            io:format("~w~n", [N])
    end.
