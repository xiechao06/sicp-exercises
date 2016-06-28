(define (make-rat x y)
  (if (< y 0) (cons (- x) (- y))
    (cons x y)))
(define numer car)
(define denom cdr)

(define (display-rat x) 
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y) 
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (equal-rat? x y) 
  (= (* (numer x) (denom y)) (* (numer y) (denom x))))

(define (sub-rat x y) 
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y) 
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y) 
  (mul-rat x (make-rat (denom y) (numer y))))

; test part
(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))

(display-rat (add-rat one-half one-third))
(display (equal-rat? one-half one-third))
(display-rat (sub-rat one-third one-half))
(display-rat (mul-rat one-third one-half))
(display-rat (div-rat one-third one-half))
