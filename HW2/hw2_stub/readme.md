We will spawn 50 threads since only 50 customers can be allowed.
The count varibale should be synchronized amongst multiple threads.
The thread pool is of 50 threads


3 shelves of different bread types
4 cashier

The customer always have access full access of all the shelves

which bread will be chose and the number of bread is also done using random function

**Doubt: ** how many breads can a customer take, every customer will take 3 breads

When a bread stock reaches 0 stock, the shelf restocks itself (the method
Bakery.takeBread(BreadType bread) provided in the stub does this). 

Every thread should execute Bakery.run()