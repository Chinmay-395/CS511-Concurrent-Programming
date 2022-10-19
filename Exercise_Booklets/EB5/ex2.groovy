import java.util.concurrent.Semaphore ;
//its exactly like the readers-writers problem
 // Declare semaphores here
Semaphore mutex = new Semaphore(1)
Semaphore mutexC = new Semaphore(1)//cats
Semaphore mutexD = new Semaphore(1)//dogs
// int N
int dogs = 0
int cats = 0

5.times{
    Thread.start { // cats
        mutex.acquire();
        mutexC.acquire()
        cats++
        if(cats == 1){
            mutexD.acquire()
        }
        mutexC.release()
        println("cats goes in "+cats)
        mutexC.acquire()
        cats--
        println("cats goes out "+cats)
        if(cats == 0){
            mutexD.release()
        }
        mutexC.release()
        mutex.release();
    }

 }

 5.times{
    Thread.start { // dogs
        mutex.acquire();
        mutexD.acquire()//if the cats inside CS thus it will block here
        dogs++
        if(dogs == 1){
            mutexC.acquire()
        }
        mutexD.release()
        println("dogs goes in "+dogs)
        mutexD.acquire()
        dogs--
        println("dogs goes in "+dogs)
        if(dogs == 0){
            mutexC.release()
        }
        mutexD.release()
        mutex.release();

    }

}