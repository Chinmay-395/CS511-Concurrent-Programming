%%% Stub for Quiz 5
% Chinmay Dali
% Sachin Devangan
% We have changed the module name to calc_stub
-module(calc_stub).
-compile(nowarn_export_all).
-compile(export_all).

env() -> #{"x" => 3, "y" => 7}.

e1() ->
    {add, {const, 3}, {divi, {var, "x"}, {const, 4}}}.

e2() ->
    {add, {const, 3}, {divi, {var, "x"}, {const, 0}}}.

e3() ->
    {add, {const, 3}, {divi, {var, "r"}, {const, 4}}}.

eval({const, N}, _E) ->
    {val, N};
eval({var, Id}, E) ->
    case maps:find(Id, E) of
        {ok, N} ->
            {val, N};
        error ->
            throw(unbound_identifier_error)
    end;
eval({add, E1, E2}, E) ->
    {val, Num1} = eval(E1, E),
    {val, Num2} = eval(E2, E),
    {val, Num1 + Num2};
eval({sub, E1, E2}, E) ->
    {val, Num1} = eval(E1, E),
    {val, Num2} = eval(E2, E),
    {val, Num1 - Num2};
eval({mult, E1, E2}, E) ->
    {val, Num1} = eval(E1, E),
    {val, Num2} = eval(E2, E),
    {val, Num1 * Num2};
eval({divi, E1, E2}, E) ->
    {val, Num1} = eval(E1, E),
    {val, Num2} = eval(E2, E),
    case Num2 == 0 of
        true ->
            throw(division_by_zero_error);
        false ->
            {val, Num1 div Num2}
    end.
% Shell output
% 6> calc_stub : eval ( calc_stub : e1 () , calc_stub : env ()).
% {val,3}
% 7> calc_stub : eval ( calc_stub : e2 () , calc_stub : env ()).
% ** exception throw: division_by_zero_error
%      in function  calc_stub:eval/2 (calc_stub.erl, line 46)
%      in call from calc_stub:eval/2 (calc_stub.erl, line 31)
% 8> calc_stub : eval ( calc_stub : e3 () , calc_stub : env ()).
% ** exception throw: unbound_identifier_error
%      in function  calc_stub:eval/2 (calc_stub.erl, line 27)
%      in call from calc_stub:eval/2 (calc_stub.erl, line 42)
%      in call from calc_stub:eval/2 (calc_stub.erl, line 31)
% 9> 
