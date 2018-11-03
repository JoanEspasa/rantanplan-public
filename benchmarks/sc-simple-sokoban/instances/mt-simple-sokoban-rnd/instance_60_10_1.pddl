(define (problem instance_60_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 60)
	(= (min_x) 1)
	(= (max_y) 60)
	(= (min_y) 1)
	(= (x player1) 60)
	(= (y player1) 20)
	(= (x stone1) 11)
	(= (y stone1) 7)
	(= (x stone2) 2)
	(= (y stone2) 46)
	(= (x stone3) 42)
	(= (y stone3) 29)
	(= (x stone4) 50)
	(= (y stone4) 12)
	(= (x stone5) 15)
	(= (y stone5) 57)
	(= (x stone6) 12)
	(= (y stone6) 26)
	(= (x stone7) 2)
	(= (y stone7) 2)
	(= (x stone8) 5)
	(= (y stone8) 7)
	(= (x stone9) 6)
	(= (y stone9) 31)
	(= (x stone10) 39)
	(= (y stone10) 2)
  )

  (:goal (and 
    (or (and (= (x stone1) 31) (= (y stone1) 60)) (and (= (x stone1) 56) (= (y stone1) 60)) (and (= (x stone1) 6) (= (y stone1) 48)) (and (= (x stone1) 20) (= (y stone1) 11)) (and (= (x stone1) 34) (= (y stone1) 22)) (and (= (x stone1) 17) (= (y stone1) 53)) (and (= (x stone1) 11) (= (y stone1) 50)) (and (= (x stone1) 30) (= (y stone1) 16)) (and (= (x stone1) 27) (= (y stone1) 19)) (and (= (x stone1) 42) (= (y stone1) 2)))
	(or (and (= (x stone2) 31) (= (y stone2) 60)) (and (= (x stone2) 56) (= (y stone2) 60)) (and (= (x stone2) 6) (= (y stone2) 48)) (and (= (x stone2) 20) (= (y stone2) 11)) (and (= (x stone2) 34) (= (y stone2) 22)) (and (= (x stone2) 17) (= (y stone2) 53)) (and (= (x stone2) 11) (= (y stone2) 50)) (and (= (x stone2) 30) (= (y stone2) 16)) (and (= (x stone2) 27) (= (y stone2) 19)) (and (= (x stone2) 42) (= (y stone2) 2)))
	(or (and (= (x stone3) 31) (= (y stone3) 60)) (and (= (x stone3) 56) (= (y stone3) 60)) (and (= (x stone3) 6) (= (y stone3) 48)) (and (= (x stone3) 20) (= (y stone3) 11)) (and (= (x stone3) 34) (= (y stone3) 22)) (and (= (x stone3) 17) (= (y stone3) 53)) (and (= (x stone3) 11) (= (y stone3) 50)) (and (= (x stone3) 30) (= (y stone3) 16)) (and (= (x stone3) 27) (= (y stone3) 19)) (and (= (x stone3) 42) (= (y stone3) 2)))
	(or (and (= (x stone4) 31) (= (y stone4) 60)) (and (= (x stone4) 56) (= (y stone4) 60)) (and (= (x stone4) 6) (= (y stone4) 48)) (and (= (x stone4) 20) (= (y stone4) 11)) (and (= (x stone4) 34) (= (y stone4) 22)) (and (= (x stone4) 17) (= (y stone4) 53)) (and (= (x stone4) 11) (= (y stone4) 50)) (and (= (x stone4) 30) (= (y stone4) 16)) (and (= (x stone4) 27) (= (y stone4) 19)) (and (= (x stone4) 42) (= (y stone4) 2)))
	(or (and (= (x stone5) 31) (= (y stone5) 60)) (and (= (x stone5) 56) (= (y stone5) 60)) (and (= (x stone5) 6) (= (y stone5) 48)) (and (= (x stone5) 20) (= (y stone5) 11)) (and (= (x stone5) 34) (= (y stone5) 22)) (and (= (x stone5) 17) (= (y stone5) 53)) (and (= (x stone5) 11) (= (y stone5) 50)) (and (= (x stone5) 30) (= (y stone5) 16)) (and (= (x stone5) 27) (= (y stone5) 19)) (and (= (x stone5) 42) (= (y stone5) 2)))
	(or (and (= (x stone6) 31) (= (y stone6) 60)) (and (= (x stone6) 56) (= (y stone6) 60)) (and (= (x stone6) 6) (= (y stone6) 48)) (and (= (x stone6) 20) (= (y stone6) 11)) (and (= (x stone6) 34) (= (y stone6) 22)) (and (= (x stone6) 17) (= (y stone6) 53)) (and (= (x stone6) 11) (= (y stone6) 50)) (and (= (x stone6) 30) (= (y stone6) 16)) (and (= (x stone6) 27) (= (y stone6) 19)) (and (= (x stone6) 42) (= (y stone6) 2)))
	(or (and (= (x stone7) 31) (= (y stone7) 60)) (and (= (x stone7) 56) (= (y stone7) 60)) (and (= (x stone7) 6) (= (y stone7) 48)) (and (= (x stone7) 20) (= (y stone7) 11)) (and (= (x stone7) 34) (= (y stone7) 22)) (and (= (x stone7) 17) (= (y stone7) 53)) (and (= (x stone7) 11) (= (y stone7) 50)) (and (= (x stone7) 30) (= (y stone7) 16)) (and (= (x stone7) 27) (= (y stone7) 19)) (and (= (x stone7) 42) (= (y stone7) 2)))
	(or (and (= (x stone8) 31) (= (y stone8) 60)) (and (= (x stone8) 56) (= (y stone8) 60)) (and (= (x stone8) 6) (= (y stone8) 48)) (and (= (x stone8) 20) (= (y stone8) 11)) (and (= (x stone8) 34) (= (y stone8) 22)) (and (= (x stone8) 17) (= (y stone8) 53)) (and (= (x stone8) 11) (= (y stone8) 50)) (and (= (x stone8) 30) (= (y stone8) 16)) (and (= (x stone8) 27) (= (y stone8) 19)) (and (= (x stone8) 42) (= (y stone8) 2)))
	(or (and (= (x stone9) 31) (= (y stone9) 60)) (and (= (x stone9) 56) (= (y stone9) 60)) (and (= (x stone9) 6) (= (y stone9) 48)) (and (= (x stone9) 20) (= (y stone9) 11)) (and (= (x stone9) 34) (= (y stone9) 22)) (and (= (x stone9) 17) (= (y stone9) 53)) (and (= (x stone9) 11) (= (y stone9) 50)) (and (= (x stone9) 30) (= (y stone9) 16)) (and (= (x stone9) 27) (= (y stone9) 19)) (and (= (x stone9) 42) (= (y stone9) 2)))
	(or (and (= (x stone10) 31) (= (y stone10) 60)) (and (= (x stone10) 56) (= (y stone10) 60)) (and (= (x stone10) 6) (= (y stone10) 48)) (and (= (x stone10) 20) (= (y stone10) 11)) (and (= (x stone10) 34) (= (y stone10) 22)) (and (= (x stone10) 17) (= (y stone10) 53)) (and (= (x stone10) 11) (= (y stone10) 50)) (and (= (x stone10) 30) (= (y stone10) 16)) (and (= (x stone10) 27) (= (y stone10) 19)) (and (= (x stone10) 42) (= (y stone10) 2)))
  ))

  
  

  
)
