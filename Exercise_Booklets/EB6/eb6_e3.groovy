// Non Cyclic Barriers
// Countdown Latch

class Barrier{
  private static final int threshold = 3;
  private static int arrivedThreads = 0;

  synchronized void waitAtBarrier(){
    arrivedThreads++;
    
    while (arrivedThreads < threshold) {
      wait();
    }

    notify(); // cascading signaling, one thread will wake another ultimately waking all threads
  }
}

Barrier barrier = new Barrier();

Thread.start { // Thread 1
  println("a");
  barrier.waitAtBarrier();
  println("1");
}

Thread.start { // Thread 2
  println("b");
  barrier.waitAtBarrier();
  println("2");
}

Thread.start { // Thread 3
  println("c");
  barrier.waitAtBarrier();
  println("3");
}