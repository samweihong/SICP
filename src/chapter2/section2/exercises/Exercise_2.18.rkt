#lang sicp

(define (reverse items)
  (if (null? items)
      nil
      (append (reverse (cdr items)) (list (car items)))))

(reverse (list 1 4 9 16 25))

(reverse nil)
(reverse (list 10))
(reverse (list 10 20))
(reverse (list 10 20 30))

(define (reverse-iter items)
  (define (iter reversed items)
    (if (null? items)
        reversed
        (iter (cons (car items) reversed) (cdr items))))
  (iter nil items))

(reverse-iter (list 1 4 9 16 25))

(reverse-iter nil)
(reverse-iter (list 10))
(reverse-iter (list 10 20))
(reverse-iter (list 10 20 30))