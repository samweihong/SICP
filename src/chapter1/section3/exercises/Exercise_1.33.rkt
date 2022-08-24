#lang sicp

; Recursive filtered-accumulate
(define (filtered-accumulate predicate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (if (predicate a) (term a) null-value)
                (filtered-accumulate predicate combiner null-value term (next a) next b))))

; a.
(define (prime? n)  
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (and (not (= n 1))
       (= n (smallest-divisor n))))

(define (square n)
  (* n n))

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

(sum-of-squares-of-primes 0 10)
(sum-of-squares-of-primes 0 20)

; b.
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-of-coprime-integers n)
  (define (is-coprime-integer? a)
    (= (gcd a n) 1))
  (filtered-accumulate is-coprime-integer? * 1 identity 1 inc n))

(product-of-coprime-integers 10)
(product-of-coprime-integers 20)