-module(updating_fact).
-compile(export_all).
fact(0) ->
    1;
fact(N) when N > 0 ->
    N * fact(N - 1).
loop(C,F) ->
    receive
        {From, Ref, N, op} ->
            From ! {res, Ref, F(N)},
            loop(C + 1,F);
        {From, Ref, read} ->
            From ! {res, Ref, C},
            loop(C,F);
        {From, G, update} ->
            loop(C,G);
        stop ->
            stop
    end.
start() ->
    S = spawn(?MODULE, loop, [0, fun fact/1]).
