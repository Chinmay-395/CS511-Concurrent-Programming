/*Chinmay Dali and Sachin Devangan*/
#define PT 5 /* Number of Passenger Trains */
#define FT 2 /* Number of Freight Trains */
byte permToLoad;   /* machine semaphores, 0 permits by default */
byte doneLoading;
byte track[2];     /* track semaphores */
byte passTrainCounterN = 0;
byte passTrainCounterS = 0;
byte freightTrainCounter = 0;
inline acquire(s) {
   atomic { 
    s>0;

    s-- }
}

inline release(s) { s++ }

proctype PassengerTrain(int i) {
  /* complete */
  acquire(track[i]);
  if(i==0)
    passTrainCounterN = passTrainCounterN + 1; 
  else
    passTrainCounterS = passTrainCounterS + 1; 
  assert(freightTrainCounter == 0 && passTrainCounter>0);
  passTrainCounter = passTrainCounter - 1;
  release(track[i]);
  
}


proctype FreightTrain() { 
  /* complete */
  acquire(track[1]);
  acquire(track[0]);
  freightTrainCounter = freightTrainCounter + 1;
  release(permToLoad);
  /**/
  acquire(doneLoading);
  
assert (freightTrainCounter==1 && passTrainCounter==0);
freightTrainCounter = freightTrainCounter - 1;
  release(track[1]);
  release(track[0]);
  
  

}

proctype LoadingMachine() {
  end1: /*  avoids invalid end-state error */
  do
  ::
      acquire(permToLoad);
      assert(freightTrainCounter>0 && passTrainCounter==0);
      release(doneLoading);
  od
  
}

init {
  byte i;
  track[0]=1;
  track[1]=1;

  atomic {
    for (i:1..(PT)) {     /* spawn passenger trains */
      do  /* randomly choose a direction */
        :: run PassengerTrain(0);break
        :: run PassengerTrain(1);break
      od
    };
    for (i:0..(FT)) {     /* spawn freight trains */
      run FreightTrain()
    };
    run LoadingMachine() /* spawn loading machine */
  }
}
