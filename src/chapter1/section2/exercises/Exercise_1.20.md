# Exercise 1.20

## Normal-order evaluation

```scheme
(gcd 206 40)
(gcd 40 (remainder 206 40))
; Evaluate (remainder 206 40) in if => 1 operation

(gcd (remainder 206 40)
     (remainder 40 (remainder 206 40)))
; Evaluate (remainder 40 (remainder 206 40)) in if => 2 operations

(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40))))
; Evaluate (remainder (remainder 206 40)
;                     (remainder 40 (remainder 206 40))) in if => 4 operations

(gcd (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))

; Evaluate (remainder (remainder 40 (remainder 206 40))
;                     (remainder (remainder 206 40)
;                                (remainder 40 (remainder 206 40))))  = 0 in if => 7 operations

(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; => 4 operations
(remainder 6 (remainder 40 6))
(remainder 6 4)
2
```

> There are **18 remainder operations** in normal-order evaluation.

## Applicative-order evaluation

```scheme
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2
```

> There are **4 remainder operations** in applicative-order evaluation.
