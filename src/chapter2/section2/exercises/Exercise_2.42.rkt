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
(define (queens board-size)
  ; empty-board has no rows; hence it has no elements.
  (define empty-board nil)
  ; Append the new row as the last element in positions.
  (define (adjoin-position row _ positions)
    (append positions (list row)))
  (define (safe? k positions)
    ; next is the procedure applied to value after each iteration.
    (define (check next)
      ; Return false if the columnth element in positions equals value.
      ; Otherwise, check if the value of previous column equals (next value).
      (define (check-iter column value)
        (cond ((= column 0) true) ; column is not a valid column.
              ((or (= value 0) (> value board-size)) true) ; value is not a valid row.
              ((= (list-ref positions (dec column)) value) false)
              (else (check-iter (dec column) (next value)))))
      ; Starts checking from the last second column.
      (check-iter (dec k) (next (list-ref positions (dec k)))))
    ; Check if no queens are in the same row, left and right diagonals.
    (and (check identity) (check dec) (check inc)))
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

; Display the solutions of i-queens puzzles where i is in the interval [1, n].
(define (queens-iter n)
  (define (iter i)
    (cond ((<= i n)
           (display i)
           (display ": ")
           (display (queens i))
           (newline)
           (iter (inc i)))))
  (iter 1))

(queens-iter 5)
(newline)

; Display the number of solutions of i-queens puzzles where i is in the interval [1, n].
(define (queens-enumeration-iter n)
  (define (iter i)
    (cond ((<= i n)
           (display i)
           (display ": ")
           (display (length (queens i)))
           (newline)
           (iter (inc i)))))
  (iter 1))

(queens-enumeration-iter 10)
