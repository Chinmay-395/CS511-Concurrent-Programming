% Author: Ming Lin & Connor Haaf
% I pledge my honor that I have abided by the Stevens honor system
-module(server).

-export([start_server/0]).

-include_lib("./defs.hrl").

-spec start_server() -> _.
-spec loop(_State) -> _.
-spec do_join(_ChatName, _ClientPID, _Ref, _State) -> _.
-spec do_leave(_ChatName, _ClientPID, _Ref, _State) -> _.
-spec do_new_nick(_State, _Ref, _ClientPID, _NewNick) -> _.
-spec do_client_quit(_State, _Ref, _ClientPID) -> _NewState.
start_server() ->
  catch unregister(server),
  register(server, self()),
  case whereis(testsuite) of
    undefined ->
      ok;
    TestSuitePID ->
      TestSuitePID ! {server_up, self()}
  end,
  loop(#serv_st{nicks = maps:new(), %% nickname map. client_pid => "nickname"
                registrations = maps:new(), %% registration map. "chat_name" => [client_pids]
                chatrooms = maps:new()}). %% chatroom map. "chat_name" => chat_pid

loop(State) ->
  receive
    %% initial connection
    {ClientPID, connect, ClientNick} ->
      NewState =
        #serv_st{nicks = maps:put(ClientPID, ClientNick, State#serv_st.nicks),
                 registrations = State#serv_st.registrations,
                 chatrooms = State#serv_st.chatrooms},
      loop(NewState);
    %% client requests to join a chat
    {ClientPID, Ref, join, ChatName} ->
      NewState = do_join(ChatName, ClientPID, Ref, State),
      loop(NewState);
    %% client requests to join a chat
    {ClientPID, Ref, leave, ChatName} ->
      NewState = do_leave(ChatName, ClientPID, Ref, State),
      loop(NewState);
    %% client requests to register a new nickname
    {ClientPID, Ref, nick, NewNick} ->
      NewState = do_new_nick(State, Ref, ClientPID, NewNick),
      loop(NewState);
    %% client requests to quit
    {ClientPID, Ref, quit} ->
      NewState = do_client_quit(State, Ref, ClientPID),
      loop(NewState);
    {TEST_PID, get_state} ->
      TEST_PID ! {get_state, State},
      loop(State)
  end.

%% executes join protocol from server perspective
do_join(ChatName, ClientPID, Ref, State) -> %% TODO
  case maps:is_key(ChatName, State#serv_st.chatrooms) of

    true -> % if the chatname already exists...
      
      {ok, ChatPID} = maps:find(ChatName, State#serv_st.chatrooms), %focus on registartions and correlated values
      {ok, ClientNick} = maps:find(ClientPID, State#serv_st.nicks),
      {ok, Prev} = maps:find(ChatName, State#serv_st.registrations),

      ChatPID ! {self(), Ref, register, ClientPID, ClientNick},

      NewReg = maps:put(ChatName, [ClientPID] ++ Prev, State#serv_st.registrations),
      #serv_st{nicks = State#serv_st.nicks,
               registrations = NewReg,
               chatrooms = State#serv_st.chatrooms};

    false -> % if the chatname does not exist...
      
      ChatPID = spawn(chatroom, start_chatroom, [ChatName]), %% spawn a new chatroom
      {ok, ClientNick} = maps:find(ClientPID, State#serv_st.nicks),
      ChatPID ! {self(), Ref, register, ClientPID, ClientNick}, % corresponding registration values
      
      NewReg = maps:put(ChatName, [ClientPID], State#serv_st.registrations), %store the new registration
      NewChat = maps:put(ChatName, ChatPID, State#serv_st.chatrooms), %store the chat values
    
      #serv_st{nicks = State#serv_st.nicks, %updates
               registrations = NewReg,
               chatrooms = NewChat}
  end.

%% executes leave protocol from server perspective
do_leave(ChatName, ClientPID, Ref, State) -> %% TODO
  %get needed PID and corresponding values
  ChatPID = maps:get(ChatName, State#serv_st.chatrooms),
  RevState =
    State#serv_st{registrations =
                    maps:update(ChatName,
                                lists:delete(ClientPID,
                                             maps:get(ChatName, State#serv_st.registrations)),
                                State#serv_st.registrations)},
  ChatPID ! {self(), Ref, unregister, ClientPID},
  ClientPID ! {self(), Ref, ack_leave},
  RevState.

%% executes new nickname protocol from server perspective
do_new_nick(State, Ref, ClientPID, NewNick) -> %% TODO
  case lists:member(NewNick, maps:values(State#serv_st.nicks)) of
    %if the nickname is a user's current or another user's current give error
    true ->
      ClientPID ! {self(), Ref, err_nick_used},
      State;
    false ->
      %otherwise, let's update everything and corresponiding references
      Temp = fun(_, Y) -> lists:member(ClientPID, Y) end,
      Rooms = maps:filter(Temp, State#serv_st.registrations),
      %we have the specific places now update
      UpdateRoom =
        fun(X) ->
           {ok, PID} = maps:find(X, State#serv_st.chatrooms),
           PID ! {self(), Ref, update_nick, ClientPID, NewNick}
        end,
      lists:foreach(UpdateRoom, maps:keys(Rooms)),
      NewNicks = maps:put(ClientPID, NewNick, State#serv_st.nicks),
      ClientPID ! {self(), Ref, ok_nick},
      #serv_st{nicks = NewNicks,
               registrations = State#serv_st.registrations,
               chatrooms = State#serv_st.chatrooms}
  end.

%helper method for the do client quit class
client_quit_help(State, Ref, ClientPID, Room) ->
  %find referenced specific room and current state
  case maps:find(Room, State#serv_st.registrations) of
    {ok, ClientPIDs} ->
      case lists:any(fun(X) -> X == ClientPID end, ClientPIDs) of
        %we have reached target element -> unregister from here
        true ->
          case maps:find(Room, State#serv_st.chatrooms) of
            {ok, ChatroomPID} ->
              ChatroomPID ! {self(), Ref, unregister, ClientPID}
          end;
        false ->
          pass
      end
  end.

%% executes client quit protocol from server perspective
do_client_quit(State, Ref, ClientPID) -> %% TODO
  %get the revised nicknames and registrations
  NewNick = maps:remove(ClientPID, State#serv_st.nicks),
  RevReg =
    maps:map(fun(X, Y) when is_list(X) -> lists:delete(ClientPID, Y) end,
             State#serv_st.registrations),
  % utilize helper map
  lists:map(fun(X) -> client_quit_help(State, Ref, ClientPID, X) end,
            maps:keys(State#serv_st.chatrooms)),
  ClientPID ! {self(), Ref, ack_quit},
  State#serv_st{nicks = NewNick, registrations = RevReg}.
