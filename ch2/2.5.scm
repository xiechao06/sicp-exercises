(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (exp base n) 
  (define (iter x result)
    (if (= x 0) 
      result
      (iter (- x 1) (* base result))
      ))
  (iter n 1))

(define (count-0-remainder-divisions n divisor)
  (define (iter result)
    (if (= 0 (remainder n (exp divisor result)))
           (iter (+ result 1))
           (- result 1)))
  (iter 1))

(define (car z) (count-0-remainder-divisions z 2))
(define (cdr z) (count-0-remainder-divisions z 3))

; test part
(car (cons 102 39))
(cdr (cons 103 29))

