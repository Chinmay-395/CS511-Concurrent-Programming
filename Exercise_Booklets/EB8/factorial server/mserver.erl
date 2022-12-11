-module(mserver).
-compile(export_all).
-import(fact, [fact/1]).

loop(Count) ->
    receive
        {get_count, From, Ref} ->
            From ! {result, Ref, Count},
            loop(Count);
        {factorial, From, Ref, N} ->
            Result = fact(N),
            From ! {result, Ref, Result},
            loop(Count + 1);
        stop ->
            true
    end.

start() -> spawn(fun() -> loop(0) end).
