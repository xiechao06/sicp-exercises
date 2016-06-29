(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
; test part
((zero (lambda (x) (* x 2))) 2)
(((add-1 zero) (lambda (x) (* x 2))) 2)
((one (lambda (x) (* x 2))) 2)
((two (lambda (x) (* x 2))) 2)
(((add-1 two) (lambda (x) (* x 2))) 2)
