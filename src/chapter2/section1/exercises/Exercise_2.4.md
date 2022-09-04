# Exercise 2.4

> For this representation, verify that `(car (cons x y))` yields `x` for any objects `x` and `y`.

```scheme
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))
```

The procedure is evaluated as follows:

```scheme
(car (cons x y))
(car (lambda (m) (m x y)))
((lambda (m) (m x y)) (lambda (p q) p))
((lambda (p q) p) x y)
x
```

Hence, `(car (cons x y))` yields `x` for any objects `x` and `y`.
