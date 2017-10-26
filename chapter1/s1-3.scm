;; Exercise 1.29
;;

(define (cube x) (* x x x))
(define (identity x) x)
(define (inc x) (+ x 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (simpsons f a b n)
  (define h (/ (- b a) n))
  (define (yk k)
    (f (+ a (* k h))))
  (define (term k)
    (cond ((= k 0) (yk k))
	  ((= k n) (yk k))
	  ((even? k) (* 2 (yk k)))
	  (else (* 4 (yk k)))))
  (* (/ h 3) (sum term 0 inc n)))

(simpsons cube 0.0 1.0 100)

;Value: .24999999999999992

(simpsons cube 0.0 1.0 1000)

;Value: .2500000000000003

;; We can observe that the Simpsons rule is more accurate


;; Exercise 1.30
;;

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (+ result (term a)))))
  (iter a 0))

(sum identity 1 inc 10)

;Value: 55


;; Exercise 1.31
;;
;; a.

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial x)
  (product identity 1 inc x))

(factorial 5)

(define (approx-pi n)
  (define (term n)
    (if (even? n)
	(/ (+ n 2) (+ n 1))
	(/ (+ n 1) (+ n 2))))
  (* 4 (product term 1.0 inc n)))

;; b.

(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a) (product-rec term (next a) next b))))

(product-rec identity 1 inc 5)


;; Exercise 1.32
;;
;; a.

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(sum identity 1 inc 10)

(define (product term a next b)
  (accumulate * 1 term a next b))

(product identity 1 inc 5)

;; b.

(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (product-rec term (next a) next b))))

(accumulate-rec * 1 identity 1 inc 5)


;; Exercise 1.33


(define (filtered-accumulate predicate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (if (predicate a)
			   (combiner result (term a))
			   result))))
  (iter a null-value))

;; a.

(define (sum-squares-of-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

;; b.

(define (product-relative-primes n)
  (define (relative-prime? x)
    (= 1 (gcd x n)))
  (filtered-accumulate relative-prime? * 1 identity 1 inc n))


;; Exercise 1.34
;;
;; The interpreter stops with an error when trying to apply
;; 2 as a procedure. The evaluation will go like this:
;; (f f)
;; (f 2)
;; (2 2) -> this results in an error because 2 is not a procedure
