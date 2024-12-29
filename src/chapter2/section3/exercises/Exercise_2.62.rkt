#lang sicp

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((x1 (car set1)) (x2 (car set2)))
                (cond ((= x1 x2)
                       (cons x1 (union-set (cdr set1) (cdr set2))))
                      ((< x1 x2)
                       (cons x1 (union-set (cdr set1) set2)))
                      ((> x1 x2)
                       (cons x2 (union-set set1 (cdr set2)))))))))

(union-set '(1 5 6 8) '(1 3 6 7 10))   ; (1 3 5 6 7 8 10)

(union-set '(2 3 5) '(1 4 6))          ; (1 2 3 4 5 6)

(union-set '(10 30 50) '(10 20 30 40)) ; (10 20 30 40 50)
