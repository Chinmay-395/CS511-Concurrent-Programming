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
