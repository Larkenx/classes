;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lab11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; We want to begin by drawing some circles and before we start, here is a bit of setup code:

(require 2htdp/image)
(require 2htdp/universe)

; Constants
(define WIDTH 700)
(define HEIGHT 400)
(define MT (rectangle WIDTH HEIGHT "solid" "white"))

; next-size : Number -> Number
(define (next-size s)
  (/ s 2))

(define (modified-next-size s)
  (/ s 1.5))

(define (circles x size scn)
  (cond
    [(<= size 2) scn]
    [else (place-image (circle size "outline" "blue") x (/ HEIGHT 2)
                       (circles (+ x size (modified-next-size size)) (modified-next-size size) scn))]))

(define (spirals x y ang size scn)
  (cond
    [(<= size 2) scn]
    [else (place-image (circle size "outline" "blue") x y
                       (spirals (+ x (*
                                      (+ size
                                         (modified-next-size size))
                                      (cos ang)))
                                (+ y (*
                                      (+ size
                                         (modified-next-size size))
                                      (sin ang)))
                                (- ang (/ pi 6)) 
                                (modified-next-size size) scn))]))

(define (modify-spirals x y ang size scn)
  (cond
    [(>= 0 ang) scn]
    [else (place-image (circle size "outline" "blue") x y
                       (modify-spirals (+ x (/ (* size (cos ang)) 20)) (+ y (/ (* size (sin ang)) 100)) (- ang (/ pi 6)) size scn))]))

;(spirals 50 50 0 50 MT)
;(modify-spirals 100 150 (* 2 pi) 50 MT)

; put-line : Number Number Number Number String Scene -> Scene
; Put a line in the scene starting at (x,y) len distance
;   in the given direction with the given color
(define (put-line x y ang len color scn)
  (place-image (line (* (cos ang) len)
                     (* (sin ang) len) color)
               (+ x (* (cos ang) (/ len 2)))
               (+ y (* (sin ang) (/ len 2))) scn)) 

(define (tree x y ang len)
  (cond
    [(< len 5) (put-line x y ang len "green" MT)]
    [else (put-line x y ang len "brown"
                    (overlay
                     (tree (+ x (* (/ len 3) (cos ang)))
                           (+ y (* (/ len 3) (sin ang)))
                           (+ ang (/ pi 6))
                           (/ len 1.8))
                     (tree (+ x (* (* 2 (/ len 3)) (cos ang)))
                           (+ y (* (* 2 (/ len 3)) (sin ang)))
                           (- ang (/ pi 6))
                           (/ len 1.8))))]))   


(define (koch-curve n)
    (cond
      [(zero? n) (square 1 "solid" "black")]
      [else
       (local [(define smaller (koch-curve (- n 1)))]
         (beside/align "bottom"
                       smaller
                       (rotate 89 smaller)
                       (rotate -50 smaller)
                       smaller))]))
(above
   (beside
    (rotate 30 (koch-curve 5))
    (rotate -30 (koch-curve 5)))
   (flip-vertical (koch-curve 5)))

