import java.util.concurrent.Semaphore
Semaphore allowDec = new Semaphore(0)
Semaphore p = new Semaphore(0)
Semaphore q = new Semaphore(0)
int n2=0
int n=50
P = Thread.start{
    
    while(n>0){
        q.acquire()
        n=n-1
        p.release()
    }
    
}
Thread.start{
    while(true){
        q.release()
        n2=n2+2*n+1
        p.acquire()
        allowDec.release()
        
    }
    
}
P.join()
allowDec.acquire() // why is this here?
print(n2)