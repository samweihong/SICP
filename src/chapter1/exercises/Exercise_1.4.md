# Exercise 1.4

```scheme
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```

This procedure evaluates $a + |b|$. \
The operator is `+` when $b > 0$, and `-` otherwise. \
When $b > 0$, $b = |b|$,
therefore the procedure evaluates $a + b = a + |b|$. \
When $b <= 0$, $-b = |b|$,
therefore the procedure evaluates $a - b = a + |b|$.
