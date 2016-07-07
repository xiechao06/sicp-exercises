(define (dot-product v w)
        (fold-right + 0 (map * v w)))
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))
(define (accumulate-n op initial ss)
        (if (null? (car ss)) ()
          (cons (fold-right op initial (map car ss))
                (accumulate-n op initial (map cdr ss)))))
(define (transpose m)
        (accumulate-n (lambda (x y) (cons x y)) () m))

(define (matrix-*-matrix m n)
        (let ((cols (transpose n)))
          (map (lambda (r) (matrix-*-vector cols r)) m)))


; tests
(define m
        '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
(dot-product (list 1 2 3 4) (list 4 5 6 7))
(matrix-*-vector m (list 1 2 3 4))
(transpose m)
(matrix-*-matrix '((1 2 3) (3 2 1)) '((1 0) 
                                      (0 1) 
                                      (1 1)))
