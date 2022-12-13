-module(eb8_1_new).
% -module(turnstile).
-compile(export_all).
%% Spawns a counter and N turnstile clients
start(N) ->
    C = spawn(?MODULE, counter_server, [0]),
    io:format("ALL THE VALUES FOR COUNTERS ~w ~n", [lists:seq(1, N)]),
    [spawn(?MODULE, turnstile, [C, 3]) || _ <- lists:seq(1, N)].

%% State is the current value of the counter
counter_server(State) ->
    receive
        {bump} ->
            io:format("The State of PID ~w ~n", [State]),
            counter_server(State + 1);
        {read, From} ->
            io:format("I RAN ~n"),
            From ! {State},
            counter_server(State)
    end.

turnstile(C, 0) ->
    % io:format("w ~w ~n"),
    C ! {read, self()},
    receive
        {State} ->
            io:format("ttttttt ~w ~n", [State])
    end;
%%C is the PID of the coutner, and N the number of times the turnstile turns.
turnstile(C, N) when N > 0 ->
    io:format("THE Counter: ~w The Count value ~w ~n", [C, N]),
    % io:format("THE VALUE ~w ~n", [N]),
    C ! {bump},
    % C ! {read, self()},
    % io:format("THE COUNTER Will drop ~w ~n", [N - 1]),
    turnstile(C, N - 1).
