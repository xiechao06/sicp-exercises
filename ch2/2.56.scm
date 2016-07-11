(define (variable? x)
        (symbol? x))
(define (same-variable? a1 a2)
        (and (variable? a1)
             (variable? a2)
             (eq? a1 a2)))
(define (sum? exp)
        (eq? (car exp) '+))

(define (make-sum a1 a2) (list '+ a1 a2))

(define (addend exp)
        (cadr exp))
(define (augend exp)
        (caddr exp))

(define (product? exp)
        (eq? (car exp) '*))

(define (multiplier exp) (cadr exp))
(define (multiplicand exp)
        (caddr exp))
(define (make-product a1 a2)
        (list '* a1 a2))



(define (deriv exp var)
        (cond ((number? exp) 0)
              ((variable? exp) (if (same-variable? exp var) 1 0))
              ((sum? exp) (make-sum (deriv (addend exp) var)
                                    (deriv (augend exp) var)))
              ((product? exp) 
               (make-sum 
                 (make-product (multiplier exp) 
                               (deriv (multiplicand exp) var))
                 (make-product (multiplicand exp)
                               (deriv (multiplier exp) var))))))

;tests
(deriv 3 'x)
(deriv 'x 'x)
(deriv 'y 'x)
(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)



