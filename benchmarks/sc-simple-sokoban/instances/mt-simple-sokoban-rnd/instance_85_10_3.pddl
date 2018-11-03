(define (problem instance_85_10_3)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 85)
	(= (min_x) 1)
	(= (max_y) 85)
	(= (min_y) 1)
	(= (x player1) 77)
	(= (y player1) 13)
	(= (x stone1) 56)
	(= (y stone1) 31)
	(= (x stone2) 64)
	(= (y stone2) 70)
	(= (x stone3) 73)
	(= (y stone3) 34)
	(= (x stone4) 47)
	(= (y stone4) 7)
	(= (x stone5) 59)
	(= (y stone5) 54)
	(= (x stone6) 82)
	(= (y stone6) 63)
	(= (x stone7) 40)
	(= (y stone7) 12)
	(= (x stone8) 78)
	(= (y stone8) 60)
	(= (x stone9) 58)
	(= (y stone9) 13)
	(= (x stone10) 28)
	(= (y stone10) 45)
  )

  (:goal (and 
    (or (and (= (x stone1) 8) (= (y stone1) 38)) (and (= (x stone1) 68) (= (y stone1) 21)) (and (= (x stone1) 44) (= (y stone1) 28)) (and (= (x stone1) 7) (= (y stone1) 9)) (and (= (x stone1) 19) (= (y stone1) 19)) (and (= (x stone1) 56) (= (y stone1) 3)) (and (= (x stone1) 77) (= (y stone1) 65)) (and (= (x stone1) 44) (= (y stone1) 72)) (and (= (x stone1) 47) (= (y stone1) 80)) (and (= (x stone1) 9) (= (y stone1) 60)))
	(or (and (= (x stone2) 8) (= (y stone2) 38)) (and (= (x stone2) 68) (= (y stone2) 21)) (and (= (x stone2) 44) (= (y stone2) 28)) (and (= (x stone2) 7) (= (y stone2) 9)) (and (= (x stone2) 19) (= (y stone2) 19)) (and (= (x stone2) 56) (= (y stone2) 3)) (and (= (x stone2) 77) (= (y stone2) 65)) (and (= (x stone2) 44) (= (y stone2) 72)) (and (= (x stone2) 47) (= (y stone2) 80)) (and (= (x stone2) 9) (= (y stone2) 60)))
	(or (and (= (x stone3) 8) (= (y stone3) 38)) (and (= (x stone3) 68) (= (y stone3) 21)) (and (= (x stone3) 44) (= (y stone3) 28)) (and (= (x stone3) 7) (= (y stone3) 9)) (and (= (x stone3) 19) (= (y stone3) 19)) (and (= (x stone3) 56) (= (y stone3) 3)) (and (= (x stone3) 77) (= (y stone3) 65)) (and (= (x stone3) 44) (= (y stone3) 72)) (and (= (x stone3) 47) (= (y stone3) 80)) (and (= (x stone3) 9) (= (y stone3) 60)))
	(or (and (= (x stone4) 8) (= (y stone4) 38)) (and (= (x stone4) 68) (= (y stone4) 21)) (and (= (x stone4) 44) (= (y stone4) 28)) (and (= (x stone4) 7) (= (y stone4) 9)) (and (= (x stone4) 19) (= (y stone4) 19)) (and (= (x stone4) 56) (= (y stone4) 3)) (and (= (x stone4) 77) (= (y stone4) 65)) (and (= (x stone4) 44) (= (y stone4) 72)) (and (= (x stone4) 47) (= (y stone4) 80)) (and (= (x stone4) 9) (= (y stone4) 60)))
	(or (and (= (x stone5) 8) (= (y stone5) 38)) (and (= (x stone5) 68) (= (y stone5) 21)) (and (= (x stone5) 44) (= (y stone5) 28)) (and (= (x stone5) 7) (= (y stone5) 9)) (and (= (x stone5) 19) (= (y stone5) 19)) (and (= (x stone5) 56) (= (y stone5) 3)) (and (= (x stone5) 77) (= (y stone5) 65)) (and (= (x stone5) 44) (= (y stone5) 72)) (and (= (x stone5) 47) (= (y stone5) 80)) (and (= (x stone5) 9) (= (y stone5) 60)))
	(or (and (= (x stone6) 8) (= (y stone6) 38)) (and (= (x stone6) 68) (= (y stone6) 21)) (and (= (x stone6) 44) (= (y stone6) 28)) (and (= (x stone6) 7) (= (y stone6) 9)) (and (= (x stone6) 19) (= (y stone6) 19)) (and (= (x stone6) 56) (= (y stone6) 3)) (and (= (x stone6) 77) (= (y stone6) 65)) (and (= (x stone6) 44) (= (y stone6) 72)) (and (= (x stone6) 47) (= (y stone6) 80)) (and (= (x stone6) 9) (= (y stone6) 60)))
	(or (and (= (x stone7) 8) (= (y stone7) 38)) (and (= (x stone7) 68) (= (y stone7) 21)) (and (= (x stone7) 44) (= (y stone7) 28)) (and (= (x stone7) 7) (= (y stone7) 9)) (and (= (x stone7) 19) (= (y stone7) 19)) (and (= (x stone7) 56) (= (y stone7) 3)) (and (= (x stone7) 77) (= (y stone7) 65)) (and (= (x stone7) 44) (= (y stone7) 72)) (and (= (x stone7) 47) (= (y stone7) 80)) (and (= (x stone7) 9) (= (y stone7) 60)))
	(or (and (= (x stone8) 8) (= (y stone8) 38)) (and (= (x stone8) 68) (= (y stone8) 21)) (and (= (x stone8) 44) (= (y stone8) 28)) (and (= (x stone8) 7) (= (y stone8) 9)) (and (= (x stone8) 19) (= (y stone8) 19)) (and (= (x stone8) 56) (= (y stone8) 3)) (and (= (x stone8) 77) (= (y stone8) 65)) (and (= (x stone8) 44) (= (y stone8) 72)) (and (= (x stone8) 47) (= (y stone8) 80)) (and (= (x stone8) 9) (= (y stone8) 60)))
	(or (and (= (x stone9) 8) (= (y stone9) 38)) (and (= (x stone9) 68) (= (y stone9) 21)) (and (= (x stone9) 44) (= (y stone9) 28)) (and (= (x stone9) 7) (= (y stone9) 9)) (and (= (x stone9) 19) (= (y stone9) 19)) (and (= (x stone9) 56) (= (y stone9) 3)) (and (= (x stone9) 77) (= (y stone9) 65)) (and (= (x stone9) 44) (= (y stone9) 72)) (and (= (x stone9) 47) (= (y stone9) 80)) (and (= (x stone9) 9) (= (y stone9) 60)))
	(or (and (= (x stone10) 8) (= (y stone10) 38)) (and (= (x stone10) 68) (= (y stone10) 21)) (and (= (x stone10) 44) (= (y stone10) 28)) (and (= (x stone10) 7) (= (y stone10) 9)) (and (= (x stone10) 19) (= (y stone10) 19)) (and (= (x stone10) 56) (= (y stone10) 3)) (and (= (x stone10) 77) (= (y stone10) 65)) (and (= (x stone10) 44) (= (y stone10) 72)) (and (= (x stone10) 47) (= (y stone10) 80)) (and (= (x stone10) 9) (= (y stone10) 60)))
  ))

  
  

  
)
