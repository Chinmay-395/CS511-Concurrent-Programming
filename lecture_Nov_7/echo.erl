-module(echo).
-export([start/0]).

echo() ->
    receive
        {From, Msg} ->
            From ! {Msg},
            echo();
        stop ->
            true
    end.
start() ->
    % Returns pid of a new process
    Pid = spawn(fun echo/0),
    % started by the application of echo/0 to []

    % Sending tokens to the server
    Token = "Hello Server!",
    Pid ! {self(), Token},
    io:format("Sent ~s~n", [Token]),
    receive
        {Msg} ->
            io:format("Received ~s~n", [Msg])
    end,
    % Stop server
    Pid ! stop.
