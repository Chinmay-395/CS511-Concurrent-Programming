import java.util.concurrent.Semaphore
Semaphore a = new Semaphore(2)
Semaphore b = new Semaphore(0)

Thread.start {
    print("A")
    a.release()
    print("B")
    b.acquire()
    print("C")
} 
Thread.start {
    
    print("B")
    a.acquire()
    print("F")
    b.release()
    print("G")
}