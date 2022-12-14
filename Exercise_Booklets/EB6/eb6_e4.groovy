import java.util.concurrent.locks.*;

// declarations
class TrainStation {
    int north_train_state=0; // for printing state //north-train-container
    int south_train_state=0; // for printing state //south-train-container

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
			while (nt) {
				// println("WAITING acquire North Track Passenger")
				north.await()}; 
			nt=true;

	    	north_train_state++;
	    	printState("acquire North Track Passenger");
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

	    	north_train_state--;
	    	printState("release North Track Passenger");
			} finally {
	    	lock.unlock();
      }
    }

    void acquireSouthTrackP() {
			lock.lock();
      try {
	    	// complete
				while(st) {
					// println("WAITING acquire South Track Passenger")
				south.await()};
				st=true;

	    	south_train_state++;
	    	printState("acquire South Track Passenger");
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

	    	south_train_state--;
	    	printState("release North Track Passenger");
			} finally {
	    	lock.unlock();
      }
    }

    void acquireTracksF() {
			lock.lock();
      try {
	    	// complete
				while(nt || st) {
					// println ("WAITING acquire Track Freight")
					freight.await()};

				nt = true;
				st = true;

	    	north_train_state++;
	    	south_train_state++;
	    	printState("acquire Track Freight");
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
	    
	    	north_train_state--;
	    	south_train_state--;
	    	printState("release Track Freight");
			} finally {
	    	lock.unlock();
      }
    }

    void printState(x) {
			lock.lock();
			try {
				println "STATE: north_train_state: "+north_train_state+", south_train_state: "+south_train_state;	    
				// println x
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
			print "FT "+ id+" "+"\n";
			s.releaseTracksF()
    }
}

5.times{
    int id = it;
    Thread.start { // Passenger Train going North
			s.acquireNorthTrackP();
			print " NPT "+ id+" "+"\n";
			s.releaseNorthTrackP();
    }
}

5.times{
    int id = it;
    Thread.start { // Passenger Train going South
			s.acquireSouthTrackP();
			print " SPT "+ id+" "+"\n";
			s.releaseSouthTrackP();
    }
}
