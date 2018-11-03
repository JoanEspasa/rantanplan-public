(define (problem instance_55_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 55)
	(= (min_x) 1)
	(= (max_y) 55)
	(= (min_y) 1)
	(= (x player1) 11)
	(= (y player1) 44)
	(= (x stone1) 5)
	(= (y stone1) 17)
	(= (x stone2) 15)
	(= (y stone2) 53)
	(= (x stone3) 11)
	(= (y stone3) 2)
	(= (x stone4) 52)
	(= (y stone4) 53)
	(= (x stone5) 25)
	(= (y stone5) 20)
	(= (x stone6) 22)
	(= (y stone6) 38)
	(= (x stone7) 12)
	(= (y stone7) 46)
	(= (x stone8) 53)
	(= (y stone8) 3)
	(= (x stone9) 35)
	(= (y stone9) 35)
	(= (x stone10) 19)
	(= (y stone10) 6)
  )

  (:goal (and 
    (or (and (= (x stone1) 17) (= (y stone1) 45)) (and (= (x stone1) 36) (= (y stone1) 7)) (and (= (x stone1) 47) (= (y stone1) 7)) (and (= (x stone1) 27) (= (y stone1) 7)) (and (= (x stone1) 10) (= (y stone1) 54)) (and (= (x stone1) 13) (= (y stone1) 38)) (and (= (x stone1) 34) (= (y stone1) 3)) (and (= (x stone1) 53) (= (y stone1) 55)) (and (= (x stone1) 5) (= (y stone1) 44)) (and (= (x stone1) 26) (= (y stone1) 24)))
	(or (and (= (x stone2) 17) (= (y stone2) 45)) (and (= (x stone2) 36) (= (y stone2) 7)) (and (= (x stone2) 47) (= (y stone2) 7)) (and (= (x stone2) 27) (= (y stone2) 7)) (and (= (x stone2) 10) (= (y stone2) 54)) (and (= (x stone2) 13) (= (y stone2) 38)) (and (= (x stone2) 34) (= (y stone2) 3)) (and (= (x stone2) 53) (= (y stone2) 55)) (and (= (x stone2) 5) (= (y stone2) 44)) (and (= (x stone2) 26) (= (y stone2) 24)))
	(or (and (= (x stone3) 17) (= (y stone3) 45)) (and (= (x stone3) 36) (= (y stone3) 7)) (and (= (x stone3) 47) (= (y stone3) 7)) (and (= (x stone3) 27) (= (y stone3) 7)) (and (= (x stone3) 10) (= (y stone3) 54)) (and (= (x stone3) 13) (= (y stone3) 38)) (and (= (x stone3) 34) (= (y stone3) 3)) (and (= (x stone3) 53) (= (y stone3) 55)) (and (= (x stone3) 5) (= (y stone3) 44)) (and (= (x stone3) 26) (= (y stone3) 24)))
	(or (and (= (x stone4) 17) (= (y stone4) 45)) (and (= (x stone4) 36) (= (y stone4) 7)) (and (= (x stone4) 47) (= (y stone4) 7)) (and (= (x stone4) 27) (= (y stone4) 7)) (and (= (x stone4) 10) (= (y stone4) 54)) (and (= (x stone4) 13) (= (y stone4) 38)) (and (= (x stone4) 34) (= (y stone4) 3)) (and (= (x stone4) 53) (= (y stone4) 55)) (and (= (x stone4) 5) (= (y stone4) 44)) (and (= (x stone4) 26) (= (y stone4) 24)))
	(or (and (= (x stone5) 17) (= (y stone5) 45)) (and (= (x stone5) 36) (= (y stone5) 7)) (and (= (x stone5) 47) (= (y stone5) 7)) (and (= (x stone5) 27) (= (y stone5) 7)) (and (= (x stone5) 10) (= (y stone5) 54)) (and (= (x stone5) 13) (= (y stone5) 38)) (and (= (x stone5) 34) (= (y stone5) 3)) (and (= (x stone5) 53) (= (y stone5) 55)) (and (= (x stone5) 5) (= (y stone5) 44)) (and (= (x stone5) 26) (= (y stone5) 24)))
	(or (and (= (x stone6) 17) (= (y stone6) 45)) (and (= (x stone6) 36) (= (y stone6) 7)) (and (= (x stone6) 47) (= (y stone6) 7)) (and (= (x stone6) 27) (= (y stone6) 7)) (and (= (x stone6) 10) (= (y stone6) 54)) (and (= (x stone6) 13) (= (y stone6) 38)) (and (= (x stone6) 34) (= (y stone6) 3)) (and (= (x stone6) 53) (= (y stone6) 55)) (and (= (x stone6) 5) (= (y stone6) 44)) (and (= (x stone6) 26) (= (y stone6) 24)))
	(or (and (= (x stone7) 17) (= (y stone7) 45)) (and (= (x stone7) 36) (= (y stone7) 7)) (and (= (x stone7) 47) (= (y stone7) 7)) (and (= (x stone7) 27) (= (y stone7) 7)) (and (= (x stone7) 10) (= (y stone7) 54)) (and (= (x stone7) 13) (= (y stone7) 38)) (and (= (x stone7) 34) (= (y stone7) 3)) (and (= (x stone7) 53) (= (y stone7) 55)) (and (= (x stone7) 5) (= (y stone7) 44)) (and (= (x stone7) 26) (= (y stone7) 24)))
	(or (and (= (x stone8) 17) (= (y stone8) 45)) (and (= (x stone8) 36) (= (y stone8) 7)) (and (= (x stone8) 47) (= (y stone8) 7)) (and (= (x stone8) 27) (= (y stone8) 7)) (and (= (x stone8) 10) (= (y stone8) 54)) (and (= (x stone8) 13) (= (y stone8) 38)) (and (= (x stone8) 34) (= (y stone8) 3)) (and (= (x stone8) 53) (= (y stone8) 55)) (and (= (x stone8) 5) (= (y stone8) 44)) (and (= (x stone8) 26) (= (y stone8) 24)))
	(or (and (= (x stone9) 17) (= (y stone9) 45)) (and (= (x stone9) 36) (= (y stone9) 7)) (and (= (x stone9) 47) (= (y stone9) 7)) (and (= (x stone9) 27) (= (y stone9) 7)) (and (= (x stone9) 10) (= (y stone9) 54)) (and (= (x stone9) 13) (= (y stone9) 38)) (and (= (x stone9) 34) (= (y stone9) 3)) (and (= (x stone9) 53) (= (y stone9) 55)) (and (= (x stone9) 5) (= (y stone9) 44)) (and (= (x stone9) 26) (= (y stone9) 24)))
	(or (and (= (x stone10) 17) (= (y stone10) 45)) (and (= (x stone10) 36) (= (y stone10) 7)) (and (= (x stone10) 47) (= (y stone10) 7)) (and (= (x stone10) 27) (= (y stone10) 7)) (and (= (x stone10) 10) (= (y stone10) 54)) (and (= (x stone10) 13) (= (y stone10) 38)) (and (= (x stone10) 34) (= (y stone10) 3)) (and (= (x stone10) 53) (= (y stone10) 55)) (and (= (x stone10) 5) (= (y stone10) 44)) (and (= (x stone10) 26) (= (y stone10) 24)))
  ))

  
  

  
)
