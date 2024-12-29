# Exercise 2.61

> Give an implementation of `adjoin-set` using the ordered representation. By analogy with `element-of-set?` show how to take advantage of the ordering to produce a procedure that requires on the average about half as many steps as with the unordered representation.

```scheme
(define (adjoin-set x set)
  (cond ((null? set)
         (list x))
        ((= x (car set))
         set)
        ((< x (car set))
         (cons x set))
        ((> x (car set))
         (cons (car set)
               (adjoin-set x (cdr set))))))
```

When the item `x` is smaller than the first element in the set `(car set)`, we can deduce that `x` does not exist in the set. Therefore, we can insert `x` at the beginning of the list without searching through the rest of the list.

On average, we only need to process about half of the items in the set.
