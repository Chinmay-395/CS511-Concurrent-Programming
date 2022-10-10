import java.util.concurrent.locks.*;

class TrainStation {

    void acquireNorthTrackP(){

    }

    void releaseNorthTrackP(){

    }

    void acquireSouthTrackP(){

    }

    void releaseSouthTrackP(){

    }

    void acquireTracksF(){

    }

    void releaseTracksF(){

    }
}
 TrainStation s = new TrainStation ();
 100. times {
    Thread.start{ // Passenger Train going North
        s.acquireNorthTrackP();
        print " NPT "+ Thread.currentThread().getId();
        s.releaseNorthTrackP();
    }
}
 100. times {
    Thread.start{ // Passenger Train going South
        s.acquireSouthTrackP();
        print " SPT "+ Thread.currentThread().getId();
        s.releaseSouthTrackP()
    }
}
 10. times {
    Thread.start{ // Freight Train
        s.acquireTracksF();
        print "FT "+ Thread.currentThread().getId();
        s.releaseTracksF();
    }
}