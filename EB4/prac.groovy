import java.util.concurrent.Semaphore
Semaphore a = new Semaphore(2)
Semaphore b = new Semaphore(0)

Thread.start {
    

    print("A")
    print("B")
    print("C")
    a.release(2)

} 
Thread.start {
    a.acquire(2)
    print("B")
    print("F")
    print("G")
    
}