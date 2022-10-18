
import java.util.concurrent.locks.*;
class Pizza{
    int small=0;
    int large=0;
    Lock lock = new ReentrantLock();
    Condition largePizza = lock.newCondition();
    Condition smallPizza = lock.newCondition();
    
    void purchaseLargePizza(){
        lock.lock()
        try{
            while(large==0 && small<2){
                largePizza.await();
            }
            if(large==0){
                small=small-2;
                println("large-Pizza "+large+" smallPizza "+small)
            }
            else{
                large--;
                println("large-Pizza "+large+" smallPizza "+small)
            }
            
        }finally{
                lock.unlock();
            }
        
    }
    
    void purchaseSmallPizza(){
        lock.lock()
        try{
            while(small==0){
            smallPizza.await();
        }
        small--;
        println("large-Pizza "+large+" smallPizza "+small)
            
        }finally{
            lock.unlock()
        }
        
    }
    
    void bakeSmallPizza(){
        lock.lock()
        try{
            small++;
        println("large-Pizza "+large+" smallPizza "+small)
        smallPizza.signal();
        largePizza.signal();
            
        }finally{
            lock.unlock()
        }
        
    }
    
    void bakeLargePizza(){
        lock.lock()
        try{
            large++;
            println("large-Pizza "+large+" smallPizza "+small)
        largePizza.signal();
            
        }finally{
            lock.unlock()
        }
        
    }
}

 Pizza p = new Pizza();

10.times {
    Thread.start {
        p.purchaseLargePizza();       
    }
    Thread.start {
        p.purchaseSmallPizza();       
    }
    Thread.start {
        p.bakeSmallPizza();       
    }
    Thread.start {
        p.bakeLargePizza();       
    }
}

