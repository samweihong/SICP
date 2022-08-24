# Exercise 1.34

> What happens if we (perversely) ask the interpreter to evaluate the combination `(f f)`? Explain.

The procedure is evaluated as follows:

```scheme
(f f)
(f 2)
(2 2)
```

As `2` is not a procedure, the procedure cannot be further evaluated; thus, an exception will be raised.

```
application: not a procedure;
 expected a procedure that can be applied to arguments
  given: 2
```
