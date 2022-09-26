import java.util.concurrent.Semaphore
Semaphore a = new Semaphore(0)
Semaphore b = new Semaphore(0)
20.times{
Thread.start {
    a.release() 
    print("A")
    
    // print("B")
    b.acquire()
    // print("C")
} }
20.times{
    Thread.start {
    
    print("B")
    a.acquire()
    // print("F")
    b.release()
    // print("G")
}
}
