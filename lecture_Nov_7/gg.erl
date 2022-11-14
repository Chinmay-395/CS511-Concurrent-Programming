-module(gg).
-compile(export_all).
servlet(N) ->
    receive
        {From, G, guess} ->
            case G == N of
                true ->
                    From ! {gotIt};
                _ ->
                    From ! {tryAgain},
                    servlet(N)
            end
    end.
%% servlet(N) ->
%%     receive
%%  {From,G,guess} when G==N ->
%%      From!{gotIt};
%%  {From,G,guess} when G/=N ->
%%      From!{tryAgain},
%%      servlet(N)
%%     end.
server() ->
    receive
        {From, start} ->
            S = spawn(?MODULE, servlet, [rand:uniform(100)]),
            From ! {ok, S},
            server()
    end.
client(S) ->
    S ! {self(), start},
    receive
        {ok, Servlet} ->
            client_loop(Servlet, rand:uniform(100), 0)
    end.
client_loop(Servlet, N, C) ->
    Servlet ! {self(), N, guess},
    receive
        {gotIt} ->
            io:format("Client ~p guessed in ~w tries ~n", [self(), C]);
        {tryAgain} ->
            client_loop(Servlet, rand:uniform(100), C + 1)
    end.
start(N) ->
    S = spawn(?MODULE, server, []),
    [spawn(?MODULE, client, [S]) || _ <- lists:seq(1, N)].
