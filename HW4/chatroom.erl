% Author: Ming Lin & Connor Haaf
% I pledge my honor that I have abided by the Stevens honor system
-module(chatroom).

-include_lib("./defs.hrl").

-export([start_chatroom/1]).

-spec start_chatroom(_ChatName) -> _.
-spec loop(_State) -> _.
-spec do_register(_State, _Ref, _ClientPID, _ClientNick) -> _NewState.
-spec do_unregister(_State, _ClientPID) -> _NewState.
-spec do_update_nick(_State, _ClientPID, _NewNick) -> _NewState.
-spec do_propegate_message(_State, _Ref, _ClientPID, _Message) -> _NewState.
start_chatroom(ChatName) ->
    loop(#chat_st{
        name = ChatName,
        registrations = maps:new(),
        history = []
    }),
    ok.

loop(State) ->
    NewState =
        receive
            %% Server tells this chatroom to register a client
            {_ServerPID, Ref, register, ClientPID, ClientNick} ->
                do_register(State, Ref, ClientPID, ClientNick);
            %% Server tells this chatroom to unregister a client
            {_ServerPID, _Ref, unregister, ClientPID} ->
                do_unregister(State, ClientPID);
            %% Server tells this chatroom to update the nickname for a certain client
            {_ServerPID, _Ref, update_nick, ClientPID, NewNick} ->
                do_update_nick(State, ClientPID, NewNick);
            %% Client sends a new message to the chatroom, and the chatroom must
            %% propegate to other registered clients
            {ClientPID, Ref, message, Message} ->
                do_propegate_message(State, Ref, ClientPID, Message);
            {TEST_PID, get_state} ->
                TEST_PID ! {get_state, State},
                loop(State)
        end,
    loop(NewState).

%% This function should register a new client to this chatroom

%% TODO
do_register(State, Ref, ClientPID, ClientNick) ->
    UpdatedState =
        State#chat_st{
            registrations =
                maps:put(ClientPID, ClientNick, State#chat_st.registrations)
        },
    ClientPID ! {self(), Ref, connect, State#chat_st.history},
    io:format("~w ~n", [State#chat_st.history]),
    UpdatedState.

%% This function should unregister a client from this chatroom

%% TODO
do_unregister(State, ClientPID) ->
    %% reset registrations w unregistered client
    State#chat_st{registrations = maps:remove(ClientPID, State#chat_st.registrations)}.

%% This function should update the nickname of specified client.

%% TODO
do_update_nick(State, ClientPID, NewNick) ->
    %%update order: value to change, new value, and list
    State#chat_st{
        registrations =
            maps:update(ClientPID, NewNick, State#chat_st.registrations)
    }.

%% This function should update all clients in chatroom with new message
%% (read assignment specs for details)

%% TODO
do_propegate_message(State, Ref, ClientPID, Message) ->
    ClientPID ! {self(), Ref, ack_msg},
    Temp = fun(T, _X) -> T =/= ClientPID end,
    %contain the clients corresponding to this value location
    Clients =
        maps:keys(
            maps:filter(Temp, State#chat_st.registrations)
        ),
    {ok, NewNick} = maps:find(ClientPID, State#chat_st.registrations),
    %list and collect the relevant values of new clients
    NewClients =
        fun(Z) ->
            Z ! {request, self(), Ref, {incoming_msg, NewNick, State#chat_st.name, Message}}
        end,
    io:format("~w name: ~n", [State#chat_st.name]),
    io:format("~w history: ~n", [State#chat_st.history]),
    lists:foreach(NewClients, Clients),
    #chat_st{
        name = State#chat_st.name,
        registrations = State#chat_st.registrations,
        history = State#chat_st.history ++ [{NewNick, Message}]
    }.
