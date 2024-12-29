#lang sicp

(define (adjoin-set x set)
  (cond ((null? set)
         (list x))
        ((= x (car set))
         set)
        ((< x (car set))
         (cons x set))
        ((> x (car set))
         (cons (car set)
               (adjoin-set x (cdr set))))))

(adjoin-set 10 '(2 5 6))      ; (2 5 6 10)

(adjoin-set 6 '(1 3 4 8 15))  ; (1 3 4 6 8 15)

(adjoin-set 20 '(40))         ; (20 40)

(adjoin-set 12 '(1 4 6 7 12)) ; (1 4 6 7 12)
