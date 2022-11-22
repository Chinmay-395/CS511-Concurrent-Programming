loop(noninitiator,NPIDs,Rec,Parent,Tree) ->  

    receive

    {_From,W} ->

        if

        Rec+1 == length(NPIDs) ->  %% got replies from all neighbors

            Parent!{self(),[{Parent,parent_of,self()} | W++Tree]};

        true ->                    %% wait for more messages

            loop(noninitiator,NPIDs,Rec+1,Parent,Tree++W)

        end

    end;

 

%% Initiator node

%% - receive {_From,W} message

%% - if got replies from all neighbors, print out spanning tree (io:format("done ~w~n",[W++Tree])😉

%% - otherwise, wait for more messages (recursive call)  

loop(initiator,NPIDs,Rec,undef,Tree) ->  

    receive

    {_From,W} ->

        if

        Rec+1 == length(NPIDs) ->  %% got replies from all neighbors

            io:format("done ~w~n",[W++Tree]);

        true ->                    %% wait for more messages

            loop(initiator,NPIDs,Rec+1,undef,Tree++W)

        end

    end.