
/*
Quiz 3 - 28 Sep 2022
Name: Chinmay Dali & Sachin Devangan

You may only declare semaphores and add acquire/release instructions.
The out put should be:

a(b+c)da(b+c)da(b+c)da(b+c)da(b+c)d....

*/

import java.util.concurrent.Semaphore;
// Semaphore declarations
Semaphore a = new Semaphore(1)
Semaphore bORc = new Semaphore(0)
Semaphore d = new Semaphore(0)


Thread.start { // P
    while (true) {
        a.acquire()
	    print("a");
        bORc.release()

    }
}

Thread.start { // Q 

    while (true) {
        bORc.acquire()
	    print("b");
        d.release()
    }
}


Thread.start { // R

    while (true) {
        bORc.acquire()
	    print("c");
        d.release()
    }
}


Thread.start { // S

    while (true) {
        d.acquire()
	    print("d");
        a.release()
    }
}
/*
abdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacd
abdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacd
abdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdabdacdab
*/ 