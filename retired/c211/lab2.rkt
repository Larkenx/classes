;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; turkey-talk: Int -> String
; (turkey-talk temperature) : tells us whether to stop cooking or not

;(check-expect (turkey-talk 164) "Continue cooking")
;(check-expect (turkey-talk 166) "Stop cooking")
;(check-expect (turkey-talk 165) "Stop cooking")

(define (turkey-talk temperature)
  (if (< temperature 165) "Continue cooking" "Stop cooking"))

; turkey-talk-cond: Int->String
; turkey-talk-cond (temperature): tells us whether we should preheat the oven
; continue cooking, or stop.

(check-expect (turkey-talk-cond 0) "Preheat the oven")
(check-expect (turkey-talk-cond 150) "Continue Cooking")
(check-expect (turkey-talk-cond 165) "Stop cooking")

(define (turkey-talk-cond temperature)
  (cond
    [(<= temperature 0) "Preheat the oven"]
    [(< temperature 165) "Continue Cooking"]
    [(>= temperature 165) "Stop cooking"]))

; tilted-star: Num-> Image
; (tilted-star n) returns a gold star tilted by n degrees

(check-satisfied (tilted-star 5) image?)

(define (tilted-star n)
  (rotate n (star 100 "solid" (if (even? n) "goldenrod" "white"))))

; decibels: Integer -> String
; (decibel-rating d) returns string of comparable noise value

(check-expect (decibel-rating 10) "Leaves Rustling")
(check-expect (decibel-rating 15) "Leaves Rustling")
(check-expect (decibel-rating 19) "Leaves Rustling")
(check-expect (decibel-rating 20) "Quiet Room")
(check-expect (decibel-rating 25) "Quiet Room")
(check-expect (decibel-rating 29) "Quiet Room")
(check-expect (decibel-rating 30) "Whispering")
(check-expect (decibel-rating 35) "Whispering")
(check-expect (decibel-rating 39) "Whispering")
(check-expect (decibel-rating 40) "Conversation")
(check-expect (decibel-rating 45) "Conversation")
(check-expect (decibel-rating 59) "Conversation")
(check-expect (decibel-rating 60) "Television")
(check-expect (decibel-rating 65) "Television")
(check-expect (decibel-rating 69) "Television")

 
(define (decibel-rating d)
  (cond
    [(<= 10 d 19) "Leaves Rustling"]
    [(<= 20 d 29) "Quiet Room"]
    [(<= 30 d 39) "Whispering"]
    [(<= 40 d 59) "Conversation"]
    [(<= 60 d 69) "Television"]))