#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (append set1 set2))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(element-of-set? 5 '(4 2 4 4 5 1 5 2)) ; #t
(element-of-set? 3 '(4 2 4 4 5 1 5 2)) ; #f

(adjoin-set 5 '(4 2 4 4 5 1 5 2)) ; (5 4 2 4 4 5 1 5 2)
(adjoin-set 3 '(4 2 4 4 5 1 5 2)) ; (3 4 2 4 4 5 1 5 2)

(union-set '(20 3 20 12 2 2) '(6 3 6 2 100 6 3)) ; (20 3 20 12 2 2 6 3 6 2 100 6 3)
(union-set '(5 10 10 5) '())                     ; (5 10 10 5)
(union-set '(1 2 3 4) '(4 4 3 1 2 1 3))          ; (1 2 3 4 4 4 3 1 2 1 3)
(union-set '(10 30 10 30) '(40 20 20))           ; (10 30 10 30 40 20 20)

(intersection-set '(20 3 20 12 2 2) '(6 3 6 2 100 6 3)) ; (3 2 2)
(intersection-set '(5 10 10 5) '())                     ; ()
(intersection-set '(1 2 3 4) '(4 4 3 1 2 1 3))          ; (1 2 3 4)
(intersection-set '(10 30 10 30) '(40 20 20))           ; ()
