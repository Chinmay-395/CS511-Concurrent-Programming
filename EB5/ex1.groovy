import java.util.concurrent.Semaphore;

Semaphore ticket=new Semaphore(0);
Semaphore mutex=new Semaphore(1);

20.times{
    Thread.start{
        ticket.release();
    }
}

20.times{
    Thread.start{
        mutex.acquire();
        ticket.acquire();//ticket patri
        ticket.acquire();
        mutex.release();
    }
}
//The pattern is JPPJPPJPP....
// modified solution for Part 2:

import java.util.concurrent.Semaphore;

Semaphore ticket=new Semaphore(0);
Semaphore mutex=new Semaphore(1);
boolean itGotLate=false;

Thread.start{
    ticket.release();
}

Thread.start{
    mutex.acquire();
    if(!itGotLate){
        ticket.acquire();
        ticket.acquire();
    }
    mutex.release();
}



def itGotLate(){
    itGotLate=true;
    ticket.release();
    ticket.release();
}

return;