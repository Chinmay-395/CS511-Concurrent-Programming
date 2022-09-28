import java.util.concurrent.Semaphore
Semaphore x_mutex = new Semaphore(0)
int y = 0, z = 0;
Thread.start { // P
    while(true){
        int x;
        x = y + z;
        print(x)
    }
    
}
Thread.start { // Q
    while(true){
    y = 1;
    x_mutex.acquire()
    z = 2;}
}