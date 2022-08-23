#lang sicp

; Recursive accumulate
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (sum-integers a b)
  (sum identity a inc b))

(sum-integers 1 10)
(sum-integers 2 5)

(define (sum-cubes a b)
  (define (cube x)
    (* x x x))
  (sum cube a inc b))

(sum-cubes 1 10)
(sum-cubes 2 5)

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (factorial n)
  (product identity 2 inc n))

(factorial 5)
(factorial 10)
