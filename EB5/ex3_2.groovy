import java.util.concurrent.Semaphore;


// Declare semaphores here
Semaphore permToBoard = [new Semaphore(0), new Semaphore(0)];
Semaphore gotOnBoard = new Semaphore(0);
Semaphore permToGetOff = new Semaphore(0);
Semaphore gotOff = new Semaphore(0);
int N = 10;
Thread.start { // Ferry
    int coast=0;

    while (true) {
        // allow passengers on
        N.times { permToBoard[coast].release()}
        N.times { gotOnBoard.acquire() }
        // move to opposite coast
        coast = 1-coast;
        // wait for all passengers to get off
        N.times { permToGetOff.release()}
        N.times { gotOff.acquire() }
    }
}

100. times {
    Thread.start { // Passenger on East coast
        // get on
        permToBaord[0].acquire()
        gotOnBoard.release()
        // get off at opposite coast
        permToGetOff.release()
        gotOff.acquire()
    }
}

100. times {
    Thread.start { // Passenger on West coast
        permToBaord[1].acquire()
        gotOnBoard.release()
        // get off at opposite coast
        permToGetOff.release()
        gotOff.acquire()
    }
}
return;