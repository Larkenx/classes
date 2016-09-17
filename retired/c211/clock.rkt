;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname clock) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; clock hour hand
(define hourhand (rectangle 5 275 "solid" "black"))
(define coverhourhand (rectangle 6 (/ 275 2) "solid" "white"))
(define hourhandarrow (triangle 100 "solid"  "black"))
;; base clock circle
(define clockcircle (circle 150 "solid" "white"))

(define place-hour-hand
  (place-image (place-image hourhand 150 150 clockcircle)
  (place-image coverhourhand 150 (- 275 68.75) clockcircle)
  (place-image hourhandarrow 150 25 clockcircle) 180 180 (empty-scene 360 360)))