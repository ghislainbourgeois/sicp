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


;; Exercise 1.35

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (f x)
  (+ 1 (/ 1 x)))

(fixed-point f 1.0)


;; Exercise 1.36

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (func x)
  (/ (log 1000)
     (log x)))

(fixed-point func 2.0)

;; 2.
;; 9.965784284662087
;; 3.004472209841214
;; 6.279195757507157
;; 3.759850702401539
;; 5.215843784925895
;; 4.182207192401397
;; 4.8277650983445906
;; 4.387593384662677
;; 4.671250085763899
;; 4.481403616895052
;; 4.6053657460929
;; 4.5230849678718865
;; 4.577114682047341
;; 4.541382480151454
;; 4.564903245230833
;; 4.549372679303342
;; 4.559606491913287
;; 4.552853875788271
;; 4.557305529748263
;; 4.554369064436181
;; 4.556305311532999
;; 4.555028263573554
;; 4.555870396702851
;; 4.555315001192079
;; 4.5556812635433275
;; 4.555439715736846
;; 4.555599009998291
;; 4.555493957531389
;; 4.555563237292884
;; 4.555517548417651
;; 4.555547679306398
;; 4.555527808516254
;; 4.555540912917957
;; ;... done
;; ;Value: 4.555532270803653
;;
;; 33 steps

(define (func x)
  (average x
	   (/ (log 1000)
	      (log x))))

(fixed-point func 2.0)
;; 2.
;; 9.965784284662087
;; 3.004472209841214
;; 6.279195757507157
;; 3.759850702401539
;; 5.215843784925895
;; 4.182207192401397
;; 4.8277650983445906
;; 4.387593384662677
;; 4.671250085763899
;; 4.481403616895052
;; 4.6053657460929
;; 4.5230849678718865
;; 4.577114682047341
;; 4.541382480151454
;; 4.564903245230833
;; 4.549372679303342
;; 4.559606491913287
;; 4.552853875788271
;; 4.557305529748263
;; 4.554369064436181
;; 4.556305311532999
;; 4.555028263573554
;; 4.555870396702851
;; 4.555315001192079
;; 4.5556812635433275
;; 4.555439715736846
;; 4.555599009998291
;; 4.555493957531389
;; 4.555563237292884
;; 4.555517548417651
;; 4.555547679306398
;; 4.555527808516254
;; 4.555540912917957
;; 2.
;; 5.9828921423310435
;; 4.922168721308343
;; 4.628224318195455
;; 4.568346513136242
;; 4.5577305909237005
;; 4.555909809045131
;; 4.555599411610624
;; 4.5555465521473675
;; ;... done
;; ;Value: 4.555537551999825
;;
;; 42 steps
;;
;; The average damping increases the number of steps slightly.


;; Exercise 1.37
;;
;; a.

(define (cont-frac n d k)
  (define (iter k result)
    (if (= k 0)
	result
	(iter (- k 1) (/ (n k) (+ (d k) result)))))
  (iter k 0))

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   11)

;; We need 11 steps to get 4 digits accurate.
;;
;; b.

(define (cont-frac-rec n d k)
  (define (iter i)
    (if (= i k)
	(/ (n i) (d i))
	(/ (n i) (+ (d i) (iter (inc i))))))
  (iter 1))

(cont-frac-rec (lambda (i) 1.0)
	       (lambda (i) 1.0)
	       19)


;; Exercise 1.38

(define (euler-approx k)
  (define (d i)
    (if (= 2 (remainder i 3))
	(* 2 (+ (/ i 3) 1))
	1))

  (+ 2
     (cont-frac (lambda (i) 1.0)
		(lambda (i)
		  (if (= 2 (remainder i 3))
		      (/ (+ i 1) 1.5)
		      1))
	        k)))

(euler-approx 50)


;; Exercise 1.39

(define (tan-cf x k)
  (cont-frac (lambda (i)
	       (if (= i 1)
		   x
		   (- (square x))))
	     (lambda (i)
	       (- (* 2 i) 1))
	     k))

(tan-cf 1.0 10)
