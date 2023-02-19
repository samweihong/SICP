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

; Board positions are represented using a list, in which
; the nth element represents its row in the nth column.
(define (queens1 board-size)
  ; empty-board has no rows; hence it has no elements.
  (define empty-board nil)
  ; Insert the new row as the first element in positions.
  (define (adjoin-position row _ positions)
    (cons row positions))
  (define (safe? k positions)
    ; next is the procedure applied to value after each iteration.
    (define (check next)
      ; Return false if the first element in columns equals value.
      ; Otherwise, check if its next element equals (next value).
      (define (check-iter columns value)
        (cond ((null? columns) true) ; No more columns to check.
              ((or (= value 0) (> value board-size)) true) ; value is not a valid row.
              ((= (car columns) value) false)
              (else (check-iter (cdr columns) (next value)))))
      ; Starts checking from the second column.
      (check-iter (cdr positions) (next (car positions))))
    ; Check if no queens are in the same row, left and right diagonals.
    (and (check identity) (check inc) (check dec)))
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

; Board positions are represented using a list of row-column pairs, in which
; each pair, (cons x y), represents a queen in the xth column and yth row.
; Note: The top-left corner is in first column and first row.
(define (queens2 board-size)
  ; empty-board has no queens.
  (define empty-board nil)
  ; Insert the new row-column position as the first element in positions.
  (define (adjoin-position row column positions)
    (cons (cons column row) positions))
  (define (safe? _ positions)
    (let ((x (car (car positions)))
          (y (cdr (car positions))))
      ; Check if the two queens are not in check, that is to say,
      ; they have a gradient other than -1, 0, and 1.
      (define (check position)
        (not (or (= y (cdr position))
                 (= (abs (- y (cdr position))) (abs (- x (car position)))))))
      (accumulate (lambda (x y) (and x y))
                  true
                  (map check (cdr positions)))))
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

; Display the solutions of i-queens puzzles where i is in the interval [1, n] using queens algorithm.
(define (queens-iter queens n)
  (define (iter i)
    (cond ((<= i n)
           (display i)
           (display ": ")
           (display (queens i))
           (newline)
           (iter (inc i)))))
  (iter 1))

(queens-iter queens1 5)
(queens-iter queens2 4)
(newline)

; Display the number of solutions of i-queens puzzles where i is in the interval [1, n] using queens algorithm.
(define (queens-enumeration-iter queens n)
  (define (iter i)
    (cond ((<= i n)
           (display i)
           (display ": ")
           (display (length (queens i)))
           (newline)
           (iter (inc i)))))
  (iter 1))

(queens-enumeration-iter queens1 10)
(queens-enumeration-iter queens2 10)
