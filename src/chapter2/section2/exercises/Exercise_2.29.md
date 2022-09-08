# Exercise 2.29

> How much do you need to change your programs to convert to the new repre­sentation?

Only the selectors are required to change. They act as abstraction barriers that isolate the implementation details of extracting data from the pairs.

Before the change:

```scheme
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))
```

After the change:

```scheme
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cdr mobile))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (cdr branch)
```
