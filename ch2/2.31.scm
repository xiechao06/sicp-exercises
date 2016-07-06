(define (map-tree proc t)
        (if (null? t) ()
          (let ((head (car t))
                (rest (cdr t)))
            (cons (if (pair? head) (map-tree proc head)
                    (proc head)) (map-tree proc rest)))))

; tests
(define tree (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
(map-tree square tree)
