import java.util.concurrent.Semaphore
 int y = 0 , z = 0;
 Thread . start { // P
    printf("\n Z %d",z)
    printf("\n Y %d",y)
    int x ;
    x = y + z ;
    printf("\n X %d",X)
 }
 Thread . start { // Q
 y = 1;
 z = 2;
 }