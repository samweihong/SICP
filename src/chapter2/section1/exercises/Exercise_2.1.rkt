#lang sicp

(define (make-rat n d)
  (let ((g ((if (positive? d) + -)
            (gcd n d))))
    (cons (/ n g) (/ d g))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 10 20))
(print-rat (make-rat 10 -20))
(print-rat (make-rat -10 20))
(print-rat (make-rat -10 -20))
