;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname snake) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A World is:
; -- (make-world Snake Food)
(define-struct world (snake food))
 
; A Snake is:
; -- (make-snake Direction Head Body)
(define-struct snake (direction head body))
 
; A Direction is one of:
; -- "north"
; -- "east"
; -- "south"
; -- "west"
 
; A Food is [Listof Posn]
 
; A Head is a Posn
 
; A Body is [Listof Posn]

(define s1 (make-snake "n" (make-posn 200 200) empty))

(define f1 (list (make-posn 300 300) (make-posn 151 327)))

(define w1 (make-world s1 f1))

(define s2 (make-snake "n"
                       (make-posn 200 200)
                       (list
                        (make-posn 200 220)
                        (make-posn 200 240)
                        (make-posn 200 260)
                        (make-posn 200 280))))

(define f2 (list (make-posn 123 21) (make-posn 178 239)
                 (make-posn 98 51) (make-posn 259 371)
                 (make-posn 309 108)))

(define w2 (make-world s2 f2))
                                                

(define (draw-world ws)
  (draw-snake ws
              (draw-food ws (empty-scene 400 400))))

(define (draw-snake ws img)
  (let [(s (world-snake ws))]
    (place-image
     (circle 10 "solid" "blue")
     (posn-x (snake-head s)) (posn-y (snake-head s))
     (foldr (lambda (x y)
              (place-image
               (circle 10 "solid" "red")
               (posn-x x) (posn-y x)
               y))
            img (snake-body s)))))

(define (draw-food ws img)
  (foldr (lambda (cur prev)
           (place-image
               (circle 10 "solid" "orange")
               (posn-x cur) (posn-y cur)
               prev)) img (world-food ws)))

(define (get-vector dir)
  (cond
    [(string=? "n" dir) (make-posn 0 -20)]
    [(string=? "s" dir) (make-posn 0 20)]
    [(string=? "e" dir) (make-posn 20 0)]
    [(string=? "w" dir) (make-posn -20 0)]))

(define (pop ls)
  (cond
    [(empty? ls) empty]
    [(empty? (rest ls)) empty]
    [else (cons (first ls) (pop (rest ls)))]))

(define (touch-food f h)
  (cond
    [(empty? f) empty]
    [else
     (let*
         [(x1 (posn-x h))
          (y1 (posn-y h))
          (x2 (posn-x (first f)))
          (y2 (posn-y (first f)))
          (touching? (> 19 (sqrt (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2)))))]
       (if touching?
           (rest f)
           (cons (first f) (touch-food (rest f) h))))]))

(define (move-snake ws)
  (let* [(s (world-snake ws))
         (f (world-food ws))
         (v (get-vector (snake-direction s)))
         (dx (posn-x v))
         (dy (posn-y v))
         (new-head (make-posn (+ (posn-x (snake-head s)) dx) ; snake head
                            (+ (posn-y (snake-head s)) dy)))
         (food-l (length f))
         (new-food (touch-food f new-head))]
    (make-world
     (make-snake (snake-direction s) ; snake dir
                 new-head
                 (cons (snake-head s)
                       (if
                        (not (equal? food-l (length new-food)))
                        (snake-body s)
                        (pop (snake-body s))))) ; snake body
     new-food))) ; generate random new food if ...

(define (key-handler ws k)
  (let* [(f (world-food ws))
         (s (world-snake ws))
         (head (snake-head s))
         (body (snake-body s))] 
  (cond
    [(equal? "left" k) (make-world (make-snake "w" head body) f)]
    [(equal? "right" k) (make-world (make-snake "e" head body) f)]
    [(equal? "up" k) (make-world (make-snake "n" head body) f)]
    [(equal? "down" k) (make-world (make-snake "s" head body) f)]
    [else ws])))

(big-bang w2
 [to-draw draw-world]
 [on-tick move-snake .4]
 [on-key key-handler])

