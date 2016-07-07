(define (accumulate op initial s)
        (if (null? s) initial
          (op (car s)
              (accumulate op initial (cdr s)))))

(define (map p s)
        (accumulate (lambda (x y) (cons (p x) (map p (cdr s)))) () s))

(define (append s1 s2)
        (accumulate cons s2 s1))

(define (length s)
  (accumulate (lambda (x y) (+ y 1)) 0 s))
; tests
(map square (list 1 2 3))
(append (list 3 4 5) (list 1 2 3))
(length (list 1 2 3 4 5))


