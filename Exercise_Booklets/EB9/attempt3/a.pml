bool wantP=false;
bool wantQ=false;

byte critical = 0;

active proctype P(){
    do ::
        wantP = true;
        do
        :: if
            :: (wantQ == false) -> break;
            :: else -> skip;
            fi;
        od;
        critical++;
        assert(critical==1);
        critical--;
        wantP = false;
    od;
}


active proctype Q(){
    do ::
        wantQ = true;
        do
        :: if
            :: (wantP == false) -> break;
            :: else -> skip;
            fi;
        od;
        critical++;
        assert(critical==1);
        critical--;
        wantQ = false;
    od;
}