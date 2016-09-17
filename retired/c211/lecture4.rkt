;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lecture4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Write a function that calculates the amount of time between two time representations.

;; 1. time-between

; String String -> String
; calculates the difference between t1 and t2 (in hours and minutes)
; given: "09:12" and "09:41"
; expected: "0 hours and 29 minutes."

; (define (time-between t1 t2)
;   ... ) ;

(define (extract-hours time)
  (string->number (substring time 0 2)))

(define (extract-minutes time)
  (string->number (substring time 3 5)))

(check-expect (extract-hours "12:12") 12)
(check-expect (extract-minutes "17:21") 21)

; convert hours and minutes to minutes
(define (hours-and-minutes->minutes hours minutes)
  (+ (* 60 hours) minutes))

(check-expect (hours-and-minutes->minutes 5 10) 310)

; convert hours and minutes given as a string into minutes
(define (time->minutes time)
  (hours-and-minutes->minutes (extract-hours time) (extract-minutes time)))

; converts minutes to a time representation
(define (minutes->time minutes)
  (string-append
   (number->string (quotient minutes 60))
   " hours and "
   (number->string (remainder minutes 60))
   " minute"
   (if (> (remainder minutes 60) 1) "s" "")
   "."))

(define (time-between t1 t2)
  (minutes->time (- (time->minutes t1) (time->minutes t2))))
