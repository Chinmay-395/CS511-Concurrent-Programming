active proctype Ferry () {
    byte coast = 0; /* East = 0 , West = 1 */
    int i ;
    byte crit=0;
    do
    ::
        for ( i : 1.. CAPACITY ) {
            release(permissionToGetOn[coast]);
        };
        for ( i : 1.. CAPACITY ) {
            acquire(permissionToSetSail);
        };
        /* move to other coast */
        coast = ( coast +1) % 2;
        /* reached other coast */
        for ( i :1.. CAPACITY ) {
            release(permissionToGetOff);
        }
        for ( i : 1.. CAPACITY ) {
            acquire(permissionToReboard);
        }
    od;
}

proctype PassengerAtCoast(bytecoast){
    acquire(permissionToGetOn[coast]);
    release(permissionToSetSail);
    /* waiting to arrive at other coast */
    acquire(permissionToGetOff);
    release(permissionToReboard);
}