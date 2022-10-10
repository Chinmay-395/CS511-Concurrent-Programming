class ThreeWaySequencer{
  private int state = 1;
  
  synchronized void one(){
    while(state != 1){
      wait()
    }
    println("One")
    state = 2
    notifyAll()
  }

  synchronized void two(){
    while(state != 2){
      wait()
    }
    println("Two")
    state = 3
    notifyAll()
  }

  synchronized void three(){
    while(state != 3){
      wait()
    }
    println("Three")
    state = 1
    notifyAll()
  }
}

ThreeWaySequencer tws = new ThreeWaySequencer()

5.times{
  Thread.start {
    tws.one()  
  }
}

5.times{
  Thread.start {
    tws.two()  
  }
}

5.times{
  Thread.start {
    tws.three()  
  }
}