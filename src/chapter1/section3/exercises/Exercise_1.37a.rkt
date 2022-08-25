#lang sicp

; Recursive cont-frac
(define (cont-frac n d k)
  (define (cont-frac-term i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (cont-frac-term (+ i 1))))))
  (cont-frac-term 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)
