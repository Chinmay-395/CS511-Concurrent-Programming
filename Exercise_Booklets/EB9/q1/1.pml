// byte x =0;

// active proctype P(){

//     do
//         :: if 
//              ::(x < 200)
//              :: x = x + 1
//             fi
//     od
// }

// active proctype Q(){

//     do
//         :: if 
//              ::(x > 0)
//              :: x = x - 1
//             fi
//     od
// }

// active proctype R(){

//     do
//         :: if 
//              ::(x == 200)
//              :: x = 0
//             fi
//     od
// }

byte x = 0;

active proctype P(){
    do
    ::
        if
        :: (x<200) -> x++;
        :: else -> break;
        fi
    od;

}

active proctype Q(){
    do
    ::
        if
        :: (x>0) -> x--;
        :: else -> break;
        fi
    od;
}

active proctype R(){
    do
    ::
        if
        :: (x==200) -> x=0;
        :: else -> break;
        fi
    od;
}