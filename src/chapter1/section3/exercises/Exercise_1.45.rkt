#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (define (average x y) (/ (+ x y) 2))
  (lambda (x) (average x (f x))))

(define (repeated f n)
  (define (compose f g)
    (lambda (x) (f (g x))))
  (if (= n 0)
      identity
      (compose (repeated f (- n 1)) f)))

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (n-th-root x n)
  (fixed-point ((repeated average-damp (floor (/ (log n) (log 2))))
                (lambda (y)
                  (/ x (expt y (- n 1)))))
               1.0))

(n-th-root 2 1)
(n-th-root 4 2)
(n-th-root 8 3)
(n-th-root 16 4)
(n-th-root 32 5)
(n-th-root 64 6)
(n-th-root 128 7)
(n-th-root 256 8)
(n-th-root 512 9)
(n-th-root 1024 10)
(n-th-root 65536 16)
(n-th-root (expt 2 32) 32)
