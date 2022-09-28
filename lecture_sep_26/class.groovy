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
            if(t==N) {barrier.release()}//we dont want to use ```N.times{barrier.release()}``` because it will cause too many releases which will overflow int the stack
            else{
                t++;
                if(t==N){
                    N.times{barrier.release()}
                }
            }
            

            mutex.release()
            //barrier
            barrier.acquire()
        }
    }
}