-module(eb8_6).
-compile(nowarn_export_all).
-compile(export_all).

isPrime(N) -> isPrime(N, 2).

isPrime(N, N) ->
    true;
isPrime(N, M) ->
    ChPrime = N rem M,
    if
        ChPrime == 0 -> false;
        true -> isPrime(N, M + 1)
    end.

start() ->
    S = spawn(?MODULE, server, []),
    spawn(?MODULE, client, [S]).

server() ->
    receive
        {From, N} ->
            IsP = isPrime(N),
            From ! {IsP}
    end.

client(S) ->
    Num = rand:uniform(100),
    S ! {self(), Num},
    receive
        {B} ->
            io:format("~w~n~w~n", [Num, B])
    end.
