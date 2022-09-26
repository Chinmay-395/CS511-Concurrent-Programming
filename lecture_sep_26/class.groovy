import java.util.concurrent.Semaphore

final int N = 3
int t = 0
Semaphore barrier = new Semaphore(0)
Semaphore mutex = new Semaphore(1)
N.times{
    Thread.start{
        while(true){
            //barrier arrival protocol

            mutex.acquire()
            t++;
            
            if(t==N){
                N.times{barrier.release()}
            }

            mutex.release()
            //barrier
            barrier.acquire()
        }
    }
}