#lang sicp

; Iterative process
(define (fast-expt b n)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (square n)
    (* n n))
  (define (expt-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (expt-iter a (square b) (/ n 2)))
          (else (expt-iter (* a b) b (- n 1)))))
  (expt-iter 1 b n))

(fast-expt 0 5)
(fast-expt 1 10)
(fast-expt 2 0)
(fast-expt 3 8)
(fast-expt 13 31)
