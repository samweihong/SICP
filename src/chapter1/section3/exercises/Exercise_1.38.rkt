#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-term i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (cont-frac-term (+ i 1))))))
  (cont-frac-term 1))

(define d
  (lambda (i)
    (if (= (remainder i 3) 2)
        (* (/ 2 3) (+ i 1))
        1)))

(+ 2.0 (cont-frac (lambda (i) 1) d 1))
(+ 2.0 (cont-frac (lambda (i) 1) d 5))
(+ 2.0 (cont-frac (lambda (i) 1) d 10))
(+ 2.0 (cont-frac (lambda (i) 1) d 20))
