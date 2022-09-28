 import java.util.concurrent.Semaphore;

 int counter = 0;
 Semaphore mutex = new Semaphore (1);
 Semaphore s = new Semaphore (-1);

 Thread . start { // turnstile
 10. times {
    mutex.acquire();
    counter++;
   print ( counter );
    mutex.release();
 }
 print("I RAN")
 s.release ();
 print("I RAN 2")
}
// Thread . start { // turnstile
// 10. times {
// mutex . acquire ();
// counter ++;
// mutex . release ();
// }
// s . release ();
// }
print("I RAN BEFORE ACQUIRE ")
s.acquire()
print ( counter );