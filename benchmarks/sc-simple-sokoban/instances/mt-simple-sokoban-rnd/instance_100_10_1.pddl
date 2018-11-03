(define (problem instance_100_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 100)
	(= (min_x) 1)
	(= (max_y) 100)
	(= (min_y) 1)
	(= (x player1) 38)
	(= (y player1) 23)
	(= (x stone1) 38)
	(= (y stone1) 17)
	(= (x stone2) 71)
	(= (y stone2) 75)
	(= (x stone3) 83)
	(= (y stone3) 99)
	(= (x stone4) 38)
	(= (y stone4) 26)
	(= (x stone5) 58)
	(= (y stone5) 53)
	(= (x stone6) 18)
	(= (y stone6) 37)
	(= (x stone7) 87)
	(= (y stone7) 91)
	(= (x stone8) 45)
	(= (y stone8) 23)
	(= (x stone9) 34)
	(= (y stone9) 34)
	(= (x stone10) 79)
	(= (y stone10) 55)
  )

  (:goal (and 
    (or (and (= (x stone1) 70) (= (y stone1) 10)) (and (= (x stone1) 15) (= (y stone1) 87)) (and (= (x stone1) 90) (= (y stone1) 39)) (and (= (x stone1) 88) (= (y stone1) 74)) (and (= (x stone1) 5) (= (y stone1) 3)) (and (= (x stone1) 97) (= (y stone1) 93)) (and (= (x stone1) 28) (= (y stone1) 60)) (and (= (x stone1) 89) (= (y stone1) 16)) (and (= (x stone1) 54) (= (y stone1) 65)) (and (= (x stone1) 24) (= (y stone1) 28)))
	(or (and (= (x stone2) 70) (= (y stone2) 10)) (and (= (x stone2) 15) (= (y stone2) 87)) (and (= (x stone2) 90) (= (y stone2) 39)) (and (= (x stone2) 88) (= (y stone2) 74)) (and (= (x stone2) 5) (= (y stone2) 3)) (and (= (x stone2) 97) (= (y stone2) 93)) (and (= (x stone2) 28) (= (y stone2) 60)) (and (= (x stone2) 89) (= (y stone2) 16)) (and (= (x stone2) 54) (= (y stone2) 65)) (and (= (x stone2) 24) (= (y stone2) 28)))
	(or (and (= (x stone3) 70) (= (y stone3) 10)) (and (= (x stone3) 15) (= (y stone3) 87)) (and (= (x stone3) 90) (= (y stone3) 39)) (and (= (x stone3) 88) (= (y stone3) 74)) (and (= (x stone3) 5) (= (y stone3) 3)) (and (= (x stone3) 97) (= (y stone3) 93)) (and (= (x stone3) 28) (= (y stone3) 60)) (and (= (x stone3) 89) (= (y stone3) 16)) (and (= (x stone3) 54) (= (y stone3) 65)) (and (= (x stone3) 24) (= (y stone3) 28)))
	(or (and (= (x stone4) 70) (= (y stone4) 10)) (and (= (x stone4) 15) (= (y stone4) 87)) (and (= (x stone4) 90) (= (y stone4) 39)) (and (= (x stone4) 88) (= (y stone4) 74)) (and (= (x stone4) 5) (= (y stone4) 3)) (and (= (x stone4) 97) (= (y stone4) 93)) (and (= (x stone4) 28) (= (y stone4) 60)) (and (= (x stone4) 89) (= (y stone4) 16)) (and (= (x stone4) 54) (= (y stone4) 65)) (and (= (x stone4) 24) (= (y stone4) 28)))
	(or (and (= (x stone5) 70) (= (y stone5) 10)) (and (= (x stone5) 15) (= (y stone5) 87)) (and (= (x stone5) 90) (= (y stone5) 39)) (and (= (x stone5) 88) (= (y stone5) 74)) (and (= (x stone5) 5) (= (y stone5) 3)) (and (= (x stone5) 97) (= (y stone5) 93)) (and (= (x stone5) 28) (= (y stone5) 60)) (and (= (x stone5) 89) (= (y stone5) 16)) (and (= (x stone5) 54) (= (y stone5) 65)) (and (= (x stone5) 24) (= (y stone5) 28)))
	(or (and (= (x stone6) 70) (= (y stone6) 10)) (and (= (x stone6) 15) (= (y stone6) 87)) (and (= (x stone6) 90) (= (y stone6) 39)) (and (= (x stone6) 88) (= (y stone6) 74)) (and (= (x stone6) 5) (= (y stone6) 3)) (and (= (x stone6) 97) (= (y stone6) 93)) (and (= (x stone6) 28) (= (y stone6) 60)) (and (= (x stone6) 89) (= (y stone6) 16)) (and (= (x stone6) 54) (= (y stone6) 65)) (and (= (x stone6) 24) (= (y stone6) 28)))
	(or (and (= (x stone7) 70) (= (y stone7) 10)) (and (= (x stone7) 15) (= (y stone7) 87)) (and (= (x stone7) 90) (= (y stone7) 39)) (and (= (x stone7) 88) (= (y stone7) 74)) (and (= (x stone7) 5) (= (y stone7) 3)) (and (= (x stone7) 97) (= (y stone7) 93)) (and (= (x stone7) 28) (= (y stone7) 60)) (and (= (x stone7) 89) (= (y stone7) 16)) (and (= (x stone7) 54) (= (y stone7) 65)) (and (= (x stone7) 24) (= (y stone7) 28)))
	(or (and (= (x stone8) 70) (= (y stone8) 10)) (and (= (x stone8) 15) (= (y stone8) 87)) (and (= (x stone8) 90) (= (y stone8) 39)) (and (= (x stone8) 88) (= (y stone8) 74)) (and (= (x stone8) 5) (= (y stone8) 3)) (and (= (x stone8) 97) (= (y stone8) 93)) (and (= (x stone8) 28) (= (y stone8) 60)) (and (= (x stone8) 89) (= (y stone8) 16)) (and (= (x stone8) 54) (= (y stone8) 65)) (and (= (x stone8) 24) (= (y stone8) 28)))
	(or (and (= (x stone9) 70) (= (y stone9) 10)) (and (= (x stone9) 15) (= (y stone9) 87)) (and (= (x stone9) 90) (= (y stone9) 39)) (and (= (x stone9) 88) (= (y stone9) 74)) (and (= (x stone9) 5) (= (y stone9) 3)) (and (= (x stone9) 97) (= (y stone9) 93)) (and (= (x stone9) 28) (= (y stone9) 60)) (and (= (x stone9) 89) (= (y stone9) 16)) (and (= (x stone9) 54) (= (y stone9) 65)) (and (= (x stone9) 24) (= (y stone9) 28)))
	(or (and (= (x stone10) 70) (= (y stone10) 10)) (and (= (x stone10) 15) (= (y stone10) 87)) (and (= (x stone10) 90) (= (y stone10) 39)) (and (= (x stone10) 88) (= (y stone10) 74)) (and (= (x stone10) 5) (= (y stone10) 3)) (and (= (x stone10) 97) (= (y stone10) 93)) (and (= (x stone10) 28) (= (y stone10) 60)) (and (= (x stone10) 89) (= (y stone10) 16)) (and (= (x stone10) 54) (= (y stone10) 65)) (and (= (x stone10) 24) (= (y stone10) 28)))
  ))

  
  

  
)
