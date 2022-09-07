#lang sicp

(cons 1
      (cons 2
            (cons 3
                  (cons 4 nil))))

(define one-through-four (list 1 2 3 4))
one-through-four

(car one-through-four)
(cdr one-through-four)
(car (cdr one-through-four))

(cons 10 one-through-four)
(cons 5 one-through-four)

; List operations

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define squares (list 1 4 9 16 25))
(list-ref squares 3)

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define odds (list 1 3 5 7))
(length odds)

(define (length2 items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(length2 odds)

(append squares odds)
(append odds squares)

(define (append2 list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append2 (cdr list1) list2))))

(append2 squares odds)
(append2 odds squares)

; Mapping over lists

(define (scale-list items factor)
  (if (null? items)
      nil
      (cons (* (car items) factor)
            (scale-list (cdr items) factor))))

(scale-list (list 1 2 3 4 5) 10)

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(map abs (list -10 2.5 -11.6 17))

(map (lambda (x) (* x x))
     (list 1 2 3 4))

(define (scale-list2 items factor)
  (map (lambda (x) (* x factor)) items))

(scale-list2 (list 1 2 3 4 5) 10)
