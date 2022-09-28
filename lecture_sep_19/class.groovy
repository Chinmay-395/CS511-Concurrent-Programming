import java.util.concurrent.Semaphore

// Program - 1
/*
Semaphore mutex = new Semaphore(1)

Thread.start{
    mutex.acquire()
    print("P")
    mutex.release()
}


Thread.start{
    mutex.acquire()
    print("Q")
    mutex.release()
}*/
// Program - 2



Semaphore mutex = new Semaphore (1)
counter =0 // shared variable

P = Thread . start {
    50. times {

        mutex . acquire ()

        counter ++

        mutex . release ()
    }
 }
Q = Thread . start {

    50. times {

        mutex . acquire ()

        counter ++

        mutex . release ()

    }

}





P . join () // wait for P to finish
Q . join () // wait for Q to finish


println ( counter ) // print value of counter