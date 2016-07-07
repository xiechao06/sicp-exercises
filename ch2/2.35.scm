(define (accumulate op initial s)
  (if (null? s) initial
    (op (car s)
        (accumulate op initial (cdr s)))))
(define (count-leaves t)
        (accumulate (lambda (x y) (+ (if (pair? x) (count-leaves x) 1) y)) 
                    0 t))

; tests
(count-leaves (list (list 1 2) 3 (list 1 (list 3 4))))
