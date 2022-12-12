byte turn ;
bool flags [ 3 ] ;

proctype P () {
    byte myId = _pid -1;
    /* complete here */
    byte left = (myId+2)%3;
    byte right = (myId+1)%3;
    do
        ::
            (flags[left] || flags[right]) ->
                if
                    :: turn == left ->
                        flags[myId] = false;
                        do 
                            :: !(turn==myId) ->break;
                        od;
                        flags[myId] = true;
                fi;
    od;
    turn = right
    flags[myId]=false;


}
init {
    turn =0;
    byte i ;

    for ( i :0..2) { 
        flags [ i ] = false ; 
    }

    atomic {
        for ( i :0..2) { run P (); }
    }
}