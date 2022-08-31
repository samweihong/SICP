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

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (n-th-root x n times)
  (fixed-point ((repeated average-damp times)
                (lambda (y)
                  (/ x (expt y (- n 1)))))
               1.0
               (runtime)))

; Display if `times` times of average damps converges when computing nth roots of x.
(define (display-converge x n times)
  (display times)
  (display " ")
  (if (= (n-th-root x n times) -1)
      (display "🗴")
      (display "✓"))
  (display " "))

; Display the number of average damps in interval [M, N]
; that converges when computing nth roots of x, where n is in interval [a, b].
(define (num-of-average-damps-range x M N a b)
  (define (num-of-average-damps n)
    (define (iter i)
      (cond ((<= i N)
             (display-converge x n i)
             (iter (+ i 1)))))
    (iter M))
  (define (display-num-average-damps n)
    (display "Number of average damps: ")
    (num-of-average-damps n)
    (display "n: ")
    (display n)
    (newline))
  (define (iter n)
    (cond ((<= n b) (display-num-average-damps n)
                    (iter (+ n 1)))))
  (iter a))

(num-of-average-damps-range 2 1 10 1 50)
