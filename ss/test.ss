#!/usr/bin/env scheme-script

(import (cslib all))

(define (square x) (* x x))

(define (fabs x)
  (if (< x 0)
    (- x)
    x))

(define (sum list-of-values)
  (if (null? list-of-values)
    0
    (+ (car list-of-values)
      (sum (cdr list-of-values)))))

(define (mylist? x)
  (if (null? x)
      #t
      (if (pair? x)
          (mylist? (cdr x))
          #f)))

(display
  (sum (list 5 6 8))
  )

(newline)
