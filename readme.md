<!-- Bash Script for running a particular file n times -->

### Executing Groovy script

```bash
for i in {1..10}; do groovy lect1.groovy; done
```

## Midterm

Q1)Draw transition system

Q2)Midterm question
5 ATMs | 2 Employees | if the employees are going then customer cannot go in

Q3)Stack using monitors

### Erlang

Theres is nothing called as message passing in erlang theres only signals, in erlang
theres a special signal called message signal.

Important erlang keyword

- wherein()

- spawn_link

- self()

- flush()

- exit

- ref -> https://stackoverflow.com/questions/26337647/what-is-ref-in-erlang#:~:text=make_ref()%20%2C%20no%20matter%20where,to%20one%20we%20just%20send.

### Promela/Spin

executing promela file using spin

```bash
spin -a <file-name>
```

```bash
gcc -o pan pan.c
```

```bash
./pan
```

getting the trail file

```bash
./pan -r
```
