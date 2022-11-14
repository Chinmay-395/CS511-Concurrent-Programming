-module(sem).
-compile(nowarn_export_all).
-compile(export_all).

sem_loop(??) ->    
    complete.

acquire(S) ->
    complete.

release(S) ->
    complete.

make_semaphore(Init) ->
    spawn(?MODULE,sem_loop,[Init]).


start() -> %% "main"
    S = make_semaphore(0),
    spawn(?MODULE,client1,[S]),
    spawn(?MODULE,client2,[S]),
    ok.
  
client1(S) ->
    acquire(S),
    io:format("a~n"),
    io:format("b~n").

client2(S) ->
    io:format("1~n"),
    io:format("2~n"),
    release(S).

