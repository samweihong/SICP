#lang sicp

(define timeout 3e6) ; in microsecond
(define tolerance 0.00001)

; Modified version of fixed-point where it returns -1 if timeout.
(define (fixed-point f first-guess start-time)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (cond ((> (runtime) (+ start-time timeout)) -1)
            ((close-enough? guess next) next)
            (else (try next)))))
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

(define (n-th-root x n times)
  (fixed-point ((repeated average-damp times)
                (lambda (y)
                  (/ x (expt y (- n 1)))))
               1.0
               (runtime)))

; Return the minimum number of average damps required to compute nth roots of x.
(define (min-average-damps x n)
  (define (iter times)
    (if (not (= (n-th-root x n times) -1))
        times
        (iter (+ times 1))))
  (iter 1))

; Display the minimum number of average damps required to compute nth roots of x,
; where n is in interval [a, b].
(define (min-average-damps-range x a b)
  (define (display-min-average-damps n)
    (display "n: ")
    (display n)
    (display " *** Minimum of average damps: ")
    (display (min-average-damps x n))
    (newline))
  (define (iter n)
    (cond ((<= n b) (display-min-average-damps n)
                    (iter (+ n 1)))))
  (iter a))

(min-average-damps-range 2 1 50)
