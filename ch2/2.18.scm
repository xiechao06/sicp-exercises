(define (reverse l)
  (define (iter remain result)
          (if (null? remain)
              result
              (iter (cdr remain) (cons (car remain) result))))
  (iter l ()))

;test part
(reverse (list 1))
(reverse (list 1 2 3 4))
(reverse (list))
