# Exercise 2.19

> Does the order of the list `coin-values` affect the answer produced by `cc`?

No. `cc` produces the same answer regardless of the list order.

```scheme
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(cc 100 us-coins)
(cc 100 uk-coins)
(cc 100 (list 5 1 25 10 50))
(cc 100 (list 50 10 5 0.5 2 100 1 20))
```

```
292
104561
292
104561
```

> Why or why not?

`cc` performs an exhaustive search that covers all possible combinations; that is, either using the first kind of coin or not in each recursive call. Therefore, it will produce the same answer as long as the `coin-values` contains the same set of values.
