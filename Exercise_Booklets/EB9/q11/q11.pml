#define N 3 /* Number of Washing Machines */
#define C 10 /* Number of Washing Machines */

byte permToProcess [ N ]
byte doneProcessing [ N ]
byte station0 = 1
byte station1 = 1
byte station2 = 1
/* 🛑 do I need more variables to check */
byte stationAccquired[N]={0,0,0};
/*byte criticalDone2Process[N]={0,0,0};*/

inline acquire(sem){
    atomic {
        sem>0;
        sem--
    }
}
inline release(sem){
    sem++
}

proctype Car(){
    /* Station 0 */

    acquire(station0);
    stationAccquired[0] =stationAccquired[0]+1;
    assert(stationAccquired[0]==1);
    stationAccquired[0] =stationAccquired[0]-1;
    release(permToProcess[0]);
    acquire(doneProcessing[0]);

    /* Station 1 */
    acquire(station1);
    
    stationAccquired[1] =stationAccquired[1]+1;
    assert(stationAccquired[1]==1);
    stationAccquired[1] =stationAccquired[1]-1;
    
    release(station0);
    
    
    
    release(permToProcess[1]);
    acquire(doneProcessing[1]);

    /* Station 2 */
    acquire(station2);
    
    stationAccquired[2] =stationAccquired[2]+1;
    assert(stationAccquired[2]==1);
    stationAccquired[2] =stationAccquired[2]-1;
    
    release(station1);
    
    release(permToProcess[2]);
    acquire(doneProcessing[2]);
    release(station2)
}

proctype Machine( int i )
{
    /* complete */
    do
    ::

    acquire(permToProcess[i]);
    
    

    
    release(doneProcessing[i]);
    
    od;
}



init {
    byte i ;
    for ( i :0..( N -1)) {
        permToProcess[i]=0;
        doneProcessing[i]=0;
    }

    atomic {
        for ( i :1..( C )) {
            run Car();

        }

    
        for ( i :0..( N -1)) {
            run Machine(i);
        }
    }
}