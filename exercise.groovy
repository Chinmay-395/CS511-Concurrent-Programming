import java.util.concurrent.Semaphore

Semaphore a = new Semaphore(2)
Semaphore b = new Semaphore(0)

Thread.start{//p
 while(true){
        a.acquire()
        print "a"
        b.release()

	}

}
Thread.start{//p

 while(true){
    b.acquire()//this grabs 1 permit at a time
    // b.acquire()
		print "b"
	}
    a.acquire(2)//this grabs 2 permits at a time


}