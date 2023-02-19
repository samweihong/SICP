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

(define (queens board-size)
  (define empty-board nil)
  (define (adjoin-position row column positions)
    (cons (cons column row) positions))
  (define (safe? _ positions)
    (let ((x (car (car positions)))
          (y (cdr (car positions))))
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

(define (slow-queens board-size)
  (define empty-board nil)
  (define (adjoin-position row column positions)
    (cons (cons column row) positions))
  (define (safe? _ positions)
    (let ((x (car (car positions)))
          (y (cdr (car positions))))
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
          (lambda (new-row)
            (map (lambda (rest-of-queens)
                   (adjoin-position new-row k rest-of-queens))
                 (queen-cols (- k 1))))
          (enumerate-interval 1 board-size)))))
  (queen-cols board-size))

; Display the average time required to compute (queens 8) k times.
(define (timer-iter queens k)
  (define (queens-k-times k)
    (cond ((> k 0) (queens 8)
                   (queens-k-times (- k 1)))))
  (let ((start-time (runtime)))
    (queens-k-times k)
    (display (/ (- (runtime) start-time) k 1.0))
    (newline)))

(display "Initial *** ")
(timer-iter queens 100)
(newline)

(display "Interchanged *** ")
(timer-iter slow-queens 20)
