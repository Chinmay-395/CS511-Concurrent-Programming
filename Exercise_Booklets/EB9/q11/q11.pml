#define N 3 /* Number of Washing Machines */
#define C 10 /* Number of Washing Machines */

byte permToProcess [ N ]
byte doneProcessing [ N ]
byte station0 = 1
byte station1 = 1
byte station2 = 1

byte c0=0;
byte c1=0;
byte c2=0;

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
    c0=c0+1;
    assert(c0==1);
    c0 =c0-1;
    release(permToProcess[0]);
    acquire(doneProcessing[0]);

    /* Station 1 */
    acquire(station1);
    //checking 2 cars in station
    c1 =c1+1;
    assert(c1==1);
    c1 =c1-1;
    //removing car from station 0
    
    release(station0);
    
    
    
    release(permToProcess[1]);
    acquire(doneProcessing[1]);

    /* Station 2 */
    acquire(station2);

    c2 =c2+1;
    assert(c2==1);
    c2 =c2-1;
    
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