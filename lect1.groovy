import java.util.concurrent.Semaphore

int x=0
Semaphore a = new Semaphore(0)
Semaphore b = new Semaphore(0)

Thread.start {
    print("A")
    a.release()
    print("B")
    b.acquire()
    print("C")
} 
Thread.start {
    
    print("E")
    a.acquire()
    print("F")
    b.release()
    print("G")
}