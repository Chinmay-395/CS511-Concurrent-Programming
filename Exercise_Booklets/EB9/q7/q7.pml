byte np=0;
byte nq =0;
active proctype P(){
  do
  // non - critical section
    :: np = nq + 1;
    do
      :: !(nq ==0 || np <= nq) -> break
    od;
  // CRITICAL SECTION
  np = 0;
  // non - critical section
  od;
}

active proctype Q(){
  do
    
      // non - critical section
      :: nq = np + 1;
      do
       ::  !(np ==0 || nq < np) -> break
          // CRITICAL SECTION
      od;
       nq = 0;
      // non - critical SECTION
  od;
}