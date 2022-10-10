import java.util.concurrent.Semaphore;

Semaphore permToLoad = new Semaphore(1);
Semaphore doneLoading = new Semaphore(0);
// Additional semaphores
List<Semaphore> tracks = [new Semaphore(1,true),new Semaphore(1,true)];
Semaphore mutex = new Semaphore(1,true);

100.times {
    int dir = (new Random()).nextInt(2);
    
    Thread.start { // PassengerTrain travelling in direction dir
        tracks[dir].acquire();
        mutex.acquire();

        print("passenger trains"+dir+"\n")
        mutex.release();
        
        tracks[dir].release();
    }
}

100.times {
    int dir = (new Random()).nextInt(2);
    Thread.start { // Freight Train travelling in direction dir
        // Make sure that no other trains are in the station
        mutex.acquire();

        tracks[dir].acquire();
    print("THE DIRECTION "+ dir+"\n")

        // Start the loading machine
        permToLoad.release();
        // Wait for loading machine to finish
        print("Loading the train \n")
        doneLoading.acquire();
        // Allow trains to enter station
        tracks[dir].release();
        mutex.release();
    }
}

Thread.start { // Loading Machine
    while (true) {
	permToLoad.acquire();
	// load freight train
	doneLoading.release();
    }
}