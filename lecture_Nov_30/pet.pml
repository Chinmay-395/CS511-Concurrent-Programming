byte last = 1;
bool wantP = false;
bool wantQ = false;

active proctype P() {
  do
    :: wantP = true;
    :: last = 1;
    
    :: (wantQ==false || last == 2) ->  
      printf("P");
      wantP = false;
    :: else -> break
  od;
}

active proctype Q() {
  do
    :: wantQ = true;
    :: last = 1;
    
    :: (wantP==false || last == 1) ->  
      printf("Q");
      wantQ = false;
    :: else -> break
  od;
}
