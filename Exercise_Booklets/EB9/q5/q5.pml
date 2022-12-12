bool flag[2]
bool turn
byte counter = 0;
active [2] proctype user()
{
    flag[ _pid] = true
    turn = _pid
    do
        ::if
            ::(flag[1-_pid] == false || turn == 1-_pid)->counter=counter+1;
            ::else
        fi;
    od;

    crit: 
        assert(counter==1)
        counter=counter-1;
        //skip // counterical section
    flag[_pid] = false
    assert(counter==0)
}

