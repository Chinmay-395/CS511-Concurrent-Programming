#define N 3 /* Number of Washing Machines */
#define C 10 /* Number of Washing Machines */

byte permToProcess [ N ]
byte doneProcessing [ N ]
byte station0 = 1
byte station1 = 1
byte station2 = 1

inline acquire (sem) {
    atomic {
        sem>0;
        sem--
    }
}
inline release(sem) {
    sem++
}

proctype Car () {

}


