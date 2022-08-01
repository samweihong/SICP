#lang sicp

(define (square n)
  (* n n))

; Testing n for divisibility by successive integers starting from 2.
(define (prime? n)  
  (define (smallest-divisor n)
    (find-divisor n 2))
  ; Find the smallest divisor of n starting from 2.
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  ; The number is prime only when its smallest divisor is itself (excluding 1).
  (= n (smallest-divisor n)))

(prime? 2)
(prime? 3)
(prime? 4)
(prime? 5)
(prime? 6)
(prime? 7)
(prime? 121)
(prime? 131)

; Probabilistic method using Fermat's little theorem.
(define (fermat-test n)
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m))
                      m))
          (else
           (remainder (* base (expmod base (- exp 1) m))
                      m))))
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 2 10)
(fast-prime? 3 10)
(fast-prime? 4 10)
(fast-prime? 5 10)
(fast-prime? 6 10)
(fast-prime? 7 10)
(fast-prime? 121 10)
(fast-prime? 131 10)
