;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname assignment4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Note: My indentation is wonky just because I am writing my code,
; then going through and editing the files to 72 characters per line.
; Also, the big-bang function is commented out for submission.

; Design Recipe
; -------------
; Contract
; Purpose
; Data Definition if there's a struct
; Template

;;; Exercise 1 (Exercise 97 from the Book)


; Purpose: determines whether a given location's distance to the origin
; is strictly less than some constant R
; Location is one of:
; - Posn
; - Number
; Posn are positions on the Cartesian plane (x,y),
; Numbers are positions on either the x- or y-axis.
; location: (Number | Posn), distance: Number -> Boolean
; Template
; (define (in-reach? location distance)
;   (...
;     (number? location) ...
;     (posn? location) ...))

(define (in-reach? location distance)
  (cond
    [(number? location) (< (abs location) distance)]
    [(posn? location) (< (abs(sqrt (+ (expt (posn-x location) 2)
                                      (expt (posn-y location) 2))))
                         distance)]
    )) 

(check-expect (in-reach? (make-posn 2 2) 3) true)
(check-expect (in-reach? (make-posn 2 2) 1) false)
(check-expect (in-reach? 4 3) false)
(check-expect (in-reach? 4 7) true)

;;; Exercise 2
;
; (define-struct date (year month day))
;
; Constructor
; (make-date (year month day))
;
; Accessories
; (date-year)
; (date-month)
; (date-day)
;
; Predicate
; date?

;;; Exercise 3

; An address is represented by a structure:
;    (make-address (Number String String String))
;
; (define-struct address (house-number street-name city state))
; A state is a a two letter abbreviation for the state name.
; Street names will be strings without variations on
; streets such as "South Walnut", or "North Walnut."

;;; Exercise 4

; Template for address
; processes-address: address -> ...
; (processes-address an-address) ...

; (define (process-address an-address)
;   (... (address-house-number an-address) ...
;        (address-street-name an-address) ...
;        (address-city an-address) ...
;        (address-state an-address) ...
;        )
;   )

;;; Exercise 5

(define-struct address (house-number street-name city state))

; Tell if an address is on the even street side or not
; even-street-side?: Address -> Boolean
; (even-street-side? an-address) ...
; returns if street number is on the even side of the street

(define (even-street-side? an-address)
  (even? (address-house-number an-address)))

(check-expect (even-street-side?
               (make-address 1210 "Elm Ave" "Bloomington" "IN")) true)
(check-expect (even-street-side?
               (make-address 501 "Bob Ave" "Bloomington" "IN")) false)

;;; Exercise 6

; Determine which address given has a smaller street number
; smaller-street-number?: Address Address -> Address
; (small-street-number? a1 a2) ...
; returns the address with a smaller street number

(define (smaller-street-number? a1 a2)
  (cond
    [(> (address-house-number a1) (address-house-number a2)) a2]
    [(< (address-house-number a1) (address-house-number a2)) a1]
    )
  )

(check-expect (smaller-street-number?
               (make-address 42 "Washington" "Chicago" "IL")
               (make-address 10 "Johnson" "Indianapolis" "IN"))
              (make-address 10 "Johnson" "Indianapolis" "IN"))

(check-expect (smaller-street-number?
               (make-address 1 "Tenth Avenue" "Houston" "TX")
               (make-address 10 "Johnson" "Indianapolis" "IN"))
              (make-address 1 "Tenth Avenue" "Houston" "TX"))

;;; Exercise 7

; make a string that includes the given address within the string
; letter-greeting: Address -> String
; (letter-greeting an-address) ...
; returns a string including the address

(define (letter-greeting an-address)
  (string-append
   "To the resident(s) of "
    (number->string (address-house-number an-address)) " "
    (address-street-name an-address) " "
    (address-city an-address) ", "
    (address-state an-address)
    ": Your home has been selected for demolition by the mayor. "
    "You will be recompensed the market value of your home."
                 )             
  )

(check-expect (letter-greeting
               (make-address 309 "North Walnut" "Bloomington" "IN"))
              (string-append 
              "To the resident(s) of 309 North Walnut Bloomington, IN: "
              "Your home has been selected for demolition by the mayor."
              " You will be recompensed the market value of your home.")
              )

;;; Exercise 8

(require 2htdp/image)

; make a draw function that creates an image from a string
; draw: string -> image
; (draw a-string) ...

(define (draw a-string)
  (place-image (text a-string 15 "black") 400 25 (empty-scene 800 50)))

(check-satisfied (draw "Hello world") image?)

;;; Exercise 9

(require 2htdp/universe)

; Purpose: to create a key-event handler for a big-bang instance
; change-string: String String -> String
; (change-string w a-key) ...
; w is the string consumed by the big-bang instance
; the key is the string appended to w

; (define (change-string w a-key) (string-append w a-key))

;;; Exercise 10

; Purpose: to create a key-event handler for a big-bang
; instance that resets the string on space
; change-string: String String -> String
; (change-string w a-key) ...
; w is the string consumed by the big-bang instance, the key is
; the string appended to w
; Template
; (define (change-string w a-key)
;  (...
;      (... (string-append))
;      (... (string-append w a-key))))
 

(define (change-string w a-key)
  (cond
    [(key=? a-key " ") (string-append)]
    [(or (key=? a-key "shift")            ; This condition allows a user
         (key=? a-key "rshift"))          ; to use shift to make capital
     (string-append w)]                   ; letters & symbols 
    [else (string-append w a-key)]
    )
  )

; w is the world state string variable

(define w "")

; Purpose: create a big bang instance for the draw function
; big-bang: state-express clause

; (big-bang w [to-draw draw] [on-key change-string])