
byte mice = 0; byte felines = 0;
byte mutexMice = 1;
byte mutexFelines =1;
byte mutex = 1;
inline acquire ( sem) {
atomic {
sem >0;
sem --
}
}
inline release ( sem ) {
sem ++
}
active [3] proctype Mouse () {
acquire ( mutex )
acquire ( mutexMice );
assert(felines==0);
mice ++;
if
:: mice ==1 -> acquire ( mutexFelines );
:: else -> skip ;
fi
release ( mutexMice );
release ( mutex );
// access feeding lot
acquire ( mutexMice );
mice --;
if
:: mice ==0 -> release ( mutexFelines );
:: else -> skip ;
fi
release ( mutexMice );
}
active [3] proctype Feline () {
acquire ( mutex );
acquire ( mutexFelines );
assert(mice==0);
felines ++;
if
:: felines ==1 -> acquire ( mutexMice );
:: else -> skip ;
fi
release ( mutexFelines );
release ( mutex );
// use feeding lot
acquire ( mutexFelines );
felines --;
if
:: felines ==0 -> release ( mutexMice );
:: else -> skip ;
fi
release ( mutexFelines );
}