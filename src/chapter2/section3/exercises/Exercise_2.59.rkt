#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (cons (car set1) (union-set (cdr set1) set2)))))

(union-set '(20 3 12 2) '(3 6 2 100))

(union-set '(5 10) '())

(union-set '(1 2 3 4) '(4 3 2 1))

(union-set '(30 10) '(40 20))
