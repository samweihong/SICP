#lang sicp
(#%require sicp-pict)

(define (split main sub)
  (define (draw painter n)
    (if (= n 0)
        painter
        (let ((smaller (draw painter (- n 1))))
          (main painter (sub smaller smaller)))))
  draw)

(define right-split (split beside below))
(define up-split (split below beside))

(paint (right-split einstein 0))
(paint (right-split einstein 1))
(paint (right-split einstein 2))
(paint (right-split einstein 3))

(paint (up-split einstein 0))
(paint (up-split einstein 1))
(paint (up-split einstein 2))
(paint (up-split einstein 3))
