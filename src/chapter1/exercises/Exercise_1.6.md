# Exercise 1.6

```scheme
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
        
(sqrt 9)
```

The program will stuck in an infinite loop.

As the interpreter evaluates the arguments first,
it will evaluate the `sqrt-iter` in the `else-clause` of `new-if`.
And in the `sqrt-iter` procedure,
it will evaluate another `sqrt-iter` which causes the loop to continue forever.

This does not happen using the special form of `if` as it only evaluates the `sqrt-iter` when the `predicate` is false.
Eventually, the `predicate` is true and the procedure halts.
