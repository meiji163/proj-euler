#lang racket

(define (cont-frac num-func denom-func k)
  (define (iter frac i)
    (if (< i 0)
        frac
        (iter (/ (num-func i) (+ frac (denom-func i))) (- i 1))))
  (iter (/ (num-func k) (denom-func k)) (- k 1)))


(define (e-denom i)
  (cond ((eq? i 1)
         2)
         ((eq? (remainder i 3) 0)
         (* 2 (/ i 3)))
         (else 1)))

(define (e-numer i) 1)

(define e-convergent 
  (lambda (k) (cont-frac e-numer e-denom k)))

(define (sum-of-digits n) 
  (define (iter n sum)
    (if (= n 0)
        sum
        (iter (quotient n 10) (+ (remainder n 10) sum))))
  (iter n 0))

(displayln (sum-of-digits (numerator (e-convergent 100))))
