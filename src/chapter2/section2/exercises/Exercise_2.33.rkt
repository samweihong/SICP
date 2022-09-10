#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define sequence1 (list 1 4 9 16 25))
(define sequence2 (list 10 15 17 21))

(map sqrt sequence1)
(map inc sequence2)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append sequence1 sequence2)
(append sequence2 sequence1)

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(length sequence1)
(length sequence2)
