(define (square-tree-1 t)
        (map (lambda (s) 
               (cond ((null? s) ())
                     ((pair? s) (square-tree-1 s))
                     (else (square s)))) 
             t))

(define (square-tree-2 t)
  (if (null? t) () 
    (let ((head (car t))
         (rest (cdr t)))
      (cons (if (pair? head) (square-tree-2 head) (square head)) (square-tree-2 rest))
     )))


; tests
(define tree (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
(square-tree-1 tree)
(square-tree-2 tree)
