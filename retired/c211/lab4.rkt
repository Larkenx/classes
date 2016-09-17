;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; An AI is a (make-AI string string)
(define-struct AI (name class))

; a Professor is a (make-professor String String Int)
(define-struct professor (name class office))

; An instructor is one of:
; - AI
; - Professor

; processes-instructor: Instructor -> ...
; (process-instructor a-instructor) ...

;(define (process-instructor a-instructor)
; (cond
;    [(AI? a-instructor) (process-AI a-instructor)]
;    [(Professor? a-instructor) (process-professor a-instructor)]
;    )
;  )

; (check-expect (process-instructor a-instructor) ...)

; (define-struct doll (a-doll))

;;; Exercise 1

; A Frosting is one of:
;  - "chocolate"
;  - "vanilla"
 
; A Dessert is one of:
;  (make-cupcake Frosting)
;  (make-pie String Number)
 
(define-struct cupcake (frosting))
(define-struct pie (filling slices))

;;; Cupcake
; processes-cupcake Cupcake -> ...
; (processes-cupcake a-cupcake) ...

(define (processes-cupcake c)
  (...
   [(string=? (cupcake-frosting c) "chocolate") ...]
   [(string=? (cupcake-frosting c) "vanilla") ...]
   )
  )

; (check-expect (processes-cupcake (make-cupcake "vanilla")) ...)

;;; Pies
; processes-pie Pie -> ...
; (processes-pie a-pie) ...

(define (processes-pie p)
  (...
   [(string=? (pie-filling p) ...) ...]
   [(number=? (pie-slices p ) ...) ...]
   )
  )

; (check-expect (processes-pie (make-pie "apple" 6)) ...)

;;; Dessert

; processes-dessert: a-dessert -> ...
; (processes-dessert a-dessert) ...

(define (processes-dessert d)
  (...
   [(pie? d) ...]
   [(cupcake? d) ...]
   )
  )

; (check-expect (processes-dessert (make-cupcake "vanilla")) ...)

;;; Exercise 2

;;; Some deserts
(define applepie (make-pie "apple" 1))
(define chocolate-cupcake (make-cupcake "chocolate"))
(define vanilla-cupcake (make-cupcake "vanilla"))

;;; Exercise 3

; check-calories: Dessert -> ...
; (check-calories a-dessert) ...

(define (check-calories d)
  (cond
    [(and (cupcake? d) (string=? (cupcake-frosting d) "chocolate"))  150]
    [(and (cupcake? d) (string=? (cupcake-frosting d) "vanilla")) 125]
    [(pie? d) (* (pie-slices d) 175)]
    )
  )

(check-expect (check-calories applepie) 175)
(check-expect (check-calories vanilla-cupcake) 125)
(check-expect (check-calories chocolate-cupcake) 150)

;;; Exercise 4

; A case-of-dessert is one of:
; - empty
; - (make-case-of-dessert dessert case-of-dessert)

(define-struct case-of-dessert (a-dessert a-case-of-dessert))

;;; Exercise 5

(make-case-of-dessert (make-cupcake "vanilla") (make-case-of-dessert (make-cupcake "chocolate") empty))
(make-case-of-dessert empty empty)
(make-case-of-dessert (make-pie "apple" 2) (make-case-of-dessert empty empty))

;;; Exercise 6
; cod stands for case-of-dessert
; processes-cod: case-of-dessert -> ...
; (processes-cod a-cod) ...

(define (processes-cod a-cod)
  (cond
   [(empty? a-cod) ...]
   [(case-of-dessert? a-cod) ...]
   ))

; (check-expect (processes-cod (make-case-of-dessert (make-pie "apple" 2) (make-case-of-dessert empty empty))) ...)















  

