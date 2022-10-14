import java.util.concurrent.locks.*;
class SmartGrid {
    int num_p = 0;
    int num_c = 0;
    final int max_p = 5;
    
    Lock lock = new ReentrantLock();

    Condition producer = lock.newCondition();
    Condition consume = lock.newCondition();

    void startConsuming() {

        lock.lock();
        // print("RUNNING")
        try {
            while (num_c >= num_p) {
                consume.await();
            }
            num_c++;
            print("WORKED"+num_c)
            // printState()
            println "num_p: "+num_p+", num_c: "+num_c;
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

    /* Producer Priority
    void stopProducing() { 
        lock.lock();
        try {
            if (num_p <= num_c) {
                num_c--;
            }
            num_p--;
            producer.signal();
        } finally {
            lock.unlock();
        }
    }    
    */   
    // void printState() {
    //      lock.lock();
    //      try {
    //          println "num_p: "+num_p+", num_c: "+num_c;	    
    //      } finally {
    //          lock.unlock();
    //      }
    //  }

}
// class SmartGrid {
//     int noOfProducers = 0;
//     int noOfConsumers = 0;
//     int N = 20;
    
//     void startProducing() {
//         while (noOfProducers >= N) {
//             wait();
//         }
//         noOfProducers++;
//         notifyAll();
//     }
//     void stopProducing() {
//         while(noOfConsumers <= noOfProducers) {
//             wait();
//         }
//         noOfProducers--;
//         notifyAll();
//     }
//     void startConsuming() {
//         while(noOfConsumers >= noOfProducers) {
//             wait();
//         }
//         noOfConsumers++;
//     }
//     void stopConsuming() {
//         noOfConsumers--;
//         notifyAll();
//     }
// }
// class SmartGrid {
//     int noOfProducers = 0;
//     int noOfConsumers = 0;
//     int N = 20;
    
//     synchronized void startProducing() {
//         while (noOfProducers >= N) {
//             wait();
//         }
        
//         noOfProducers++;
//         println("pro: "+noOfProducers+" con: "+noOfConsumers);
//         notifyAll();
//     }
//     synchronized void stopProducing() {
//         while(noOfConsumers <= noOfProducers) {
//             wait();
//         }
        
//         noOfProducers--;
//         println("pro: "+noOfProducers+" con: "+noOfConsumers);
//         notifyAll();
//     }
//     synchronized void startConsuming() {
//         while(noOfConsumers >= noOfProducers) {
//             wait();
//         }
//         println("pro: "+noOfProducers+" con: "+noOfConsumers);
//         noOfConsumers++;
        
        
//     }
//     synchronized void stopConsuming() {
//         noOfConsumers--;
//         println("pro: "+noOfProducers+" con: "+noOfConsumers);
//         notifyAll();
//     }
//     // void printState() {
//     //     lock.lock();
//     //     try {
//     //         println "num_p: "+num_p+", num_c: "+num_c;	    
//     //     } finally {
//     //         lock.unlock();
//     //     }
//     // }
// }

SmartGrid grid = new SmartGrid();
println("STARTED")
10.times {
    Thread.start {
        println("Hey")
        grid.startConsuming();
        sleep(300);
        grid.stopConsuming();
        grid.startProducing();
        sleep(600);
        grid.stopProducing();
    }
}