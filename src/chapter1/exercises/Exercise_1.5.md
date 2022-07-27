# Exercise 1.5

Applicative-order evaluation: No output \
Normal-order evaluation: 0

## Explanation
In applicative-order evaluation, the interpreter evaluates the arguments first. 
As `(p)` is evaluated, the program will stuck in an infinite loop as `(p)` is defined to itself.

Whereas in normal-order evaluation, the interpreter expands the procedure into:
```scheme
(if (= x 0) 0 y)
```
As the predicate is true, the program will return `0`, without evaluating the value of `(p)`.
