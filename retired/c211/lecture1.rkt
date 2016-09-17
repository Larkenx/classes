;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname animation_lecture) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;(define varname some expression)
;; load the animate function
(require 2htdp/universe)
;; load the image function
(require 2htdp/image)

(define wide (rectangle 100 5 "solid" "blue"))

(define tall (rectangle 5 100 "solid" "red"))
;; blank white canvas
(define canvas (empty-scene 100 100))

(define scene-height 200)
(define scene-width 200)
;;converts height to y axis (Y axis is inverted in Racket)
(define (h->y y) (- scene-height y))
(define (y->h h) (- scene-height h))

;;inputs: an x value, a height value
;; returns: an image with a circle drawn on my scene at the given x and height
(define (draw-circle x h)
  (place-image (circle 5 "solid" "red")
               x (h->y h)
               (empty-scene scene-height scene-width)))

(define (draw-image-at image x h)
  (place-image image
               x (h->y h)
               (empty-scene scene-height scene-width)))
;;define a function that rotates a given image
;;accepts an image, an angle, an x position and a height
(define (draw-rotated-image-at image angle x h)
  (place-image (rotate angle image)
               x (h->y h)
               (empty-scene scene-height scene-width)))


(define (draw-rotating-scene t) (draw-image-at (rotate t (rectangle 100 5 "solid" "red")) 100 100))

(define red-ellipse (ellipse 40 10 "solid" "red"))

(define (draw-scene t) (draw-rotated-image-at red-ellipse t 100 50))

(define (draw-sliding-circle t)
  (place-image (circle 20 "solid" "red")
               t (h->y 100)
               (empty-scene scene-height scene-width)))

;; rotating and sliding image
(define (draw-sliding-rotating-ellipse t)
  (place-image (rotate t red-ellipse)
               t (h->y 100)
               (empty-scene scene-height scene-width)))