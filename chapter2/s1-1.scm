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
