-module(eb8_2).
-compile(nowarn_export_all).
-compile(export_all).
start() ->
    S = spawn(?MODULE, server, []),
    [spawn(?MODULE, client, [S]) || _ <- lists:seq(1, 5)].

client(S) ->
    S ! {start, self()},
    receive
        {serv_pid, Serv} ->
            Serv ! {add, "h", self()},
            Serv ! {add, "e", self()},
            Serv ! {add, "l", self()},
            Serv ! {add, "l", self()},
            Serv ! {add, "o", self()},
            Serv ! {done, self()},
            receive
                {Serv, Str} ->
                    io:format("Done ~p ~s ~n", [self(), Str])
            end
    end.

servlet(Str) ->
    receive
        {add, Char, _From} ->
            servlet(string:concat(Str, Char));
        {done, From} ->
            From ! {self(), Str}
    end.

server() ->
    receive
        {start, From} ->
            S = spawn(?MODULE, servlet, [""]),
            From ! {serv_pid, S},
            server()
    end.
