#lang racket

(define size 2)
size       ; 2
(* 5 size) ; 5 * 2 = 10

(define pi 3.14159)
(define radius 10)
(* pi (* radius radius)) ; Area
(define circumference (* 2 pi radius))
circumference
