#lang sicp

; Compute elements of Pascal's triangle.
(define (pascal row column)
  (cond ((or (< column 1) (> column row)) 0)
        ((= row 1) 1)        
        (else (+ (pascal (- row 1) column)
                 (pascal (- row 1) (- column 1))))))

(pascal 2 1)
(pascal 2 2)

(pascal 5 1)
(pascal 5 2)
(pascal 5 3)
(pascal 5 4)
(pascal 5 5)

(pascal 7 1)
(pascal 7 2)
(pascal 7 3)
(pascal 7 4)
(pascal 7 5)
(pascal 7 6)
(pascal 7 7)
 