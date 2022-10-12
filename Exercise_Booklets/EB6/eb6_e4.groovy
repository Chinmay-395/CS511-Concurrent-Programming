/*
 Quiz 5A - 15 Oct 2021

 Name1: Ming Lin	
 Name2: Connor Haaf
 Pledge: I pledge my honor that i have abided by the stevens honor system

 */
import java.util.concurrent.locks.*;

// declarations
class TrainStation {
    int ntc=0; // for printing state //north-train-container
    int stc=0; // for printing state //south-train-container

    boolean nt=false;
    boolean st=false;

    // declare locks and condition variables
	Lock lock = new ReentrantLock();
	Condition north = lock.newCondition();
	Condition south = lock.newCondition();
	Condition freight = lock.newCondition();
    
    void acquireNorthTrackP() {
		lock.lock();
		println("Acquire N-T-P")
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
			println("Release N-R-P")
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
			println("Acquire S-T-P")
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
			println("Acquire R-T-P")
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

5.times {
    int id = it;
    Thread.start { // Freight Train going in any direction
			s.acquireTracksF();
			print "FT "+ Thread.currentThread().getId()+"\n";
			s.releaseTracksF()
    }
}

5.times{
    int id = it;
    Thread.start { // Passenger Train going North
			s.acquireNorthTrackP();
			print " NPT "+ Thread.currentThread().getId()+"\n";
			s.releaseNorthTrackP();
    }
}

5.times{
    int id = it;
    Thread.start { // Passenger Train going South
			s.acquireSouthTrackP();
			print " SPT "+ Thread.currentThread().getId()+"\n";
			s.releaseSouthTrackP();
    }
}
