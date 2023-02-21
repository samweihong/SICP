#lang sicp

(define (make-vect x y) (cons x y))
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

(define origin (make-vect 5 3))
(define edge1 (make-vect 12 4))
(define edge2 (make-vect -1 8))

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (cadr frame))
(define (edge2-frame frame) (caddr frame))

(define frame1 (make-frame origin edge1 edge2))
(origin-frame frame1)
(edge1-frame frame1)
(edge2-frame frame1)

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame2 frame) (car frame))
(define (edge1-frame2 frame) (cadr frame))
(define (edge2-frame2 frame) (cddr frame))

(define frame2 (make-frame2 origin edge1 edge2))
(origin-frame2 frame2)
(edge1-frame2 frame2)
(edge2-frame2 frame2)
