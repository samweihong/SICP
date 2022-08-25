#lang sicp

; Iterative cont-frac
(define (cont-frac n d k)
  (define (cont-frac-iter i result)
    (if (= i 0)
        result
        (cont-frac-iter (- i 1)
                        (/ (n i)
                           (+ (d i) result)))))
  (cont-frac-iter k 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)
