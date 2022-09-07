#lang sicp

(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))

(last-pair (list 23 72 149 34))

(last-pair (list 10))
(last-pair (list 10 20))
(last-pair (list 10 20 30))
