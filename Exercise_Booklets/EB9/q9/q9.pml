inline acquire(sem){
atomic {
    if(sem>0)
        sem--;
    }
}
inline release(sem){
    sem++;
}