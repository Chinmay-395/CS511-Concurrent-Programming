import java.util.concurrent.locks.*;
class Grid {
    int noOfProducers = 0;
    int noOfConsumers = 0;
    int N = 20;
    
    synchronized void startProducing() {
        while (noOfProducers >= N) {
            wait();
        }
        noOfProducers++;
        printState();
        notifyAll();
    }
    synchronized void stopProducing() {
        while(noOfConsumers <= noOfProducers) {
            wait();
        }
        noOfProducers--;
        printState();
        notifyAll();
    }
    synchronized void startConsuming() {
        while(noOfConsumers >= noOfProducers) {
            wait();
        }
        noOfConsumers++;
        printState();
    }
    synchronized void stopConsuming() {
        noOfConsumers--;
        printState();
        notifyAll();
    }
    synchronized void printState(){
        println("prod " + noOfProducers +"consume " + noOfConsumers) 
    }
}
Grid grid = new Grid();
println("STARTED")
10.times {
    Thread.start {
        // println("Hey")
        
        grid.startConsuming();
        sleep(5000);
        grid.stopConsuming();
        grid.startProducing();
        sleep(5000);
        grid.stopProducing();
    }
}