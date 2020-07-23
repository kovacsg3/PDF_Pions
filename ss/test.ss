(define (square x) (* x x))

(define (abs x)
  (if (< x 0)
    (- x)
    x))

(define (sum list-of-values)
  (if (= 1 (length list-of-values))
    (car list-of-values)
    (+ (car list-of-values)
      (sum (cdr list-of-values)))))

(display
  (sum (list 5 6 8))
  )
