#lang sicp

(define x (list (list 1 2) (list 3 4)))

(define (fringe x)
  (cond ((null? x) nil)
        ((not (pair? x)) (list x))
        (else (append (fringe (car x)) (fringe (cdr x))))))

(fringe x)

(fringe (list x x))

(fringe (list 1 2 3 (list 4 5 6 (list 7)) 8))
