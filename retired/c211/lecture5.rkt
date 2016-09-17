;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lecture5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Data Structures
;; ---------------
;; - a single data type that contains multiple sub-items.

;;; Introduces four new syntactic elements
;; * (define-struct name (field1, field2, .... , field_n))
;; - define a new struct
;; * (make-name value1, value2, ... value_n)
;; - make an instance of the struct
;; * (name-field1 var); (name-field2 var), (name-.... var),
;; - access a field out of a struct
;; * (name? var)
;; - check if a given variable is of type name

;; Examples:

(define-struct book (title author price))

;; a book is now a structure

(define htdp (make-book "How to Design Programs" "Felleisen" 25))
(define iliad (make-book "The Iliad" "Homer" 15))
(define hpss (make-book "Harry Potter and the Sorcerer's Stone." "Rowling" 12))

; Design a function that consumes a book and number and produces the cost of buying
; the given number of copies of the given book.

; String Number -> Number
(define (cost name qty)
  (cond
    [(string=? (book-title htdp) name) (* qty (book-price htdp))]
    [(string=? (book-title iliad) name) (* qty (book-price iliad))]
    [(string=? (book-title hpss) name) (* qty (book-price hpss))]
    )
  )

(require 2htdp/image)
(require 2htdp/universe)

;; Ball Structure
(define-struct ball (radius x-pos y-pos))

;; Box Structure
(define-struct box (width height x-pos y-pos))

; Draw-A-Shape Function
(define (draw-shape a-shape)
  (cond
    [(ball? a-shape) (place-image (circle (ball-radius a-shape)
                                          "solid" "turquoise")
                                  (ball-x-pos a-shape) (ball-y-pos a-shape) (empty-scene 200 200))]
    [(box? a-shape) (place-image (rectangle (box-width a-shape) (box-height a-shape)
                                            "solid" "turquoise")
                                 (box-x-pos a-shape) (box-y-pos a-shape) (empty-scene 200 200))]
    )
  )

; Grow-Shape Function
(define (grow-shape s)
  (cond
    [(ball? s) (make-ball (+ 1 (ball-radius s)) (+ 1 (ball-x-pos s)) (+ 1 (ball-y-pos s)))]
    [(box? s) (make-box (+ 1 (box-width s)) (+ 1 (box-height s)) (+ 1 (box-x-pos s)) (+ 1 (box-y-pos s)))]
    )
  )
