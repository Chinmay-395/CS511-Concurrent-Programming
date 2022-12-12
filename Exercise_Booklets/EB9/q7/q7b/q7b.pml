byte np=0;
byte nq =0;
active proctype P(){
  do
  // non - critical section
    :: 
        byte temp = 0;
        temp = nq + 1;
        np=temp;
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
      :: 
        byte temp=0;
        temp = np + 1;
        nq = temp;
        do
        ::  !(np ==0 || nq < np) -> break
            // CRITICAL SECTION
        od;
        nq = 0;
      // non - critical SECTION
  od;
}