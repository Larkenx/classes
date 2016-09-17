;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lab8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A World is:
; -- (make-world Snake Food)
(define-struct world (snake food))

; a Snake is:
; -- (make-snake Direction Head Body)
(define-struct snake (direction head body))

; A Direction is one of:
; - "north"
; - "east"
; - "south"
; - "west"

; A Food is [Listof Posn]

; A Head is a Posn

; A Body is [Listof Posn]

; background image
(define SCENE-WIDTH 400)
(define SCENE-HEIGHT 400)
(define background (empty-scene SCENE-WIDTH SCENE-HEIGHT))

; Exercise 1
(define s1 (make-snake "north" (make-posn 200 200) empty))

; snake image
(define head-image (circle 5 "solid" "blue"))

; draw-snakehead: Snake I -> Image
(define (draw-snakehead s i)
  (place-image
   head-image
   (posn-x (snake-head s))
   (posn-y (snake-head s))
   i)
  )

; Exercise 2
(define f1 (list (make-posn 300 300) (make-posn 151 327)))

; food image
(define food-image (circle 5 "solid" "yellow"))

; draw-foods: Food I -> Image
(define (draw-foods f i)
  (place-image
   food-image
   (posn-x (first f))
   (posn-y (first f))
   (if (empty? (rest f)) i (draw-foods (rest f) i))))

; Exercise 3
(define w1 (make-world s1 f1))

; draw-world: World -> Image
;(define (draw-world w)
;  (draw-snakehead
;   (world-snake w)
;   (draw-foods
;    (world-food w)
;    background)))

; (big-bang w1 (to-draw draw-world))

; Exercise 4

(define s2 (make-snake
            "north"
            (make-posn 200 200)
            (list (make-posn 200 210)
                  (make-posn 200 220)
                  (make-posn 200 230)
                  (make-posn 200 240)
                  (make-posn 200 250)
                  (make-posn 200 260)
                  )))

; Exercise 5
(define f2 (list (make-posn 123 21)
                 (make-posn 178 239)
                 (make-posn 98 51)
                 (make-posn 259 371)
                 (make-posn 309 108)))

; Exericse 6
(define w2 (make-world s2 f2))

; body-image
(define body-image (circle 5 "solid" "red"))

; draw-body: Body I -> Image
(define (draw-body body i)
  (place-image
   body-image
   (posn-x (first body))
   (posn-y (first body))
   (if (empty? (rest body))
               i
               (draw-body (rest body) i))))

; updated draw-world
(define (draw-world w)
  (draw-snakehead
   (world-snake w)
   (draw-body (snake-body (world-snake w))
   (draw-foods
    (world-food w)
    background))))

; (big-bang w2 (to-draw draw-world))

; pop-off: List -> List
; returns the same list with the last element removed
(define (pop-off l)
  (cond
    [(empty? l) empty]
    [(empty? (rest l)) empty] 
    [else (cons (first l) (pop-off (rest l)))]
    )
  )

; move-body: Snake -> Body
; takes the snake and removes the last posn of the body list, and makes a new
; posn at the location of the current head. make a cond branch to check if
; the rest is empty
(define (move-body snake)
  (append (list (snake-head snake))
          (pop-off (snake-body snake))))
        
    


; move-snake: Snake -> Snake
; make a function that given a snake, produces
; a snake with its body coordinates precisely 10 pixels away
; from the center of the head, in the opposite direction given by the snake.
(define (move-snake-head s)
  (make-snake
   (snake-direction s)
   (make-posn
    (cond  ; x pos of the head
      [(equal? "west" (snake-direction s))
       (- (posn-x (snake-head s)) 10)]
      [(equal? "east" (snake-direction s))
       (+ 10 (posn-x (snake-head s)))]
      [else (posn-x (snake-head s))])
    (cond ; y pos of the head
      [(equal? "north" (snake-direction s))
       (- (posn-y (snake-head s)) 10)]
      [(equal? "south" (snake-direction s))
       (+ 10 (posn-y (snake-head s)))]
      [else (posn-y (snake-head s))]))
   (move-body s)))

; update snake-direction function
(define (change-direction snake direction)
  (make-snake direction (snake-head snake) (snake-body snake)))

; on tick handler
(define (tick-handler w)
  (make-world (move-snake-head (world-snake w)) (world-food w)))
; key handler
(define (key-handler w a-key)
  (cond
    [(key=? a-key "left") (make-world (change-direction (world-snake w) "west") (world-food w))]
    [(key=? a-key "right") (make-world (change-direction (world-snake w) "east") (world-food w))]
    [(key=? a-key "up") (make-world (change-direction (world-snake w) "north") (world-food w))]
    [(key=? a-key "down") (make-world (change-direction (world-snake w) "south") (world-food w))]
    )
  )

(big-bang w2 (to-draw draw-world) (on-tick tick-handler .5) (on-key key-handler))
