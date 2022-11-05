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