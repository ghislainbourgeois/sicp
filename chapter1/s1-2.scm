
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

;; Exercise 1.20

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; normal-order evaluation
;;
;; (gcd 206 40)
;; (if (= 40 0) 206 (gcd 40 (remainder 206 40)))
;; (if #f 206 (gcd 40 (remainder 206 40)))
;; (gcd 40 (remainder 206 40))
;; (if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;; (if (= 6 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;; (if #f 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;; (if (= (remainder 40 (remainder 206 40)) 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; (if (= (remainder 40 6) 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; (if (= 4 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; (if #f (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;; (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; (if (= (remainder 6 (remainder 40 6)) 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; (if (= (remainder 6 4) 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; (if (= 2 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; (if #f (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; (if (= (remainder (remainder 40 6) (remainder 6 (remainder 40 6))) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; (if (= (remainder 4 (remainder 6 4)) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; (if (= (remainder 4 2) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; (if (= 0 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; (if #t (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;; (remainder 6 (remainder 40 6))
;; (remainder 6 4)
;; 2
;;
;; applicative-order evaluation
;;
;; (gcd 206 40)
;; (if (= 40 0) 206 (gcd 40 (remainder 206 40)))
;; (if #f 206 (gcd 40 (remainder 206 40)))
;; (gcd 40 (remainder 206 40))
;; (gcd 40 6)
;; (if (= 40 0) 206 (gcd 6 (remainder 40 6)))
;; (if #f 206 (gcd 6 (remainder 40 6)))
;; (gcd 6 (remainder 40 6))
;; (gcd 6 4)
;; (if (= 4 0) 6 (gcd 4 (remainder 6 4)))
;; (if #f 6 (gcd 4 (remainder 6 4)))
;; (gcd 4 (remainder 6 4))
;; (gcd 4 2)
;; (if (= 2 0) 4 (gcd 2 (remainder 4 2)))
;; (if #f 4 (gcd 2 (remainder 4 2)))
;; (gcd 2 (remainder 4 2))
;; (gcd 2 0)
;; (if (= 0 0) 2 (gcd 0 (remainder 2 0)))
;; (if #t 2 (gcd 0 (remainder 2 0)))
;; 2


;; Exercise 1.21
;;

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(smallest-divisor 199)
199

(smallest-divisor 1999)
1999

(smallest-divisor 19999)
7


;; Exercise 1.22
;;

(define (prime? n)
  (= n (smallest-divisor n)))
(define (timed-primed-test n)
  ;;(newline)
  ;;(display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))
(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (search-for-primes a b)
  (cond ((> a b) 0)
	((even? a) (search-for-primes (+ a 1) b))
	(else (timed-primed-test a) (search-for-primes (+ a 2) b))))

(newline)
(display "(search-for-primes 1000000000 1000000021)")
(newline)
(search-for-primes 1000000000 1000000021)
(display "(search-for-primes 10000000000 10000000061)")
(newline)
(search-for-primes 10000000000 10000000061)
(display "(search-for-primes 100000000000 100000000057)")
(newline)
(search-for-primes 100000000000 100000000057)
(display "(search-for-primes 1000000000000 1000000000063)")
(newline)
(search-for-primes 1000000000000 1000000000063)

;; (search-for-primes 1000000000 1000000021)
;; 1000000007 *** 3.0000000000001137e-2
;; 1000000009 *** 3.0000000000001137e-2
;; 1000000021 *** 3.0000000000001137e-2
;;
;; (search-for-primes 10000000000 10000000061)
;; 10000000019 *** .08999999999999986
;; 10000000033 *** .09999999999999787
;; 10000000061 *** .10000000000000142
;;
;; (search-for-primes 100000000000 100000000057)
;; 100000000003 *** .3200000000000003
;; 100000000019 *** .3000000000000007
;; 100000000057 *** .3100000000000023
;;
;; (search-for-primes 1000000000000 1000000000063)
;; 1000000000039 *** .9800000000000004
;; 1000000000061 *** .990000000000002
;; 1000000000063 *** .9800000000000004
;;
;; We can see that that the time needed increases around 3x, or approximately
;; the square root of 10. This confirm the expected growth and that the
;; computer time increases proportionnaly to the number of steps.


;; Exercise 1.23

(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

(newline)
(display "(search-for-primes 1000000000 1000000021)")
(newline)
(search-for-primes 1000000000 1000000021)
(display "(search-for-primes 10000000000 10000000061)")
(newline)
(search-for-primes 10000000000 10000000061)
(display "(search-for-primes 100000000000 100000000057)")
(newline)
(search-for-primes 100000000000 100000000057)
(display "(search-for-primes 1000000000000 1000000000063)")
(newline)
(search-for-primes 1000000000000 1000000000063)

;; (search-for-primes 1000000000 1000000021)
;; 1000000007 *** .01999999999999602
;; 1000000009 *** 2.0000000000003126e-2
;; 1000000021 *** .00999999999999801
;; (search-for-primes 10000000000 10000000061)
;; 10000000019 *** .05999999999999517
;; 10000000033 *** 6.0000000000002274e-2
;; 10000000061 *** .07000000000000028
;; (search-for-primes 100000000000 100000000057)
;; 100000000003 *** .17999999999999972
;; 100000000019 *** .20000000000000284
;; 100000000057 *** .18999999999999773
;; (search-for-primes 1000000000000 1000000000063)
;; 1000000000039 *** .6099999999999994
;; 1000000000061 *** .6000000000000014
;; 1000000000063 *** .6099999999999994
;;
;; We can observe that this version is about 1.5 times faster. This
;; can be explained by the added if condition that happens at
;; each step and that was not there before.


;; Exercise 1.24
;;
;; Taking the logarithms of 1,000,000,000 and 1,000,000,000,000,
;; we obtain 9 and 12 respectively. We would expect the time needed
;; for the largest primes to be about 1.3 times longer than for the
;; smaller primes.

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder
	  (square (expmod base (/ exp 2) m))
	  m))
	(else
	 (remainder
	  (* base (expmod base (- exp 1) m))
	  m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10000)
      (report-prime n (- (runtime) start-time))))

(newline)
(display "(search-for-primes 1000000000 1000000021)")
(newline)
(search-for-primes 1000000000 1000000021)
(display "(search-for-primes 10000000000 10000000061)")
(newline)
(search-for-primes 10000000000 10000000061)
(display "(search-for-primes 100000000000 100000000057)")
(newline)
(search-for-primes 100000000000 100000000057)
(display "(search-for-primes 1000000000000 1000000000063)")
(newline)
(search-for-primes 1000000000000 1000000000063)

;; (search-for-primes 1000000000 1000000021)
;; 1000000007 *** .6199999999999903
;; 1000000009 *** .6099999999999994
;; 1000000021 *** .6099999999999994
;; (search-for-primes 10000000000 10000000061)
;; 10000000019 *** .7000000000000028
;; 10000000033 *** .6899999999999977
;; 10000000061 *** .730000000000004
;; (search-for-primes 100000000000 100000000057)
;; 100000000003 *** .7900000000000063
;; 100000000019 *** .7999999999999972
;; 100000000057 *** .8100000000000023
;; (search-for-primes 1000000000000 1000000000063)
;; 1000000000039 *** .8400000000000034
;; 1000000000061 *** .8400000000000034
;; 1000000000063 *** .8499999999999943
;;
;; From those results, we can confirm the expected increase of
;; around 1.3 times. (.84 / 1.3 = .64)


;; Exercise 1.25
;;
(define (fast-expt b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

;; She is not correct. This version needs to calculate the remainder on
;; really large numbers. This takes a lot more time than the more complex
;; version.


;; Exercise 1.26
;;
;; By using an explicit multiplication instead of the square function,
;; the expmod function will be evaluated twice with the same parameters
;; before doing the multiplication.


;; Exercise 1.27
;;

(define (carmichael? n)
  (define (try-it? a)
    (= (expmod a n n) a))
  (define (iter a)
    (cond ((= a n) true)
	  ((try-it? a) (iter (+ a 1)))
	  (else false)))
  (iter 1))

(display (carmichael? 561)) ;; #t
(newline)
(display (carmichael? 1105)) ;; #t
(newline)
(display (carmichael? 1729)) ;; #t
(newline)
(display (carmichael? 2465)) ;; #t
(newline)
(display (carmichael? 2821)) ;; #t
(newline)
(display (carmichael? 6601)) ;; #t
(newline)


;; Exercise 1.28
;;


(define (expmod base exp m)
  (define (square-mod-and-check a)
    (define (non-trivial-sqrt1 a square)
      (if (and (= square 1)
	       (not (= a 1))
	       (not (= a (- m 1))))
	  0
	  square))
    (non-trivial-sqrt1 a (remainder (square a) m)))
  (cond ((= exp 0) 1)
	((even? exp)
	 (square-mod-and-check (expmod base (/ exp 2) m)))
	(else
	 (remainder
	  (* base (expmod base (- exp 1) m))
	  m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(display "7 is prime ")
(display (fast-prime? 7 5))
(newline)
(display "53 is prime ")
(display (fast-prime? 53 5))
(newline)
(display "561 is prime ")
(display (fast-prime? 561 5))
(newline)
(display "1000000007 is prime ")
(display (fast-prime? 1000000007 5))
(newline)
