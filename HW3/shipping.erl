-module(shipping).
-compile(export_all).
-include_lib("./shipping.hrl").

get_ship(Shipping_State, Ship_ID) ->
    lists:keyfind(Ship_ID, #ship.id, Shipping_State#shipping_state.ships).

print_ship(Shipping_State) ->
    Shipping_State#shipping_state.ship_inventory.

print_func(Shipping_State) ->
    element(
        2,
        maps:find(2, Shipping_State#shipping_state.ship_inventory)
    ).
get_container(Shipping_State, Container_ID) ->
    lists:keyfind(Container_ID, #container.id, Shipping_State#shipping_state.containers).

get_port(Shipping_State, Port_ID) ->
    lists:keyfind(Port_ID, #port.id, Shipping_State#shipping_state.ports).

% getAllShipLocations(Shipping_State) -> Shipping_State#shipping_state.ship_locations.

% someHelper(List_of_tuples,Port_ID) ->
% 	F =
% 		fun ({P,D,S}) ->
% 			if
% 				(P==Port_ID) -> false;
% 			(_) -> true end,
% 	lists:filter(F,List_of_tuples).

get_occupied_docks(Shipping_State, Port_ID) ->
    [
        Dock
     || {Port, Dock, Ship} <- Shipping_State#shipping_state.ship_locations,
        (Port == Port_ID)
    ].
% Will every ship have unique locations
get_the_list(Shipping_State, Ship_ID) ->
    [
        {Port, Dock}
     || {Port, Dock, Ship} <- Shipping_State#shipping_state.ship_locations,
        (Ship == Ship_ID)
    ].
% 🛑At any given instance will the ship have only one location,
%  will it have a lists of location or a single location
% I know if we want multiple locations of a ship
% Locations = [
%     {1, 'B', 1},
%     {1, 'A', 3},
%     {3, 'C', 2},
%     {2, 'D', 4},👈️
%     {3, 'A', 4},👈️
%     {2, 'B', 5}
%  ]
% should I check for the error handling for the above case
get_ship_location(Shipping_State, Ship_ID) ->
    TheResult = [
        {Port, Dock}
     || {Port, Dock, Ship} <- Shipping_State#shipping_state.ship_locations,
        (Ship == Ship_ID)
    ],

    if
        TheResult == [] -> error;
        TheResult /= [] -> lists:nth(1, TheResult)
    end.
% Creating a helper function
sum([]) -> 0;
sum([H | T]) -> H + sum(T).
get_container_weight(Shipping_State, Container_IDs) ->
    sum(
        lists:map(
            fun(Container_ID_Val) ->
                element(3, get_container(Shipping_State, Container_ID_Val))
            end,
            Container_IDs
        )
    ).
% 🛑 The error handing here is required
get_ship_weight(Shipping_State, Ship_ID) ->
    TheContainersOfThatShip = element(2, maps:find(Ship_ID, print_ship(Shipping_State))),
    get_container_weight(Shipping_State, TheContainersOfThatShip).
% Q8
% The load_ship function takes Ship_ID -> number Container_IDs -> list
% check whether size of Container_IDs + size of Ship_Inventory is than or equal than Ship's capacity
% check at which port is the ship at from Locations
% remove the Container_IDs from Port_Inventory
% add those in ship_inventory
load_ship(Shipping_State, Ship_ID, Container_IDs) ->
    Ship_Details = element(4, get_ship(Shipping_State, 1)),
    ShipInventoryList = Shipping_State#shipping_state.ship_inventory,
    SumOfContainerWeight =
        get_list_size(Container_IDs) +
            get_list_size(element(2, maps:find(Ship_ID, ShipInventoryList))),

    % Port_Inventory = maps:get(Port_ID, Shipping_State#shipping_state.port_inventory),
    io:fwrite("~w ~n", [SumOfContainerWeight]),
    if
        SumOfContainerWeight > Ship_Details ->
            error;
        true ->
            % Port_Inventory =
            %     lists:all(
            %         fun(Container) ->
            %             lists:member(Container, Port_Inventory)
            %         end,
            %         Container_IDs
            %     ),
            false
    end.
get_list_size([]) -> 0;
get_list_size([_H | T]) -> 1 + get_list_size(T).

% Q9
% unload_ship_all(Shipping_State, Ship_ID) ->
%     ShipInventoryList = Shipping_State#shipping_state.ship_inventory,
%     Ship_Details = element(4, get_ship(Shipping_State, 1)),
%     SumOfContainerWeight =
%         get_list_size(Container_IDs) +
%             get_list_size(element(2, maps:find(Ship_ID, ShipInventoryList))),
%     io:fwrite("~w", [SumOfContainerWeight]),
%     if
%         SumOfContainerWeight > Ship_Details -> true;
%         true -> false
%     end.

% Q10
unload_ship(Shipping_State, Ship_ID, Container_IDs) ->
    io:format("Implement me!!"),
    error.
% Q11
set_sail(Shipping_State, Ship_ID, {Port_ID, Dock}) ->
    io:format("Implement me!!"),
    error.

%% Determines whether all of the elements of Sub_List are also elements of Target_List
%% @returns true is all elements of Sub_List are members of Target_List; false otherwise
is_sublist(Target_List, Sub_List) ->
    lists:all(fun(Elem) -> lists:member(Elem, Target_List) end, Sub_List).

%% Prints out the current shipping state in a more friendly format
print_state(Shipping_State) ->
    io:format("--Ships--~n"),
    _ = print_ships(
        Shipping_State#shipping_state.ships,
        Shipping_State#shipping_state.ship_locations,
        Shipping_State#shipping_state.ship_inventory,
        Shipping_State#shipping_state.ports
    ),
    io:format("--Ports--~n"),
    _ = print_ports(
        Shipping_State#shipping_state.ports, Shipping_State#shipping_state.port_inventory
    ).

%% helper function for print_ships
get_port_helper([], _Port_ID) -> error;
get_port_helper([Port = #port{id = Port_ID} | _], Port_ID) -> Port;
get_port_helper([_ | Other_Ports], Port_ID) -> get_port_helper(Other_Ports, Port_ID).

print_ships(Ships, Locations, Inventory, Ports) ->
    case Ships of
        [] ->
            ok;
        [Ship | Other_Ships] ->
            {Port_ID, Dock_ID, _} = lists:keyfind(Ship#ship.id, 3, Locations),
            Port = get_port_helper(Ports, Port_ID),
            {ok, Ship_Inventory} = maps:find(Ship#ship.id, Inventory),
            io:format("Name: ~s(#~w)    Location: Port ~s, Dock ~s    Inventory: ~w~n", [
                Ship#ship.name, Ship#ship.id, Port#port.name, Dock_ID, Ship_Inventory
            ]),
            print_ships(Other_Ships, Locations, Inventory, Ports)
    end.

print_containers(Containers) ->
    io:format("~w~n", [Containers]).

print_ports(Ports, Inventory) ->
    case Ports of
        [] ->
            ok;
        [Port | Other_Ports] ->
            {ok, Port_Inventory} = maps:find(Port#port.id, Inventory),
            io:format("Name: ~s(#~w)    Docks: ~w    Inventory: ~w~n", [
                Port#port.name, Port#port.id, Port#port.docks, Port_Inventory
            ]),
            print_ports(Other_Ports, Inventory)
    end.
%% This functions sets up an initial state for this shipping simulation. You can add, remove, or modidfy any of this content. This is provided to you to save some time.
%% @returns {ok, shipping_state} where shipping_state is a shipping_state record with all the initial content.
shipco() ->
    Ships = [
        #ship{id = 1, name = "Santa Maria", container_cap = 20},
        #ship{id = 2, name = "Nina", container_cap = 20},
        #ship{id = 3, name = "Pinta", container_cap = 20},
        #ship{id = 4, name = "SS Minnow", container_cap = 20},
        #ship{id = 5, name = "Sir Leaks-A-Lot", container_cap = 20}
    ],
    Containers = [
        #container{id = 1, weight = 200},
        #container{id = 2, weight = 215},
        #container{id = 3, weight = 131},
        #container{id = 4, weight = 62},
        #container{id = 5, weight = 112},
        #container{id = 6, weight = 217},
        #container{id = 7, weight = 61},
        #container{id = 8, weight = 99},
        #container{id = 9, weight = 82},
        #container{id = 10, weight = 185},
        #container{id = 11, weight = 282},
        #container{id = 12, weight = 312},
        #container{id = 13, weight = 283},
        #container{id = 14, weight = 331},
        #container{id = 15, weight = 136},
        #container{id = 16, weight = 200},
        #container{id = 17, weight = 215},
        #container{id = 18, weight = 131},
        #container{id = 19, weight = 62},
        #container{id = 20, weight = 112},
        #container{id = 21, weight = 217},
        #container{id = 22, weight = 61},
        #container{id = 23, weight = 99},
        #container{id = 24, weight = 82},
        #container{id = 25, weight = 185},
        #container{id = 26, weight = 282},
        #container{id = 27, weight = 312},
        #container{id = 28, weight = 283},
        #container{id = 29, weight = 331},
        #container{id = 30, weight = 136}
    ],
    Ports = [
        #port{
            id = 1,
            name = "New York",
            docks = ['A', 'B', 'C', 'D'],
            container_cap = 200
        },
        #port{
            id = 2,
            name = "San Francisco",
            docks = ['A', 'B', 'C', 'D'],
            container_cap = 200
        },
        #port{
            id = 3,
            name = "Miami",
            docks = ['A', 'B', 'C', 'D'],
            container_cap = 200
        }
    ],
    %% {port, dock, ship}
    Locations = [
        {1, 'B', 1},
        {1, 'A', 3},
        {3, 'C', 2},
        {2, 'D', 4},
        {2, 'B', 5}
    ],
    Ship_Inventory = #{
        1 => [14, 15, 9, 2, 6],
        2 => [1, 3, 4, 13],
        3 => [],
        4 => [2, 8, 11, 7],
        5 => [5, 10, 12]
    },
    Port_Inventory = #{
        1 => [16, 17, 18, 19, 20],
        2 => [21, 22, 23, 24, 25],
        3 => [26, 27, 28, 29, 30]
    },
    #shipping_state{
        ships = Ships,
        containers = Containers,
        ports = Ports,
        ship_locations = Locations,
        ship_inventory = Ship_Inventory,
        port_inventory = Port_Inventory
    }.

% lists:map(fun x -> element(1,hd(x)) end,Locations).
% getStuff(L) -> element(2,hd(L)).
