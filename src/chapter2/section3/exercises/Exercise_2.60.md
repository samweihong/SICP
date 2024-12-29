# Exercise 2.60

> We specified that a set would be represented as a list with no duplicates. Now suppose we allow duplicates. For instance, the set {1, 2, 3} could be represented as the list `(2 3 2 1 3 2 2)`. Design procedures `element-of-set?`, `adjoin-set`, `union-set`, and `intersection-set` that operate on this representation. How does the efficiency of each compare with the corresponding procedure for the non-duplicate representation?

## `element-of-set?`

Both implementation is the same.

```scheme
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))
```

Efficiency: $\Theta(n)$, where $n$ is the size of `set`.

## `adjoin-set`

The implementation for duplicate representation directly adds `x` into `set` without checking the existence of `x` in it.

### Non-duplicate representation

```scheme
(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))
```

Efficiency: $\Theta(n)$, where $n$ is the size of `set`.

### Duplicate representation

```scheme
(define (adjoin-set x set)
  (cons x set))
```

Efficiency: $\Theta(1)$

## `union-set`

The implementation for duplicate representation combines both sets directly without checking for duplicates in them.

### Non-duplicate representation

```scheme
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (cons (car set1) (union-set (cdr set1) set2)))))
```

Efficiency: $\Theta(mn)$, where $m$ is the size of `set1` and $n$ is the size of `set2`.

### Duplicate representation

```scheme
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (cons (car set1) (union-set (cdr set1) set2)))))
```

Efficiency: $\Theta(m)$, where $m$ is the size of `set1`.

## `intersection-set`

```scheme
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))
```

Efficiency: $\Theta(mn)$, where $m$ is the size of `set1` and $n$ is the size of `set2`.

> Are there applications for which you would use this representation in preference to the non-duplicate one?

This representation is suitable for use cases where union operations are frequently used on sets with no or few common elements between them.
