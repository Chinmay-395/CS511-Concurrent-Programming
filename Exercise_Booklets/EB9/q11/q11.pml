#define N 3 /* Number of Washing Machines */
#define C 10 /* Number of Washing Machines */

byte permToProcess [ N ]
byte doneProcessing [ N ]
byte station0 = 1
byte station1 = 1
byte station2 = 1

byte criticalPerm2Process[N];
byte criticalDone2Process[N];

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
    acquire(station0);
    release(permToProcess[0]);
    acquire(doneProcessing[0]);
    acquire(station1);
    release(station1);
    release(permToProcess[1]);
    acquire(doneProcessing[1]);
    acquire(station2);
    release(station1);
    release(permToProcess[2]);
    acquire(doneToProcess[2]);
    release(station2)
}

proctype Machine( int i )
{
    /* complete *
    acquire(permToProcess[i]);
    release(doneProcessing[i]);
}



init {
    byte i ;
    for ( i :0..( N -1)) {
        permToProcess [ i ] =0;
        doneProcessing [ i ] =0;
    }

    atomic {
        for ( i :1..( C )) {
            run Car ();

        }


        for ( i :0..( N -1)) {
            run Machine ( i );
        }
    }
}