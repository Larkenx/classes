#lang racket
(require 2htdp/image)
(require test-engine/racket-tests)
(define v1 (vector 1 2 3))

;; A vecimg is an image represented internally as a vector of colors:
(define-struct vecimg (vec width) #:transparent)
 
;;
(define (bitmap->vecimg x)
  (make-vecimg (list->vector (image->color-list x))
               (image-width x)))
 
(define (vecimg->image v)
  (color-list->bitmap (vector->list (vecimg-vec v))
                      (vecimg-width v)
                      (vecimg-height v)))
 
(define (vecimg-height v)
  (quotient (vector-length (vecimg-vec v))
            (vecimg-width v)))

; => (list '#(color number) ...)
(define (count-elements v)
  (let [(result
         (local
           [(define (helper v n acc)
              (if (= n (vector-length v))
                  acc ; base case
                  (let*
                      ((c (vector-ref v n))
                       (index (vector-member c (first acc))))
                       
                    (cond
                      [(number? index) (begin
                                         (vector-set! (second acc) index (add1 (vector-ref  (second acc) index)))
                                         (helper v (add1 n) acc))]
                      [else (helper v (add1 n)  (list (vector-append (first acc) (vector c)) (vector-append (second acc) (vector 1)) ))]))))]
           (helper v 0 (list (vector) (vector)))))]
    (vector-map (lambda (x y) (vector x y)) (first result) (second result))))


(define (vector-fold fn base v)
  (local
    [(define (help fn base v n)
       (cond
         [(= (vector-length v) n) base]
         [else (fn (vector-ref v n) (help fn base v (add1 n)))]))]
    (help fn base v 0)))

(check-expect (count-elements '#("a" "b" "b" "c" "c" "c")) '#(#("a" 1) #("b" 2) #("c" 3)))
(check-expect (count-elements '#((color 255 255 255) (color 255 255 255) (color 0 0 0)))
              '#( #((color 255 255 255) 2) #((color 0 0 0) 1)))
    
(test)
;(define (blacken vimg
                 
                         
                     





