bool wantP = false;
bool wantQ = false;

active proctype P()
{
    do
        :: wantP = true
        do
            :: !wantQ -> break
            :: else
        od;

        wantP = false
     od   
}

active proctype Q()
{
    do
        :: wantQ = true
        do
            :: !wantP -> break
            :: else
        od;

        wantQ = false
     od   
}