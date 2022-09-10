#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

(define vector1 (list 1 2 3 4))
(define vector2 (list 12 23 34 45))

(define matrix1 (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define matrix2 (list (list 10 20 30) (list 1 1 1) (list 13 15 17) (list 6 6 6)))

(dot-product vector1 vector2)
(dot-product vector2 vector1)

(matrix-*-vector matrix1 vector1)
(matrix-*-vector matrix1 vector2)

(matrix-*-matrix matrix1 matrix2)
(matrix-*-matrix matrix2 matrix1)

(transpose matrix1)
(transpose matrix2)
