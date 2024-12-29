#lang sicp

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (key record)
  (cond ((equal? record 'Alice) 1)
        ((equal? record 'Bob) 2)
        ((equal? record 'Charlie) 3)
        ((equal? record 'Diana) 4)
        ((equal? record 'Eve) 5)))

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((= given-key (key (entry set-of-records)))
         (entry set-of-records))
        (else (lookup given-key
                      ((if (< given-key (key (entry set-of-records))) left-branch right-branch)
                       set-of-records)))))

(define set-of-records (make-tree 'Bob
                                  (make-tree 'Alice '() '())
                                  (make-tree 'Diana
                                             (make-tree 'Charlie '() '())
                                             (make-tree 'Eve '() '()))))

(lookup 1 set-of-records)
(lookup 2 set-of-records)
(lookup 3 set-of-records)
(lookup 4 set-of-records)
(lookup 5 set-of-records)
(lookup 6 set-of-records)
