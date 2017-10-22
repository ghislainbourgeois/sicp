;;                    Exercise 1.1
;;
;; 10
;; 12
;; 8
;; 3
;; 6
;; a
;; b
;; 19
;; #f
;; 4
;; 16
;; 6
;; 16


;;                    Exercise 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))


;;                    Exercise 1.3
(define (square x)
        (* x x))

(define (sum-of-squares a b)
        (+ (square a)
           (square b)))

(define (sum-squares-two-largest a b c)
        (cond ((and (< a b) (< a c)) (sum-of-squares b c))
              ((and (< b a) (< b c)) (sum-of-squares a c))
              (else (sum-of-squares a b))))


;;                    Exercise 1.4
;;
;; This defines a procedure named a-plus-abs-b that takes two arguments, a and b.
;; When executed, the special form 'if' will first make the interpreter evaluate the
;; condition (> b 0). If the condition is true, the 'if' will evaluate to '+', else it
;; will evaluate to '-'. It will then add or substract b from a. This will effectively
;; be the same thing as adding the absolute value of b to a.


;;                    Exercise 1.5
;;
;; With applicative-order evaluation, (p) will first be evaluated. It will evaluate
;; to itself in a recursive fashion, and the procedure will not terminate.
;;
;; With the normal-order evaluation, the following evaluation will take place:
;;
;; (test 0 (p))
;; (if (= 0 0) 0 (p))
;; (if #t 0 (p))
;; 0
;;
;; In this case, (p) will never be evaluated so the procedure terminates with a value
;; of 0.


;;                    Exercise 1.6
;;
;; The procedure will never terminate and eventually crash. The reason is that new-if
;; is not a special form, so applicative-order evaluation will be used. This means that
;; the evaluation of the else-clause will be evaluated before new-if, creating an
;; infinite recursive call.


;;                    Exercise 1.7

;; Original version of sqrt-iter
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;; Original version good-enough?
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1 x))

;; Improved version of good-enough?
(define (good-enough? guess improved)
  (< (/ (abs (- guess improved)) guess) 0.0001))

;; Improved version of sqrt-iter
(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
    guess
    (sqrt-iter (improve guess x) x)))


;;                    Exercise 1.8

(define (cube-root-iter guess x)
  (if (good-enough? guess (improve-cube-root guess x))
    guess
    (cube-root-iter (improve-cube-root guess x) x)))

(define (improve-cube-root y x)
  (/ (+ (/ x (square y)) (* 2 y)) 3))

(define (cube-root x)
  (cube-root-iter 1 x))


;;                    Exercise 1.9
;;
;; (+ 4 5)
;; (if (= 4 0) 5 (inc (+ (dec 4) 5)))
;; (if #f 5 (inc (+ (dec 4) 5)))
;; (inc (+ (dec 4) 5))
;; (inc (+ 3 5))
;; (inc (if (= 3 0) 5 (inc (+ (dec 3) 5))))
;; (inc (if #f 5 (inc (+ (dec 3) 5))))
;; (inc (inc (+ (dec 3) 5)))
;; (inc (inc (+ 2 5)))
;; (inc (inc (if (= 2 0) 5 (inc (+ (dec 2) 5)))))
;; (inc (inc (if #f 5 (inc (+ (dec 2) 5)))))
;; (inc (inc (inc (+ (dec 2) 5))))
;; (inc (inc (inc (+ 1 5))))
;; (inc (inc (inc (if (= 1 0) 5 (inc (+ (dec 1) 5))))))
;; (inc (inc (inc (if #f 5 (inc (+ (dec 1) 5))))))
;; (inc (inc (inc (inc (+ (dec 1) 5)))))
;; (inc (inc (inc (inc (+ 0 5)))))
;; (inc (inc (inc (inc (if (= 0 0) 5 (inc (+ (dec 0) 5)))))))
;; (inc (inc (inc (inc (if #t 5 (inc (+ (dec 0) 5)))))))
;; (inc (inc (inc (inc 5))))
;; (inc (inc (inc 6)))
;; (inc (inc 7))
;; (inc 8)
;; 9
;;
;; This process was recursive
;;
;; (+ 4 5)
;; (if (= 4 0) 5 (+ (dec 4) (inc 5)))
;; (if #f 5 (+ (dec 4) (inc 5)))
;; (+ (dec 4) (inc 5))
;; (+ 3 6)
;; (if (= 3 0) 6 (+ (dec 3) (inc 6)))
;; (if #f 6 (+ (dec 3) (inc 6)))
;; (+ (dec 3) (inc 6))
;; (+ 2 7)
;; (if (= 2 0) 7 (+ (dec 2) (inc 7)))
;; (if #f 7 (+ (dec 2) (inc 7)))
;; (+ (dec 2) (inc 7))
;; (+ 1 8)
;; (if (= 1 0) 8 (+ (dec 1) (inc 8)))
;; (if #f 8 (+ (dec 1) (inc 8)))
;; (+ (dec 1) (inc 8))
;; (+ 0 9)
;; (if (= 0 0) 9 (+ (dec 0) (inc 9)))
;; (if #t 9 (+ (dec 0) (inc 9)))
;; 9
;;
;; This process was iterative


;;                    Exercise 1.10
;;
;; (A 1 10)
;; (A 0 (A 1 9))
;; (A 0 (A 0 (A 1 8)))
;; (A 0 (A 0 (A 0 (A 1 7))))
;; (A 0 (A 0 (A 0 (A 0 (A 1 6)))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 32)))))
;; (A 0 (A 0 (A 0 (A 0 64))))
;; (A 0 (A 0 (A 0 128)))
;; (A 0 (A 0 256))
;; (A 0 512)
;; 1024
;;
;; (A 2 4)
;; (A 1 (A 2 3))
;; (A 1 (A 1 (A 2 2)))
;; (A 1 (A 1 (A 1 (A 2 1))))
;; (A 1 (A 1 (A 1 2)))
;; (A 1 (A 1 (A 0 (A 1 1))))
;; (A 1 (A 1 (A 0 2)))
;; (A 1 (A 1 4))
;; (A 1 (A 0 (A 1 3)))
;; (A 1 (A 0 (A 0 (A 1 2))))
;; (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
;; (A 1 (A 0 (A 0 (A 0 2))))
;; (A 1 (A 0 (A 0 4)))
;; (A 1 (A 0 8))
;; (A 1 16)
;; (A 0 (A 1 15))
;; (A 0 (A 0 (A 1 14)))
;; (A 0 (A 0 (A 0 (A 1 13))))
;; (A 0 (A 0 (A 0 (A 0 (A 1 12)))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 11))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 10)))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 9))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 8)))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 7))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 6)))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 32)))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 64))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 128)))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 256))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 512)))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1024))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 2048)))))
;; (A 0 (A 0 (A 0 (A 0 4096))))
;; (A 0 (A 0 (A 0 8192)))
;; (A 0 (A 0 16384))
;; (A 0 32768)
;; 65536
;;
;; (A 3 3)
;; (A 2 (A 3 2))
;; (A 2 (A 2 (A 3 1)))
;; (A 2 (A 2 2))
;; (A 2 (A 1 (A 2 1)))
;; (A 2 (A 1 2))
;; (A 2 (A 0 (A 1 1)))
;; (A 2 (A 0 2))
;; (A 2 4)
;; This is the same thing as above from this point
;; 65536
;;
;; 2n
;; 2^n
;; 2^2^... (n-1 times)


;; Exercise 1.11
;;
;; f(n) = n   if n < 3
;; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >=3
;;
;; recursive

(define (f n)
  (cond ((< n 3) n)
	(else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

;; iterative

(define (f n)
  (define (f-iter x a b c)
    (cond ((> x n) a)
	  ((< x 3) (f-iter (+ x 1) x a b))
	  (else (f-iter (+ x 1) (+ a (* 2 b) (* 3 c)) a b))))
  (f-iter 1 0 0 0))


;; Exercise 1.12

(define (pascal row col)
  (cond ((> col row) 0)
	((= row 1) 1)
	((= col 1) 1)
	((= col row) 1)
	(else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))


;; Exercise 1.16

(define (even? n)
  (= (remainder n 2) 0))

(define (exp b n)
  (define (exp-iter a b n)
    (cond ((= n 0) a)
	  ((even? n) (exp-iter a (square b) (/ n 2)))
	  (else (exp-iter (* a b) b (- n 1)))))
  (exp-iter 1 b n))


;; Exercise 1.17

(define (double x)
  (+ x x))
(define (halve x)
  (/ x 2))

(define (my* a b)
  (cond ((= b 0) 0)
        ((even? b) (my* (double a) (halve b)))
	(else (+ a (my* a (- b 1))))))


;; Exercise 1.18

(define (multiply a b)
  (define (iter a b sum)
    (cond ((= b 0) sum)
	  ((even? b) (iter (double a) (halve b) sum))
	  (else (iter a (- b 1) (+ sum a)))))
  (iter a b 0))


;; Exercise 1.19

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
		   (+ (* 2 p q) (square q))
                   (/ count 2)))
         (else (fib-iter (+ (* b q) (* a q) (* a p))
                         (+ (* b p) (* a q))
                         p
                         q
                         (- count 1)))))
