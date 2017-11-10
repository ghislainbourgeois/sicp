;; Exercise 2.1

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< (/ n d) 0)
	(cons (/ (- (abs n)) g) (/ (abs d) g))
	(cons (/ (abs n) g) (/ (abs d) g)))))
    

;; Exercise 2.2

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (average x y)
  (/ (+ x y) 2))

(define (midpoint-segment segment)
  (make-point
   (average (x-point (start-segment segment)) (x-point (end-segment segment)))
   (average (y-point (start-segment segment)) (y-point (end-segment segment)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define point-a (make-point 1 2))
(define point-b (make-point 5 7))
(define segment (make-segment point-a point-b))

(print-point point-a)
(print-point point-b)
(print-point (midpoint-segment segment))
   

;; Exercise 2.3

(define (make-rectangle origin height width)
  (cons origin (cons height width)))

(define (rect-height rect)
  (car (cdr rect)))

(define (rect-width rect)
  (cdr (cdr rect)))

(define (perimeter rect)
  (+ (* 2 (rect-height rect))
     (* 2 (rect-width rect))))

(define (area rect)
  (* (rect-height rect)
     (rect-width rect)))

(define rectA (make-rectangle (make-point 0 0) 10 5))
(newline)
(display "Perimeter of rectangle A: ")
(display (perimeter rectA))
(newline)
(display "Area of rectangle A: ")
(display (area rectA))

(define (make-rectangle origin height width)
  (cons (make-segment origin
		      (make-point (+ (x-point origin) width)
				  (y-point origin)))
	(make-segment (make-point (x-point origin)
				  (+ (y-point origin) height))
		      (make-point (+ (x-point origin) width)
				  (+ (y-point origin) height)))))

(define (rect-height rect)
  (abs (- (y-point (start-segment (cdr rect)))
	  (y-point (start-segment (car rect))))))

(define (rect-width rect)
  (abs (- (x-point (start-segment (car rect)))
	  (x-point (end-segment (car rect))))))

(define rectB (make-rectangle (make-point 0 0) 10 5))
(newline)
(display "Perimeter of rectangle B: ")
(display (perimeter rectB))
(newline)
(display "Area of rectangle B: ")
(display (area rectB))


;; Exercise 2.4

;(define (cdr z)
;  (z (lambda (p q) q)))

;; (define pair (cons 1 2))
;; (define pair (lambda (m) (m 1 2)))
;; (define (pair m) (m 1 2))
;; (cdr pair)
;; (pair (lambda (p q) q))
;; ((lambda (p q) q) 1 2)
;; 2


;; Exercise 2.5

(define (cons2.5 a b)
  (* (expt 2 a) (expt 3 b)))

(define (find-expt-iter x div count)
  (if (= 0 (remainder x div))
      (find-expt-iter (/ x div) div (+ 1 count))
      count))

(define (car2.5 z)
  (find-expt-iter z 2 0))

(define (cdr2.5 z)
  (find-expt-iter z 3 0))


;; Exercise 2.6

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (inc x) (+ 1 x))
(newline)
(display ((one inc) 0))
(newline)
(display (((add-1 zero) inc) 0))
(newline)
(display ((two inc) 0))
(newline)
(display (((add-1 (add-1 zero)) inc) 0))

(define (church+ a b)
  (lambda (f) (lambda (x)
		((a f) ((b f) x)))))

(newline)
(newline)
(display (((church+ two two) inc) 0))
(newline)
(display (((church+ two one) inc) 0))
(newline)
(display (((church+ two zero) inc) 0))
(newline)
(display (((church+ two (add-1 (add-1 (add-1 two)))) inc) 0))


;; Exercise 2.7

(define (make-interval a b) (cons a b))

(define (upper-bound x)
  (if (> (car x) (cdr x))
      (car x)
      (cdr x)))

(define (lower-bound x)
  (if (< (car x) (cdr x))
      (car x)
      (cdr x)))


;; Exercise 2.8

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (add-interval
   x
   (make-interval (- (lower-bound y))
		  (- (upper-bound y)))))

(sub-interval (make-interval 1 2) (make-interval 2 3))
