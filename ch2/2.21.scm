(define (square-list-1 . w)
        (map (lambda (x) (* x x)) w))

(define (square-list-2 . w)
        (if (null? w) ()
          (cons (* (car w) (car w)) (apply square-list-2 (cdr w)))))


;tests
(square-list-1 1 2 3 4)
(square-list-2 1 2 3 4)
