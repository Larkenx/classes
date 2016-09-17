;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; processes-student: Student -> ...
; processes-student a-student) ...
; processes is a term for conditional statements.

(define (processes-student a-student)
  (cond
    [(equal? a-student "freshman") ...]
    [(equal? a-student "sophomore") ...]
    [(equal? a-student "junior") ...]
    [(equal? a-student "senior") ...]
    )
  )

; Structures

; A vehicle is a (make-vehicle (String String Int)

(define-struct vehicle (make model year))
; <Constructor>
; (make-vehicle make model year)

; <Accessories of the Struct>
; (vehicle-make)
; (vehicle-model)
; (vehicle-year)

; <Predicate>
; vehicle?

; Template for vehicle
; processes-vehicle: Vehicle -> ...
; (processes-vehicle a-vehicle) ...

;(define (process-vehicle a-vehicle)
;  (... (vehicle-make a-vehicle) ...
;       (vehicle-model a-vehicle) ...
;       (vehicle-year a-vehicle) ...))

; Exercise 1

(define-struct photo (image tag))

; Functions created
; (make-photo image tag)
; (photo-image)
; (photo-tag)
; photo?


(define-struct 3d (x y z))

; Functions Created
; (make-3d x y z)
; (3d-x)
; (3d-y)
; (3d-z)
; 3d?

; Exercise 2

(define-struct item (tag price))
; An Item is a structure:
;   (make-item String PositiveNumber)
 
(define-struct AI (name field pay-rate))
; An AI is (represented by) a structure:
;   (make-AI String Field PositiveNumber)
; A Field is one of:
; – "biology"
; – "english"
; – "computer science"
; - "business"

(make-item "Computer" 2000)
(make-item "Vehicle" 5000)

(make-AI "Bill Gates" "Computer Science" 1000000000)
(make-AI "Richard Stallman" "Computer Science" 10)

; Exercise 3

(define-struct Cat (name species age feeding-time))
; A Cat is (represented by) a structure:
;   (make-Cat String String PositiveNumber String)
; A feeding-time is a string that represents
; time formatted in military time, such as "17:30"

; Exercise 4

; Template for Items
; procceses-items: Items -> ...
; (proccesses-items an-item)

(define (processes-items an-item)
  (... (item-tag an-item) ...
       (item-price an-item) ...))

; Exercise 5
; Template for AIs
; processes-AIs: AI -> ...
; (processes-AIs an-AI) ...

(define (processes-AIs an-ai)
  (... (AI-name an-ai) ...
       (AI-field an-ai) ...
       (AI-pay-rate an-ai) ...))

; Exercise 6
; Template for Cats
; processes Cats: Cats -> ...
; (processes-Cats a-cat)

(define (processes-Cats a-cat)
  (... (Cats-name a-cat) ...
       (Cats-species a-cat) ...
       (Cat-age a-cat) ...
       (Cat-feeding-time a-cat) ...))

; Exercise 7
;
; pay-raise: AI Number -> AI
; (pay-raise an-AI pay-rate) ...
; returns a doubled pay-rate for that AI

(define (pay-raise an-AI pay-raise-amount)
  (make-AI (AI-name an-AI) (AI-field an-AI) (* (AI-pay-rate an-AI) pay-raise-amount)))

(check-expect (pay-raise (make-AI "Steven Myers" "Biology" 15) 10) (make-AI "Steven Myers" "Biology" (* 15 10)))

; Exercise 8
;
; bonus: AI -> Number
; (bonus an-AI)
; processes an-AI for field and changes pay-rate
























