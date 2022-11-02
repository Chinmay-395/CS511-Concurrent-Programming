-module(records).
-include("records.hrl").
-compile(nowarn_export_all).
-compile(export_all).

-record(robot, {name, type = industrial, hobbies, details = []}).

first_robot() ->
    #robot{
        name = " Mechatron ",
        type = handmade,
        details = [" Moved by a small man inside "]
    }.

repairman(Rob) ->
    Details = Rob#robot.details,
    NewRob = Rob#robot{details = [" Repaired by repairman " | Details]},
    {repaired, NewRob}.

included() -> #included{some_field = " Some value "}.
