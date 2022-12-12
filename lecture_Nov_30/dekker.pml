byte turn = 1;
bool wantp = false;
bool wantq = false;

active proctype P(){
    do
        :: wantp = true;
            do
                :: !wantq -> break
                :: else ->
                    if
                        :: turn == 1 ->
                            wantq = false;
                            do
                                :: turn == 1 -> break
                                :: else -> skip
                            od;
                            wantp = true;
                        :: else
                    fi
            od;

            

}
