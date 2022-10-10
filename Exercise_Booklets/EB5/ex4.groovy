import java.util.concurrent.Semaphore;

MAX_WEIGHTS = 10;
GYM_CAP = 50;

// Declare semaphores here
apparatus = [new Semaphore(1), new Semaphore(1), new Semaphore(1), new Semaphore(1)];
weights = new Semaphore(MAX_WEIGHTS);
capacity = new Semaphore(GYM_CAP);
mutex = new Semaphore(1);

def make_routine(int no_exercises) { // returns a random routine
    Random rand = new Random();
    int size = rand.nextInt(no_exercises);
    routine = [];
    print("THE SIZE "+size + "\n")
    size.times {
        routine.add(new Tuple(rand.nextInt(4), rand.nextInt(MAX_WEIGHTS)));
    }
    return routine;
}

/* print("THE SIZE "+size + "\n") THE SIZE 2
    print(make_routine(5));    [[1, 3], [0, 9]] (Apparatus * max_weight)
*/
100.times {
    Thread.start { // Client
        // enter gym
        capacity.acquire();

        routine = make_routine(5); // random routine of 20 exercises
        // complete routine
        print("the routine size " +routine.size() + "\n")
        2.times {
            print("THE ITERATION "+it+"\n")

            int id = it;
            apparatus[routine[id].get(0)].acquire();
            
            mutex.acquire();
            routine[id].get(1).times {
                weights.acquire();
            }
            mutex.release();
            // exercise

            routine[id].get(1).times {
                weights.release();
            }

            apparatus[routine[id].get(0)].release();
        }

        capacity.release();
    }
}

return;