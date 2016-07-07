(define (accumulate op initial s)
  (if (null? s) initial
    (op (car s)
        (accumulate op initial (cdr s)))))

(define (accumulate-n op initial ss)
        (if (null? (car ss)) ()
          (cons (accumulate op initial (map car ss))
                (accumulate-n op initial (map cdr ss)))))

; tests
(accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
