byte turn =1;
bool wantP = false;
bool wantQ = false;
byte c=0;
active proctype P(){
    do
        :: wantP = true;
        do
        :: !wantQ -> break;
        :: else ->
            if 
                :: turn == 2 ->
                    wantP = false;
                    
                    do
                        :: turn == 1 -> break
                        :: else -> skip
                    od;
                    wantP = true;
                :: else
            fi
        od;
        c++;
        assert(c==1);
        c--;
        progressP:
            turn = 2;
            wantP = false
        
    od
    }
    
 active proctype Q(){
    do
        :: wantQ = true;
        do
        :: !wantP -> break;
        :: else ->
            if 
                :: turn == 1 ->
                    wantQ = false;
                    
                    do
                        :: turn == 2 -> break
                        :: else -> skip 
                    od;
                    wantQ = true;
                :: else                    
            fi
                    
        od;
        c++;
        assert(c==1);
        c--;
        
            turn = 1;
            wantQ = false;
        
    od
    }