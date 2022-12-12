byte ticket = 0;
byte mutex = 1;
byte criticalJets=0;
byte criticalPats=0;
/* additional declarations here */
inline acquire (sem) {
    atomic {
        sem>0;
        sem--
    }
}
inline release(sem) {
    sem++
}

active [20] proctype Jets(){
    criticalJets=criticalJets-1;
    release(ticket);
}
/* complete */
active [20] proctype Patriots(){
    acquire(mutex);
    criticalPats=criticalPats+1;
    acquire(ticket);
    criticalJets=criticalJets+1;
    acquire(ticket);
    criticalJets=criticalJets+1;
    assert(2*criticalJets <= criticalPats)
    criticalPats=criticalPats-1;
    release(mutex);
    
}