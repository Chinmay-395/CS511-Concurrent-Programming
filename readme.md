Theres is nothing called as message passing in erlang theres only signals, in erlang
theres a special signal called message signal.

Important erlang keyword

- wherein()

- spawn_link

- self()

- flush()

- exit

- ref -> https://stackoverflow.com/questions/26337647/what-is-ref-in-erlang#:~:text=make_ref()%20%2C%20no%20matter%20where,to%20one%20we%20just%20send.

<!-- Bash Script for running a particular file n times -->

```bash
for i in {1..10}; do groovy lect1.groovy; done
```

```
Modules – Command Line
▶ Compilation
1
$ erlc math_examples . erl
This generates a bytecode file (i.e. .beam file)
▶ Execution
1
$ erl - noshell - run math_examples factLstStr 5 - run
init stop
factStr consumes a list of strings and then prints the result by
calling fact
```

Note above: a record is just syntactic sugar for a tuple

```
someGet(Z) ->shipping:shipco()

Shipping_State#shipping_state.ships

will have one message mailbox for an entire process
```

What to check in promela using spin

---

Q1)Draw transition system

Q2)Midterm question
5 ATMs | 2 Employees | if the employees are going then customer cannot go in

Q3)Stack using monitors

Doubts to ask

EB9
verify with TA whether ex7(a,b,c) are correct and to check mutual exclusion on spin

---

byte mice = 0;
byte felines = 0;
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

```pml
Promela:
byte mice = 0;
byte felines = 0;
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
```
