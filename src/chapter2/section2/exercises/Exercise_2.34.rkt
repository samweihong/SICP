#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))
(horner-eval 10 (list -5 3 2))
(horner-eval -6 (list 0 84 26 2))
(horner-eval -7 (list 0 84 26 2))
