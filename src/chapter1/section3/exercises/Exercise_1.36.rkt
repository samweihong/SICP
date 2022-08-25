#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)  
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(display "First guess = 5")
(newline)
(display "With average damping: ")
(newline)
(fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
             5)

(display "Without average damping: ")
(newline)
(fixed-point (lambda (x) (/ (log 1000) (log x)))
             5)
(newline)

(display "First guess = 10")
(newline)
(display "With average damping: ")
(newline)
(fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
             10)

(display "Without average damping: ")
(newline)
(fixed-point (lambda (x) (/ (log 1000) (log x)))
             10)
