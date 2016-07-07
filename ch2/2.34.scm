(define (accumulate op initial s)
  (if (null? s) initial
    (op (car s)
        (accumulate op initial (cdr s)))))

(define (horner-eval x s)
        (accumulate (lambda (this-coeff higher-terms) (+ this-coeff 
                                                         (* x higher-terms))) 0 s))

; tests
; from a0 to an
(horner-eval 2 (list 1 3 0 5 0 1))
