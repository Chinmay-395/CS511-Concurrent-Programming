import java . util . concurrent . Semaphore ;

 // Declare semaphores here
Semaphore resource = new Semaphore(1)
Semaphore s1 = new Semaphore(1)
Semaphore s2 = new Semaphore(1)
int N
int dog = 0
int cat = 0

 20. times {

Thread . start { // Cat

    s1.acquire()
    cat++
    if(cat == 1){
        resource.acquire()
    }
    s1.release()
    print("cat goes in \n")
    s1.acquire()
    cat--
    if(cat == 0){
        resource.release()
    }
    s1.release()
    }

 }

 20.times{

    Thread . start { // Dog

    s2.acquire()
    dog++
    if(dog == 1){
        resource.acquire()
    }
    s2.release()
    print("dog goes in \n")
    s2.acquire()
    dog--
    if(dog == 0){
        resource.release()
    }
    s2.release()

    }

}