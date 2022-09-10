#lang sicp

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(reverse-right nil)
(reverse-right (list 10))
(reverse-right (list 10 20))
(reverse-right (list 10 20 30))
(reverse-right (list 1 4 9 16 25))

(reverse-left nil)
(reverse-left (list 10))
(reverse-left (list 10 20))
(reverse-left (list 10 20 30))
(reverse-left (list 1 4 9 16 25))
