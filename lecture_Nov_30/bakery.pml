byte np,nq = 0;

active proctype P(){
    do
      :: np = nq + 1;
        do
          :: nq == 0 || np<=nq -> break
          :: skip
        od;
}