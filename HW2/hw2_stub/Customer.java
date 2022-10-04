import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Customer implements Runnable {
    private Bakery bakery;
    private Random rnd;
    private List<BreadType> shoppingCart;
    private int shopTime;
    private int checkoutTime;

    /**
     * Initialize a customer object and randomize its shopping cart
     */
    public Customer(Bakery bakery) {
        // TODO
        this.bakery = bakery;
        this.shoppingCart = new ArrayList<BreadType>();
        this.rnd = new Random();
        this.shopTime = rnd.nextInt(7);
        this.checkoutTime = rnd.nextInt(7);
        fillShoppingCart();
    }

    /**
     * Run tasks for the customer
     */
    public void run() {
        // TODO
        System.out.println("Customer ID: " + this.hashCode() + " has started shopping!");
        try {
            for (int i = 0; i < shoppingCart.size(); i++) {
                if (shoppingCart.get(i) == BreadType.RYE) {
                    this.bakery.breadShelf[0].acquire();
                    this.bakery.takeBread(BreadType.RYE);
                    System.out.println("Customer ID: " + this.hashCode() + " Picked rye bread");
                    this.bakery.addSales(BreadType.RYE.getPrice());
                    System.out.println("Customer ID: " + this.hashCode() + " got rye bread");
                    this.bakery.breadShelf[0].release();
                } else if (shoppingCart.get(i) == BreadType.SOURDOUGH) {
                    this.bakery.breadShelf[1].acquire();
                    this.bakery.takeBread(BreadType.SOURDOUGH);
                    System.out.println("Customer ID: " + this.hashCode() + " Picked sourdough bread");
                    this.bakery.addSales(BreadType.SOURDOUGH.getPrice());
                    System.out.println("Customer ID: " + this.hashCode() + " got sourdough bread");
                    this.bakery.breadShelf[1].release();
                } else {
                    this.bakery.breadShelf[2].acquire();
                    this.bakery.takeBread(BreadType.WONDER);
                    System.out.println("Customer ID: " + this.hashCode() + " Picked wonder bread");
                    this.bakery.addSales(BreadType.WONDER.getPrice());
                    System.out.println("Customer ID: " + this.hashCode() + " got wonder bread");
                    this.bakery.breadShelf[2].release();
                }
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        System.out.println("Customer ID: " + this.hashCode() + " total checkout price " + this.getItemsValue());
        System.out.println("Customer ID: " + this.hashCode() + " completed");
    }

    /**
     * Return a string representation of the customer
     */
    public String toString() {
        return "Customer ID: " + hashCode() + ": shoppingCart=" + Arrays.toString(shoppingCart.toArray())
                + ", shopTime="
                + shopTime + ", checkoutTime=" + checkoutTime;
    }

    /**
     * Add a bread item to the customer's shopping cart
     */
    private boolean addItem(BreadType bread) {
        // do not allow more than 3 items, chooseItems() does not call more than 3 times
        if (shoppingCart.size() >= 3) {
            return false;
        }
        shoppingCart.add(bread);
        return true;
    }

    /**
     * Fill the customer's shopping cart with 1 to 3 random breads
     */
    private void fillShoppingCart() {
        int count = 1 + rnd.nextInt(3);
        while (count > 0) {
            addItem(BreadType.values()[rnd.nextInt(BreadType.values().length)]);
            count--;
        }
    }

    /**
     * Calculate the total value of the items in the customer's shopping cart
     */
    private float getItemsValue() {
        float value = 0;
        for (BreadType bread : shoppingCart) {
            value += bread.getPrice();
        }
        return value;
    }
}