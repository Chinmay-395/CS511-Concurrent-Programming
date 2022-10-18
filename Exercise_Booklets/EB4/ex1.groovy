import java.util.concurrent.Semaphore
Semaphore mutex_a = new Semaphore(0)
Semaphore mutex_f = new Semaphore(0)
// A <-- F -- C
Thread . start { // P

    print ("A");
    mutex_a.release();
    print ("B");
    
    mutex_f.acquire();
    print ("C");
}
Thread . start { // Q
    print ("E");
    mutex_a.acquire();
    print ("F");
    mutex_f.release();
    print ("G");
}