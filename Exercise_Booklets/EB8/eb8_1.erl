-module(eb8_1).
% -module(turnstile).
-compile(export_all).
%% Spawns a counter and N turnstile clients
start(N) ->
    C = spawn(?MODULE, counter_server, [0]),
    [spawn(?MODULE, turnstile, [C, 50]) || _ <- lists:seq(1, N)],
    C.

%% State is the current value of the counter
counter_server(State) ->
    receive
        {bump} ->
            counter_server(State + 1);
        {read, From} ->
            From ! {State},
            counter_server(State)
    end.

turnstile(_C, 0) ->
    done;
%%C is the PID of the coutner, and N the number of times the turnstile turns.
turnstile(C, N) when N > 0 ->
    C ! {bump},
    turnstile(C, N - 1).
