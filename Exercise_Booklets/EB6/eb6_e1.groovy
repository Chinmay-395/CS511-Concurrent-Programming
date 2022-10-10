import java.util.concurrent.locks.*;

class Bar{
  private int numPatriots = 0;
  private int patsCounter = 0
  private int jetsCounter = 0
  
  synchronized void jets(){
    // println("The number of partriots patsCount JetCOunter")
    // print(numPatriots)
    // print(patsCounter)
    // print(jetsCounter)
    // print("\n")
    while (numPatriots < 2) {
      wait();
    }

    numPatriots -= 2;

    jetsCounter++
    println("Jet #${jetsCounter} has entered");
  }

  synchronized void patriots(){
    numPatriots++;
    if (numPatriots >= 2) {
      notify();
    }

    patsCounter++
    println("Patriot #${patsCounter} has entered");
  }
}

Bar b = new Bar();

10.times{
  Thread.start {
    b.jets()
  }
}

10.times{
  Thread.start {
    b.patriots()
  }
}