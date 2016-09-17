;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname assignment5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;;; Exercise 1
;
; quadrants: Number String String String String -> Image
; Create an image that produces four images placed in quadrants
; (quadrants dimension color1 color2 color3 color4) ...

(define (quadrants dimension color1 color2 color3 color4)
  (above
   (beside (overlay
            (circle (/ dimension 2) "solid" color1)
            (square dimension "solid" "white")) 
           (overlay
            (square dimension "solid" color2)
            (square dimension "solid" "white")))
   (beside (overlay
            (ellipse dimension (/ dimension 2) "solid" color3)         
            (square dimension "solid" "white"))
           (overlay
            (triangle dimension "solid" color4)
            (square dimension "solid" "white")))))

(quadrants 40 "red" "blue" "green" "purple")
(check-expect (quadrants 40 "red" "blue" "green" "purple")
              (above
               (beside (overlay
                        (circle (/ 40 2) "solid" "red")
                        (square 40 "solid" "white")) 
                       (overlay
                        (square 40 "solid" "blue")
                        (square 40 "solid" "white")))
               (beside (overlay
                        (ellipse 40 (/ 40 2) "solid" "green")         
                        (square 40 "solid" "white"))
                       (overlay
                        (triangle 40 "solid" "purple")
                        (square 40 "solid" "white")))))

;;; Exercise 2
;
; (define-struct sun (sun))
; A Sun is a structure:
; (make-sun sun)
; A sun is located at the center of a solar system, therefore the
; distance of the sun to the center is zero.

;;; Exercise 3
;
; (define-struct planet (distance inner-planet))
; A planet is a structure:
; (make-planet Number planet)
; A planet contains both the distance to the next inner planet and the
; inner planet itself.

;;; Exercise 4
; A solar-object is one of:
; ------------------------
; -A sun
; -(make-planet Number, solar-object)
; ------------------------

;;; Exercise 5

; process-sun: sun-> ...
; (process-sun a-sun) ...
; Template:
; ---------
; (define (process-sun a-sun)
;  (cond
;    [(sun? a-sun) (process-sun a-sun)...]
;    [(empty? a-sun) ...]
;    )
;  )
; (check-expect (process-sun (make-sun ...)) ...)

; process-planet: Planet -> ...
; (process-planet neptune) ...
; Template:
; ---------
; (define (process-planet a-planet)
;  (cond
;    [(empty? (planet-distance a-planet)) ...]
;    [(empty? (planet-planet a-planet)) ...)]
;    [(number=? (planet-distance a-planet)) ...)]
;    [(planet? (planet-planet a-planet))
;              (process-planet (planet-planet a-planet)))]
;    [else ...]
;    )
;  )
; (check-expect
;  (process-planet (make-planet 1 (make-planet empty empty)) ...)

; process-solar-object: solar-object -> ...
; (process-solar-object an-object) ...
; Template:
; ---------
; (define (process-solar-object an-object)
;  (cond
;    [(sun? an-object)
;     (process-sun an-object)]
;    [(planet? an-object)
;     (process-planet an-object)]
;    )
;  )

;;; Exercise 6
;
; Create a function that calculates the distance between
; the outermoust solar object and the center (the sun)
; find-farthest-distance: Solar-Object -> Number
; Template:
; (define (find-farthest-distance solar-object)
;  (cond
;    [(sun? solar-object)
;     (process-sun solar-object)]
;    [(planet? an-object)
;     (process-planet solar-object)]
;    )
;  )

(define-struct planet (distance inner-planet))
(define-struct sun (empty))
(define test-system
  (make-planet 20
               (make-planet 10
                            (make-planet 50
                                         (make-sun empty)))))

(define (find-farthest-distance solar-object)
  (cond
    [(sun? solar-object) 0]
    [(planet? solar-object) (+ (planet-distance solar-object)
                               (find-farthest-distance
                                (planet-inner-planet solar-object)))] 
    )
  )
(check-expect (find-farthest-distance test-system) 80)

;;; Exercise 7
; make-new-object: Solar-Object Number -> Solar-Object
; Purpose: Make a functon that creates a new planet by taking the given
; solar-object and making it the contents of a new solar-object.
; (make-new-object distance
;  (make-planet planet-distance inner-planet) ...)

(define (make-new-object distance an-object)
  (make-planet distance an-object))

(check-expect
 (make-new-object 30
                  (make-planet 10
                               (make-planet 5
                                            (make-sun empty))))
 (make-planet 30
              (make-planet 10
                           (make-planet 5
                                        (make-sun empty)))))

;;; Exercise 8 (The assignment had a typo, so there are two number 7's,
;;; this being the second 7.)

; draw-sun: sun -> Image
; Purpose: Make a function that draws a sun
; (draw-sun sun) ...

(define (draw-sun sun)
  (circle 20 "solid" "orange"))

(draw-sun (make-sun empty))

;;; Exercise 9 (8 on the assignment page)
;
; draw-solar-object: Solar-Object -> Image
; Purpose : Create a function that draws a solar-object
; Template:
; (define (draw-solar-object an-object)
;  (cond
;   [(sun? an-object) ...]
;   [(planet? an-object) ...
;     (draw-solar-object (planet-inner-planet an-object))]
;   )
;  )

(define (draw-solar-object an-object)
  (cond
    [(sun? an-object) (draw-sun an-object)]
    [(planet? an-object)
     (overlay (circle
               (find-farthest-distance an-object) "outline" "purple")
              (draw-solar-object (planet-inner-planet an-object)))]
    )
  )

(draw-solar-object test-system)
