-module(new).
-compile(export_all).
meta_search() ->
    receive
        { request , From , Ref , Query } ->
        spawn(?MODULE,meta_search_delegate,[From,Ref,Query]),
        meta_search()
    end.
meta_search_delegate(From,Ref,Query)->
    whereis(googlePid)!{Query,self()},
    whereis(bingPid)!{Query,self()},
    whereis(yahooPid)!{Query,self()},
    receive
        {Engine1,Result1}->
        receive
            {Engine2,Result2}->
                receive
                    {Engine3,Result3}->
                        From!{response,Ref,lists:concat([Result1,Result2,Result3])}
                end
        end
    end.