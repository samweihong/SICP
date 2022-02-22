#lang racket

; Iterative process
(define (fast-* a b)
  (define (double n)
    (+ n n))
  (define (halve n)
    (/ n 2))
  (define (even? n)
    (= (remainder n 2) 0))
  (define (*-iter a b n) ; result = a*b + n
    (cond ((= b 0) n)
          ((even? b) (*-iter (double a) (halve b) n))
          (else (*-iter (double a) (halve (- b 1)) (+ n a)))))
  (*-iter a b 0))

(* 2 5)
(* 71 17)
(* 334455 667788)

(fast-* 2 5)
(fast-* 71 17)
(fast-* 334455 667788)
