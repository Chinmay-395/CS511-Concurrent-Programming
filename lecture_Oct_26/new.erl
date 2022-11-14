%%% Stub for Quiz 5
% Chinmay Dali
% Sachin Devangan

-module(new).
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
    {val, N1} = eval(E1, E),
    {val, N2} = eval(E2, E),
    {val, N1 + N2};
eval({sub, E1, E2}, E) ->
    {val, N1} = eval(E1, E),
    {val, N2} = eval(E2, E),
    {val, N1 - N2};
eval({mult, E1, E2}, E) ->
    {val, N1} = eval(E1, E),
    {val, N2} = eval(E2, E),
    {val, N1 * N2};
eval({divi, E1, E2}, E) ->
    {val, N1} = eval(E1, E),
    {val, N2} = eval(E2, E),
    case N2 == 0 of
        true ->
            throw(division_by_zero_error);
        false ->
            {val, N1 div N2}
    end.
