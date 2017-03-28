;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a10Key) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)


; A PrefixTree (PT) is a
; | (make-end)
; | (make-node char:Character nodes:ListOfPT)

; A ListOfPt is one of
; | empty
; | (Cons PT ListOfPT)

(define-struct end ())
(define-struct node (char lopt))



(define pt1
  (make-node "!" (list
                  (make-node "o"
                             (list (make-node "n" (list
                                                   (make-end)
                                                   (make-node "e" (list (make-end)))))
                                   (make-node "f" (list
                                                   (make-end)
                                                   (make-node "f" (list (make-end)))
                                                   (make-node "t" (list (make-end)))))
                                   (make-node "r" (list (make-end)))))
                  (make-end))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exercise 1;;;;;;;;;;;;;;;;;;

;;match?
;;PT String -> Boolean
;:Determines if a given word is in a prefix tree
(define (match? pt w)
  (cond
    ((and (string=? w "") (end? pt)) #t)
    ((string=? w "") #t)
    ((string=? (substring w 0 1) (node-char pt))
     (match? (find-node (node-lopt pt) (substring w 1)) (substring w 1)))
    (else #f)))


;(check-expect (match? pt1 "one") #t)
;(check-expect (match? pt1 "two") #f)


;;find-node
;;LOPT String -> [Maybe PT]
;;Searches through a list of pt to
;;find a matching node.
;;Returns false if none exist
(define (find-node lopt w)
  (cond
    ((empty? lopt) #f)
    ((end? (first lopt)) (find-node (rest lopt) w))
    (else (if (string=? (node-char (first lopt)) (substring w 0 1))
              (first lopt)
              (find-node (rest lopt) w)))))



(check-expect (find-node (list
                          (make-end)
                          (make-node "f" (list (make-end)))
                          (make-node "t" (list (make-end))))
                         "cf") #f)

(check-expect (find-node (list
                          (make-end)
                          (make-node "f" (list (make-end)))
                          (make-node "t" (list (make-end))))
                         "ff")
              (make-node "f" (list (make-end))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exercise 2;;;;;;;;;;;;;;;;;;

;char->image
;String -> Image
;Takes a length one string an draws it
(define (char->image c)
  (overlay (text c 16 "black")
           (circle 18 "solid" "white")
           (circle 20 "solid" "red")
           (circle 25 "solid" "transparent")))

(check-satisfied (char->image "s") image?)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exercise 3;;;;;;;;;;;;;;;;;;

;;A picture of an empty character to use on the
;;prefix tree
(define end-image (char->image "Ø"))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exercise 4;;;;;;;;;;;;;;;;;;


;;pt->image
;;PT -> Image
;;Takes a prefix tree and draws it
;;(define (pt->image pt)
;;  (cond
;;    ((end? pt) ...)
;;    (else (... (node-char pt)
;;               (lopt->image(node-lopt pt))))))
;;
;;
;;
;;lopt->image
;;List-of-PT -> List-of-image
;;Takes a list-of-PT and returns a list
;;of images for each PT
;;(define (lopt->image lopt)
;;  (cond
;;    ((empty? lopt) ...)
;;    ((cons? lopt) (cons (pt->image(first lopt))
;;                        (lopt->image(rest lopt))))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exercise 5;;;;;;;;;;;;;;;;;;


;;loim-width
;;List-of-Image -> Number
;;Sums up the total width of a list of images
(define (loim-width l)
  (cond
    ((empty? l) 0)
    ((cons? l) (+ (image-width (first l))
                  (loim-width (rest l))))))

(check-expect (loim-width (list (circle 25 "solid" "red")))
              50)
(check-expect (loim-width (list)) 0)



;;loim-height
;;List-of-Image -> Number
;;Sums up the total height of a list of images
(define (loim-height l)
  (cond
    ((empty? l) 0)
    ((cons? l) (+ (image-height (first l))
                  (loim-height (rest l))))))

(check-expect (loim-height (list (circle 25 "solid" "red")))
              50)
(check-expect (loim-height (list)) 0)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exercise 6;;;;;;;;;;;;;;;;;;



;;loim-centers
;;Number List-of-Image -> List-of-Numbers
;;Takes a list of images and an offset, and then
;;returns the center point of each image, offset by
;;the given amount

;;First call should supply zero



(define (loim-centers l)
  (local ((define (loim-centers-helper n l)
            (cond
              ((empty? l) empty)
              ((cons? l) (cons
                          (+ n (/(image-width(first l))2))
                          (loim-centers-helper (+ (image-width (first l)) n)
                                               (rest l)))))))
    (loim-centers-helper 0 l)))


(check-expect (loim-centers (list (circle 10 "solid" "red")
                                  (circle 30 "solid" "red")
                                  (circle 5 "solid" "red")
                                  (circle 10 "solid" "red")
                                  (circle 50 "solid" "red")))
              (list 10 50 85 100 160))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exercise 7;;;;;;;;;;;;;;;;;;

;;background-loim
;;List-of-Images -> Image
;;Takes a list of images and generates a
;;background for them

(define (background-loim l)
  (cond
    ((empty? l) (rectangle 50 50 "solid" "transparent"))
    (else (rectangle (loim-width l) (+ 100 (loim-height l))
                     "solid" "transparent"))))

(check-satisfied (background-loim empty) image?)
(check-satisfied (background-loim (list (circle 10 "solid" "red")
                                        (circle 30 "solid" "red")
                                        (circle 5 "solid" "red")
                                        (circle 10 "solid" "red")
                                        (circle 50 "solid" "red"))) image?)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exercise 8;;;;;;;;;;;;;;;;;;

;;draw-lines
;;Image List-of-Numbers -> Image
;;Draws lines for a prefix tree onto a background
(define (draw-lines i l)
  (cond
    ((empty? l) i)
    (else (add-line (draw-lines i (rest l))
                    (/ (image-width i) 2)
                    25
                    (first l)
                    125
                    "black"))))



(define l (list (circle 20 "solid" "red")
                (circle 20 "solid" "blue")
                (circle 20 "solid" "green")))

;(draw-lines (background-loim l) (loim-centers l))


                                   



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exercise 9;;;;;;;;;;;;;;;;;;



;;draw-loim
;;image List-of-Image -> Image
;;aligns a list of image and places them centered onto a background.
;;The aligned images are placed 100px down from the top of the background
;;image
(define (draw-loim i l)
  (local ((define (draw-loim-helper l)
            (cond
              ((empty? l) (empty-scene 0 0))
              ((empty? (rest l)) (first l))
              (else (beside/align "top" (first l)
                                  (draw-loim-helper (rest l)))))))
    (place-image/align (draw-loim-helper l)
                       0
                       100
                       "left"
                       "top"
                       i)))


;(draw-loim (background-loim l) l)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exercise 10;;;;;;;;;;;;;;;;;;


;;draw-node
;;image PT -> image
;;Draws a prefix tree node onto an image which already has
;;node edges drawn onto it.
(define (draw-node i p)
  (place-image (char->image (node-char p))
               (/(image-width i)2)    
               25
               i))

(check-satisfied (draw-node (empty-scene 50 50) (make-node "C" (make-end)))
                 image?)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exercise 11;;;;;;;;;;;;;;;;;;


;;pt->image
;;PT -> Image
;;Takes a prefix tree and draws it
(define (pt->image pt)
  (cond
    ((end? pt) end-image)
    (else (draw-node (draw-loim 
                      (draw-lines (background-loim (lopt->image(node-lopt pt)))
                                  (loim-centers (lopt->image (node-lopt pt))))
                      (map pt->image (node-lopt pt)))
                     pt))))
                           


(check-satisfied (pt->image pt1) image?)

;;lopt->image
;;List-of-PT -> List-of-image
;;Takes a list-of-PT and returns a list
;;of images for each PT
(define (lopt->image lopt)
  (cond
    ((empty? lopt) empty)
    ((cons? lopt) (cons (pt->image(first lopt))
                        (lopt->image(rest lopt))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exercise 12;;;;;;;;;;;;;;;;;;

;;pt-add
;;PT String -> PT
;;Addes a given word into a prefix tree. Assumes the word starts with
;;the same character as the root of the PT

(define (lopt-add word lopt)
  (cond
    [(empty? lopt)
     (if (empty? word)
         (list (make-end))
         (list (make-node (first word) (lopt-add (rest word) empty))))]
    [(empty? word)
     (if (end? (first lopt))
         lopt
         (cons (first lopt) (lopt-add word (rest lopt))))]
    [(and (node? (first lopt));;error
          (string=? (first word) (node-char (first lopt))))
     (cons
      (make-node (first word)
                 (lopt-add (rest word) (node-lopt (first lopt))))
      (rest lopt))]
    [else (cons (first lopt) (lopt-add word (rest lopt)))]))


(define pt2
  (make-node "o"
             (lopt-add '("n")
                       (lopt-add '("n" "e")
                                 (lopt-add '("f" "f")
                                           (lopt-add '("f" "t") empty))))))

(define (node-add word n)
  (make-node (node-char n)
           (lopt-add (explode word) (node-lopt n))))

(define pt3 (node-add "soften" pt1))
(pt->image pt3)
