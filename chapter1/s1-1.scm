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
