#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-term i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (cont-frac-term (+ i 1))))))
  (cont-frac-term 1))

(define (tan-cf x k)
  (let ((x-square (- (* x x))))
    (cont-frac (lambda (i)
                 (if (= i 1) x x-square))
               (lambda (i)
                 (- (* 2 i) 1))
               k)))

(tan-cf 0 10)
(tan-cf 3.14159 15)
(tan-cf 5.0 20)
(tan-cf 10.0 30)
(tan-cf 15.0 40)
