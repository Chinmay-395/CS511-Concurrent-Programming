import java.util.concurrent.locks.*;
class SmartGrid {
    int num_p = 0;
    int num_c = 0;
    final int max_p = 5;
    
    Lock lock = new ReentrantLock();

    Condition producer = lock.newCondition();
    Condition consume = lock.newCondition();

    void startConsuming() { 
        // println "startConsuming running"

        lock.lock();
        // println("printing")
        try {
            while (num_c >= num_p) {
                consume.await();
            }
            num_c++;
            print("WORKED"+num_c)
            // printState()
            println ("num_p: "+num_p+", num_c: "+num_c);
        } finally {
            lock.unlock();
        }
    }

    void stopConsuming() {
        lock.lock();
        try {
            num_c--;
            // printState()
            println "num_p: "+num_p+", num_c: "+num_c;
            producer.signal();
        } finally {
            lock.unlock();
        }
    }

    void startProducing() {
        lock.lock();
        try {
            while (num_p >= max_p) {
                producer.await();
            }
            num_p++;
            // printState()
            println "num_p: "+num_p+", num_c: "+num_c;
            consume.signal();
        } finally {
            lock.unlock();
        }
    }

    void stopProducing() {
        lock.lock();         
        try {
            while (num_p <= num_c) {
                producer.await();
            }
            num_p--;
            // printState()
            println "num_p: "+num_p+", num_c: "+num_c;
            producer.signal();
        } finally {
            lock.unlock();
        }
    }

}
SmartGrid grid = new SmartGrid();
println("STARTED")
10.times {
    Thread.start {
        println("Hey")
        grid.startConsuming();
        // sleep(3000);
        grid.stopConsuming();
        grid.startProducing();
        // sleep(5000);
        grid.stopProducing();
    }
}
