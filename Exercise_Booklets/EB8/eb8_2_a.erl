-module(eb8_2_a).
-compile(nowarn_export_all).
-compile(export_all).
start() ->
    S = spawn(?MODULE, server, [""]),
    [spawn(?MODULE, client, [S]) || _ <- lists:seq(1, 5)].

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
            io:format("Done Client-Pid: ~p  ~n The Final String: ~s ~n The Server-Pid: ~p ~n", [self(), Str,S])
    end.

server(NewStr) ->
    receive
        {start,_From} ->
            server(NewStr);
        {add, Char, _From} ->
            server(NewStr++Char );
        {done, From} ->
            From ! {self(), NewStr}
    end.
    
