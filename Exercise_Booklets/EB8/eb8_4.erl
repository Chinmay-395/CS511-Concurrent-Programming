-module(eb8_4).
-compile(nowarn_export_all).
-compile(export_all).

start() ->
    S = spawn(?MODULE, timer, [100, []]),
    C1 = spawn(?MODULE, client1, [S]),
    C2 = spawn(?MODULE, client2, [S]),
    C3 = spawn(?MODULE, client3, [S]),
    C4 = spawn(?MODULE, client4, [S]).

timehelp(Time, L, []) ->
    receive
        {From, register} ->
            NewL = [From] ++ L,
            timer(Time, NewL)
    end,
    timer(Time, L);
timehelp(Time, L, [H | T]) ->
    timer:send_after(Time, H, {tick}),
    timehelp(Time, L, T).

timer(Time, L) ->
    timehelp(Time, L, L).

client1(S) ->
    S ! {self(), register},
    receive
        {tick} ->
            io:format("Received a tick ~n")
    end,
    client1(S).

client2(S) ->
    S ! {self(), register},
    receive
        {tick} ->
            io:format("Received a tick ~n")
    end,
    client2(S).

client3(S) ->
    S ! {self(), register},
    receive
        {tick} ->
            io:format("Received a tick ~n")
    end,
    client3(S).

client4(S) ->
    S ! {self(), register},
    receive
        {tick} ->
            io:format("Received a tick ~n")
    end,
    client4(S).
