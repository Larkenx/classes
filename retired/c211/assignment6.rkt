;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname assignment6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define background
  (empty-scene 400 400))

;;; Exercise 1
; A worldstate is a:
; (make-worldstate player mouse zombie)
; where a player, mouse, and zombie are as follows:

; A player is a:
; (make-player x y)

; A mouse is a:
; (make-mouse x y)

; A zombie is a:
; (make-zombie x y inner-z)
; where inner-z is either null or a zombie.

;;; Exercise 5
; Note: A hoard of Zombies 
; A Hoard-of-Zombies (HoZ) is one of:
; - null
; - (make-zombie x y HoZ)

;         Template:
; (define (processes-HoZ some-zombies)
; (cond
;   [(null? some-zombies) ...]
;   [(zombie? some-zombies)
;     ... (processes-HoZ (zombie-inner-z some-zombies) ...]
; ))

(define-struct worldstate (player mouse zombie))
(define-struct player (x y))
(define-struct mouse (x y))
(define-struct zombie (x y inner-z))

;;; Exercise 2

; A player image that is a circle
(define player-image
  (circle 10 "solid" "green"))

; draw-player-image: Worldstate Image -> Image
; (draw-player-image some-wstate image) ..

(define (place-player-image worldstate i)
  (place-image
   player-image                                                                 
   (player-x (worldstate-player worldstate))
   (player-y (worldstate-player worldstate))
   i))

(check-satisfied (place-player-image initial-state background) image?)

; Exercise 4
;;; move-player: Worldstate -> Player
; The move-player functions takes the current player location and the
; current mouse location, then adds 1 to the x&y co-ordinates of the
; player position until it equals the mouse position. If the x-pos of
; the mouse is lower than the x-pos of the player, then it subtracts
; from the player position. The same is done for the y-pos.
(define (move-player worldstate)  
  (make-player 
   (cond
     [(>
       (player-x (worldstate-player worldstate))
       (mouse-x (worldstate-mouse worldstate)))
      (-
       (player-x (worldstate-player worldstate))
       (* (/ 1 (mouse-x (worldstate-mouse worldstate)))
          (* 2 (mouse-x (worldstate-mouse worldstate)))))]
     [(<
       (player-x (worldstate-player worldstate))
       (mouse-x (worldstate-mouse worldstate)))
      (+
       (player-x (worldstate-player worldstate))
       (* (/ 1 (mouse-x (worldstate-mouse worldstate)))
          (* 2 (mouse-x (worldstate-mouse worldstate)))))]
     [(= (round (player-x (worldstate-player worldstate)))
         (round (mouse-x (worldstate-mouse worldstate))))
      (player-x (worldstate-player worldstate))]
     )
   (cond
     [(> (player-y (worldstate-player worldstate))
         (mouse-y (worldstate-mouse worldstate)))
      (-
       (player-y (worldstate-player worldstate))
       (* (/ 1 (mouse-y (worldstate-mouse worldstate)))
          (* 2 (mouse-y (worldstate-mouse worldstate)))))]
     [(< (player-y (worldstate-player worldstate))
         (mouse-y (worldstate-mouse worldstate)))
      (+ (player-y (worldstate-player worldstate))
         (* (/ 1 (mouse-y (worldstate-mouse worldstate)))
            (* 2(mouse-y (worldstate-mouse worldstate)))))]
     [(= (round (player-y (worldstate-player worldstate)))
         (round (mouse-y (worldstate-mouse worldstate))))
      (player-y (worldstate-player worldstate))]
     )
   )
  )

; Exercise 6
; From here on out, a set of zombies will be called a HoZ
; (Hoard of Zombies).

; create-HoZ: Number -> Hoard-of-Zombies
; given a number, produces a number of nested zombies
(define (create-HoZ number-of-zombies)
  (cond
    [(= number-of-zombies 0) null]
    [(> number-of-zombies 0)
     (make-zombie (random 401) (random 401)
                  (create-HoZ (- number-of-zombies 1)))]
    )
  )

; This check expect does not work because it cannot recreate the same random #
; (check-expect (create-HoZ 2)
;             (make-zombie (random 401) (random 401)
;                           (make-zombie (random 401) (random 401) null)))

; Exercise 8
; Zombies will be drawn as red circles half the size of the player
(define zombie-image (circle 5 "solid" "red"))

; draw-HoZ: HoZ Image -> Image
; Given a hoard of zombies and a scene, place a zombie-image for every
; zombie co-ordinate. If given an empty inner-zombie, return the given image
; Template:
; --------
;(define (draw-HoZ HoZ i)
;  (place-image
;   zombie-image
;   (zombie-x HoZ)
;   (zombie-y HoZ)
;   (cond
;     [(null? (zombie-inner-z HoZ)) ...]
;     [else ...]
;     )
;   )
;  )

(define (draw-HoZ HoZ i)
  (place-image
   zombie-image
   (zombie-x HoZ)
   (zombie-y HoZ)
   (cond
     [(null? (zombie-inner-z HoZ)) i]
     [else (draw-HoZ (zombie-inner-z HoZ) i)]
     )
   )
  )

(check-satisfied (draw-HoZ (make-zombie 10 10 null) background) image?)

; Exercise 10
; move-zombies: HoZ Posn -> HoZ
; Given a hoard of zombies and a position, update each individual zombie's
; position to move towards a target position. Most of this code can be
; recylced from earlier when I created the move-player function.

(define (move-zombies HoZ player)
  (make-zombie
   (cond ; This evaluates the x-position of the zombie versus the x-position
     [(> ; of the player. 
       (zombie-x HoZ)
       (player-x player))
      (-
       (zombie-x HoZ)
       (* (/ 1 (player-x player)) ; Here, we make it such that the player x
          (* (+ 1 (random 1)) (player-x player))))] ; is multipled by
     [(< ; one divided by player x, so that it always returns 1 pixel for
       (zombie-x HoZ) ; a consistent movement of 1 pixel. The same is done
       (player-x player)) ; for the y position.
      (+
       (zombie-x HoZ)
       (* (/ 1 (player-x player))
          (* (+ 1 (random 1)) (player-x player))))] ; A random function is 
     [(= (round (zombie-x HoZ)) ; placed here so that the speed of the zombies
         (round (player-x player))) ; is randomized at some value between 0-1.
      (zombie-x HoZ)]
     )
   (cond ; This evaluates the y-position of the zombie versus the y-position
     [(> ; of the player.
       (zombie-y HoZ)
       (player-y player))
      (-
       (zombie-y HoZ)
       (* (/ 1 (player-y player))
          (* (+ 1 (random 1)) (player-y player))))]
     [(<
       (zombie-y HoZ)
       (player-y player))
      (+
       (zombie-y HoZ)
       (* (/ 1 (player-y player))
          (* (+ 1 (random 1)) (player-y player))))]
     [(= (round (zombie-y HoZ))
         (round (player-y player)))
      (zombie-y HoZ)]
     )
   (cond ; This tests whether or not the HoZ is null - if so, it stops the
     [(null? (zombie-inner-z HoZ)) null] ; recursive call on the inner-z
     [else (move-zombies (zombie-inner-z HoZ) player)] ; and returns a 'null.'
     )))

(check-expect (move-zombies (make-zombie 10 10 null) (make-player 10 10)) (make-zombie 10 10 empty))
(check-expect (move-zombies
               (make-zombie
                10
                10
                (make-zombie
                 11
                 9
                (make-zombie 9 11 null)))
               (make-player 10 10))
              (make-zombie 10 10 (make-zombie 10 10 (make-zombie 10 10 null)))) 

; The initial worldstate
(define initial-state
  (make-worldstate
   (make-player 10 10)
   (make-mouse 10 10)
   (create-HoZ 2)))

; draw-world: Worldstate -> Image
; The draw-world function to be passed to big bang
(define (draw-world worldstate)
  (draw-HoZ (worldstate-zombie worldstate)
            (place-player-image worldstate background)))

(check-satisfied (draw-world initial-state) image?)

; on-tick-handler: worldstate -> worldstate 
; An on-tick handler to update movement of the player
(define (on-tick-handler current-state)
  (make-worldstate
   (move-player current-state)
   (worldstate-mouse current-state)
   (move-zombies
    (worldstate-zombie current-state)
    (worldstate-player current-state))))

;;; Exercise 3
; mouse-controls: Worldstate Mouse-X Mouse-Y Mouse-event -> Worldstate
; These are the mouse controls
(define (mouse-controls current-state x y mouse-event)
  (cond
    [(or (= x 0) (= y 0)) ; If the mouse has left the screen, it will
     (make-worldstate     ; update to the last stored mouse positions
      (make-player (player-x (worldstate-player current-state))
                   (player-y (worldstate-player current-state)))
      (make-mouse (mouse-x (worldstate-mouse current-state))
                  (mouse-y (worldstate-mouse current-state)))
      (make-zombie (zombie-x (worldstate-zombie current-state))
                   (zombie-y (worldstate-zombie current-state))
                   (zombie-inner-z (worldstate-zombie current-state))))]
    [(mouse=? mouse-event "move") ; Updates mouse co-ordinates to 
     (make-worldstate ; wherever the mouse cursor is placed within the window            
      (make-player (player-x (worldstate-player current-state))
                   (player-y (worldstate-player current-state)))
      (make-mouse x y)
      (make-zombie (zombie-x (worldstate-zombie current-state))
                   (zombie-y (worldstate-zombie current-state))
                   (zombie-inner-z (worldstate-zombie current-state))))]
    [else (make-worldstate ; Makes sure other mouse-events don't disrupt game
           (make-player (player-x (worldstate-player current-state))
                        (player-y (worldstate-player current-state)))
           (make-mouse (mouse-x (worldstate-mouse current-state))
                       (mouse-y (worldstate-mouse current-state)))
           (make-zombie (zombie-x (worldstate-zombie current-state))
                        (zombie-y (worldstate-zombie current-state))
                        (zombie-inner-z (worldstate-zombie current-state))))]
    ))

(check-expect (mouse-controls initial-state 0 0 "leave")
              (make-worldstate     ; update to the last stored mouse positions
      (make-player (player-x (worldstate-player initial-state))
                   (player-y (worldstate-player initial-state)))
      (make-mouse (mouse-x (worldstate-mouse initial-state))
                  (mouse-y (worldstate-mouse initial-state)))
      (make-zombie (zombie-x (worldstate-zombie initial-state))
                   (zombie-y (worldstate-zombie initial-state))
                   (zombie-inner-z (worldstate-zombie initial-state)))))

(check-expect (mouse-controls initial-state 10 10 "move") initial-state)
(check-expect (mouse-controls initial-state 10 10 "leave") initial-state)

; Exercise 12
; within-player?: HoZ Player -> Boolean
; Finds the cartesian distance between every zombie instance and returns it
; to a comparison between the player-pos and zombie-pos. If a zombie is too close,
; the function returns a #true and the game ends
(define (within-player? HoZ player) 
  (cond
    [(null? HoZ) #false] ; if the HoZ is empty, return false
    [(<
      (sqrt ; The cartesian distance between the zombie and player
       (+
        (expt (abs (- (player-x player)
                      (zombie-x HoZ))) 2)
        (expt (abs (- (player-y player)
                      (zombie-y HoZ))) 2)))
      9) #true] ; if the distance is less than 9, return true 
    [else
     (within-player? (zombie-inner-z HoZ) player)] ; iterate through the other zombies
    )
  )

; end-game: worldstate -> boolean
; Determines whether or not a zombie has entered the player's hitcircle.
(define (end-game current-state)
  (within-player? (worldstate-zombie current-state) (worldstate-player current-state)))

(big-bang
 initial-state
 (to-draw draw-world)
 (on-mouse mouse-controls)
 (on-tick on-tick-handler .005)
 (stop-when end-game)
 )