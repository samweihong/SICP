#lang sicp

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

; Find all ordered triples of distinct positive integers i, j, and k
; less than or equal to a given integer n that sum to a given integer s.
(define (sum-to n s)
  ; Generate all permutations of the filtered triples.
  (flatmap permutations
           ; Filter those with an accumulated sum of s.
           (filter (lambda (triple)
                     (= (accumulate + 0 triple) s))
                   ; Generate all triples (i, j, k), where 1 <= i < j < k <= n.
                   (flatmap (lambda (i)
                              (flatmap (lambda (j)
                                         (map (lambda (k) (list i j k))
                                              (enumerate-interval (+ j 1) (- n 2))))
                                       (enumerate-interval (+ i 1) (- n 1))))
                            (enumerate-interval 1 (- n 2))))))

(sum-to 10 10)
