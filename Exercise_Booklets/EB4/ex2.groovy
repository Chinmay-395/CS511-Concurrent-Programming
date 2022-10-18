import java.util.concurrent.Semaphore
Semaphore a = new Semaphore(0)
Semaphore l = new Semaphore(0)
Semaphore e = new Semaphore(0)
// LASER
Thread . start { // P
    
    a.acquire()
    print ("A");
    a.release()
    l.acquire()
    // e.acquire()

    print ("S");
}
Thread . start { // Q
    print ("L");
    // l.release()
    a.release()
    print ("E");
    print ("R");
}