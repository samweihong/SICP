#lang sicp

(define x (list (list 1 2) (list 3 4)))

x

(reverse x)

(define (deep-reverse items)
  (cond ((not (pair? items)) items)
        (else (append (deep-reverse (cdr items))
                      (list (deep-reverse (car items)))))))

(deep-reverse x)
(deep-reverse (list (list 1 (list 2 3) (list 4 5 6)) 7))
