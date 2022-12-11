-module(eb8_2).
-compile(nowarn_export_all).
-compile(export_all).
start() ->
    S = spawn(?MODULE, server, [""]),
    [spawn(?MODULE, client, [S]) || _ <- lists:seq(1, 100000)].

%%
client(S) ->
    S ! {start, self()},
    S ! {add, "h", self()},
    S ! {add, "e", self()},
    S ! {add, "l", self()},
    S ! {add, "l", self()},
    S ! {add, "o", self()},
    S ! {done, self()},
    receive
        {S, Str} ->
            io:format("Done: ~p ~s ~n", [self(), Str])
    end.

server(NewStr) ->
    % NewStr = "",
    receive
        {start, _From} ->
            io:format("1: ~n"),
            NewStr = "";
        {add, S, _From} ->
            io:format("2: ~n"),
            string:concat(NewStr, S);
        {done, From} ->
            io:format("3: ~n"),
            From ! {self(), NewStr}
    end.
