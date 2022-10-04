import java.util.concurrent.Semaphore;

final int N = 10;
// Declare all necessary semaphores here
// List of two semaphores
Semaphore[] permToBoard = [new Semaphore(0),new Semaphore(0)]; 
Semaphore permToContinue = new Semaphore(0);
Semaphore departTrain = new Semaphore(0);

Thread.start { // Ferry
    int coast=0;
    while (true) {
        // allow passengers on
        N.times {
            permToBoard[coast].release();
        }
        N.times {
            permToContinue.acquire();
        }
        // move to opposite coast
        println "Coast is " + coast + "\n"
        coast = 1-coast;
        println "Moved to Coast " + coast + "\n"
        // wait for all passengers to get off
        N.times {
            departTrain.release();
        }
        N.times {
            permToContinue.acquire();
        }
    }
}

100.times {
    Thread.start { // Passenger on East coast
        // get on
        permToBoard[0].acquire();
        print("passengers" + N +" onboard from East Coast go to West Coast \n")
        permToContinue.release();
        // get off at opposite coast
        departTrain.acquire();
        print("passengers arrive at West Coast from East Coast \n")
        permToContinue.release();
    }
}

100.times {
    Thread.start { // Passenger on West coast
        // get on
        permToBoard[1].acquire();
        print("passengers onboard from West Coast go to East Coast \n")
        permToContinue.release();
        // get off at opposite coast
        departTrain.acquire();
        print("passengers arrive at East Coast from West Coast \n")
        permToContinue.release();
    }
}