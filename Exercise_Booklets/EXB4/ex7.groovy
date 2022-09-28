import java.util.concurrent.Semaphore
Semaphore mutex = new Semaphore(0)
Semaphore mutex_a = new Semaphore(1)
Thread.start { // P
    while(true) {
        mutex_a.acquire()
        print("A");
        mutex.release()
    }
}
    Thread.start { // Q
    while(true) {
        mutex.acquire()
        print("B");
        mutex_a.release()
    }
}