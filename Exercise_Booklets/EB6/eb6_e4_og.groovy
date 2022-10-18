/*
 Quiz 5A - 15 Oct 2021

 Name1: Ming Lin	
 Name2: Connor Haaf
 Pledge: I pledge my honor that i have abided by the stevens honor system

 */
import java.util.concurrent.locks.*;

// declarations
class TrainStation {
    int ntc=0; // for printing state
    int stc=0; // for printing state

    boolean nt=false;
    boolean st=false;

    // declare locks and condition variables
		Lock lock = new ReentrantLock();
		Condition north = lock.newCondition();
		Condition south = lock.newCondition();
		Condition freight = lock.newCondition();
    
    void acquireNorthTrackP() {
			lock.lock();
      try {
	    	// complete
				while (nt) north.await(); 
				nt=true;

	    	ntc++;
	    	printState();
			} finally {
	    	lock.unlock();
      }
    }

    void releaseNorthTrackP() {
			lock.lock();
      try {
	    	// complete
				nt=false;
				north.signal();
				freight.signal();

	    	ntc--;
	    	printState();
			} finally {
	    	lock.unlock();
      }
    }

    void acquireSouthTrackP() {
			lock.lock();
      try {
	    	// complete
				while(st) south.await();
				st=true;

	    	stc++;
	    	printState();
			} finally {
	    	lock.unlock();
      }
    }

    void releaseSouthTrackP() {
			lock.lock();
      try {
	    	// complete
				st=false;
				south.signal();
				freight.signal();

	    	stc--;
	    	printState();
			} finally {
	    	lock.unlock();
      }
    }

    void acquireTracksF() {
			lock.lock();
      try {
	    	// complete
				while(nt || st) freight.await();

				nt = true;
				st = true;

	    	ntc++;
	    	stc++;
	    	printState();
			} finally {
	    	lock.unlock();
      }
    }

    void releaseTracksF() {
			lock.lock();
      try {
	    	// complete
				freight.signal();
				north.signal();
				south.signal();

				nt = false;
				st = false;
	    
	    	ntc--;
	    	stc--;
	    	printState();
			} finally {
	    	lock.unlock();
      }
    }

    void printState() {
			lock.lock();
			try {
				println "ntc: "+ntc+", stc: "+stc;	    
			} finally {
				lock.unlock();
			}
    }
}

TrainStation s = new TrainStation();

10.times {
    int id = it;
    Thread.start { // Freight Train going in any direction
			s.acquireTracksF();
            println("FT")
			s.releaseTracksF()
    }
}

100.times{
    int id = it;
    Thread.start { // Passenger Train going North
			s.acquireNorthTrackP();
            println("NPT")
			s.releaseNorthTrackP();
    }
}

100.times{
    int id = it;
    Thread.start { // Passenger Train going South
			s.acquireSouthTrackP();
            println("SPT")
			s.releaseSouthTrackP();
    }
}
