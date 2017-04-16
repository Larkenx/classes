;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname a8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require racket/list)
(require racket/base)
(require 2htdp/image)
(require math/statistics)
(require racket/vector)
(require test-engine/racket-tests)

(check-expect (vector 1 2 3 4) #(1 2 3 4))
(check-expect (make-vector 5 2) #(2 2 2 2 2))
(check-expect (build-vector 4 add1) #(1 2 3 4))
(check-expect (vector-ref #(2 4 7 9 1) 3) 9)
(check-expect (let ((x (make-vector 3 #t)))
                (vector-set! x 1 #f) x) (vector #true #false #true))

;;; E1A (functional)

;; middle : Vector -> List
;; Given a vector returns a list of the middle one or two elements of the vector
(define (middle v)
  (let ((l (vector-length v)))
    (cond
      ((equal? 0 l) '())
      ((odd? l) (list (vector-ref v (- (/ l 2) 0.5))))
      (else (list (vector-ref v (- (/ l 2) 1)) (vector-ref v (/ l 2)))))))
    
(check-expect (middle '#()) '())
(check-expect (middle '#(a)) '(a))
(check-expect (middle '#(a b)) '(a b))
(check-expect (middle '#(a b c d e)) '(c))
(check-expect (middle '#(a b c d e f)) '(c d))

;; vector-combine! : Vector, Function, Vector -> Vector
;; Takes a vector v1, a procedure of two arguments, and a vector v2 and returns
;; the vector created by applying the procedure to the correspondingn elements of
;; v1 and v2
(define (vector-combine! v1 f v2)
  (letrec
      [(helper (lambda (v1 f v2 n)
                 (if (= n (vector-length v1))
                     void
                     (begin
                       (vector-set! v1 n (f (vector-ref v1 n) (vector-ref v2 n)))
                       (helper v1 f v2 (add1 n))))))]
    (helper v1 f v2 0)))



(define v (vector 1))
(vector-set! v 0 2)
(check-expect (equal? (vector 2) v) #t)



(define (matrix-gen r c p)
  (letrec
      [(new-matrix (make-vecimg ...))
      
      (row-helper (lambda (r c)
                (if (= r -1) ; original r
                    (void)
                    (begin
                      (vecimg-set! new-matrix r c (p r c))
                      (row-helper (sub1 r) c)))))
    
    (col-helper (lambda (r c)
                  (if (= c -1)
                      (void)
                      (begin
                        (row-helper r c)
                        (col-helper r (sub1 c))))))]
    (col-helper r c)))
                      
         
                       
                     



         