(define (problem instance_80_10_2)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 80)
	(= (min_x) 1)
	(= (max_y) 80)
	(= (min_y) 1)
	(= (x player1) 51)
	(= (y player1) 66)
	(= (x stone1) 26)
	(= (y stone1) 73)
	(= (x stone2) 27)
	(= (y stone2) 41)
	(= (x stone3) 20)
	(= (y stone3) 29)
	(= (x stone4) 66)
	(= (y stone4) 55)
	(= (x stone5) 9)
	(= (y stone5) 30)
	(= (x stone6) 57)
	(= (y stone6) 71)
	(= (x stone7) 68)
	(= (y stone7) 54)
	(= (x stone8) 28)
	(= (y stone8) 65)
	(= (x stone9) 42)
	(= (y stone9) 68)
	(= (x stone10) 4)
	(= (y stone10) 35)
  )

  (:goal (and 
    (or (and (= (x stone1) 30) (= (y stone1) 78)) (and (= (x stone1) 4) (= (y stone1) 22)) (and (= (x stone1) 15) (= (y stone1) 35)) (and (= (x stone1) 30) (= (y stone1) 34)) (and (= (x stone1) 63) (= (y stone1) 69)) (and (= (x stone1) 62) (= (y stone1) 69)) (and (= (x stone1) 17) (= (y stone1) 28)) (and (= (x stone1) 55) (= (y stone1) 79)) (and (= (x stone1) 37) (= (y stone1) 71)) (and (= (x stone1) 55) (= (y stone1) 2)))
	(or (and (= (x stone2) 30) (= (y stone2) 78)) (and (= (x stone2) 4) (= (y stone2) 22)) (and (= (x stone2) 15) (= (y stone2) 35)) (and (= (x stone2) 30) (= (y stone2) 34)) (and (= (x stone2) 63) (= (y stone2) 69)) (and (= (x stone2) 62) (= (y stone2) 69)) (and (= (x stone2) 17) (= (y stone2) 28)) (and (= (x stone2) 55) (= (y stone2) 79)) (and (= (x stone2) 37) (= (y stone2) 71)) (and (= (x stone2) 55) (= (y stone2) 2)))
	(or (and (= (x stone3) 30) (= (y stone3) 78)) (and (= (x stone3) 4) (= (y stone3) 22)) (and (= (x stone3) 15) (= (y stone3) 35)) (and (= (x stone3) 30) (= (y stone3) 34)) (and (= (x stone3) 63) (= (y stone3) 69)) (and (= (x stone3) 62) (= (y stone3) 69)) (and (= (x stone3) 17) (= (y stone3) 28)) (and (= (x stone3) 55) (= (y stone3) 79)) (and (= (x stone3) 37) (= (y stone3) 71)) (and (= (x stone3) 55) (= (y stone3) 2)))
	(or (and (= (x stone4) 30) (= (y stone4) 78)) (and (= (x stone4) 4) (= (y stone4) 22)) (and (= (x stone4) 15) (= (y stone4) 35)) (and (= (x stone4) 30) (= (y stone4) 34)) (and (= (x stone4) 63) (= (y stone4) 69)) (and (= (x stone4) 62) (= (y stone4) 69)) (and (= (x stone4) 17) (= (y stone4) 28)) (and (= (x stone4) 55) (= (y stone4) 79)) (and (= (x stone4) 37) (= (y stone4) 71)) (and (= (x stone4) 55) (= (y stone4) 2)))
	(or (and (= (x stone5) 30) (= (y stone5) 78)) (and (= (x stone5) 4) (= (y stone5) 22)) (and (= (x stone5) 15) (= (y stone5) 35)) (and (= (x stone5) 30) (= (y stone5) 34)) (and (= (x stone5) 63) (= (y stone5) 69)) (and (= (x stone5) 62) (= (y stone5) 69)) (and (= (x stone5) 17) (= (y stone5) 28)) (and (= (x stone5) 55) (= (y stone5) 79)) (and (= (x stone5) 37) (= (y stone5) 71)) (and (= (x stone5) 55) (= (y stone5) 2)))
	(or (and (= (x stone6) 30) (= (y stone6) 78)) (and (= (x stone6) 4) (= (y stone6) 22)) (and (= (x stone6) 15) (= (y stone6) 35)) (and (= (x stone6) 30) (= (y stone6) 34)) (and (= (x stone6) 63) (= (y stone6) 69)) (and (= (x stone6) 62) (= (y stone6) 69)) (and (= (x stone6) 17) (= (y stone6) 28)) (and (= (x stone6) 55) (= (y stone6) 79)) (and (= (x stone6) 37) (= (y stone6) 71)) (and (= (x stone6) 55) (= (y stone6) 2)))
	(or (and (= (x stone7) 30) (= (y stone7) 78)) (and (= (x stone7) 4) (= (y stone7) 22)) (and (= (x stone7) 15) (= (y stone7) 35)) (and (= (x stone7) 30) (= (y stone7) 34)) (and (= (x stone7) 63) (= (y stone7) 69)) (and (= (x stone7) 62) (= (y stone7) 69)) (and (= (x stone7) 17) (= (y stone7) 28)) (and (= (x stone7) 55) (= (y stone7) 79)) (and (= (x stone7) 37) (= (y stone7) 71)) (and (= (x stone7) 55) (= (y stone7) 2)))
	(or (and (= (x stone8) 30) (= (y stone8) 78)) (and (= (x stone8) 4) (= (y stone8) 22)) (and (= (x stone8) 15) (= (y stone8) 35)) (and (= (x stone8) 30) (= (y stone8) 34)) (and (= (x stone8) 63) (= (y stone8) 69)) (and (= (x stone8) 62) (= (y stone8) 69)) (and (= (x stone8) 17) (= (y stone8) 28)) (and (= (x stone8) 55) (= (y stone8) 79)) (and (= (x stone8) 37) (= (y stone8) 71)) (and (= (x stone8) 55) (= (y stone8) 2)))
	(or (and (= (x stone9) 30) (= (y stone9) 78)) (and (= (x stone9) 4) (= (y stone9) 22)) (and (= (x stone9) 15) (= (y stone9) 35)) (and (= (x stone9) 30) (= (y stone9) 34)) (and (= (x stone9) 63) (= (y stone9) 69)) (and (= (x stone9) 62) (= (y stone9) 69)) (and (= (x stone9) 17) (= (y stone9) 28)) (and (= (x stone9) 55) (= (y stone9) 79)) (and (= (x stone9) 37) (= (y stone9) 71)) (and (= (x stone9) 55) (= (y stone9) 2)))
	(or (and (= (x stone10) 30) (= (y stone10) 78)) (and (= (x stone10) 4) (= (y stone10) 22)) (and (= (x stone10) 15) (= (y stone10) 35)) (and (= (x stone10) 30) (= (y stone10) 34)) (and (= (x stone10) 63) (= (y stone10) 69)) (and (= (x stone10) 62) (= (y stone10) 69)) (and (= (x stone10) 17) (= (y stone10) 28)) (and (= (x stone10) 55) (= (y stone10) 79)) (and (= (x stone10) 37) (= (y stone10) 71)) (and (= (x stone10) 55) (= (y stone10) 2)))
  ))

  
  

  
)
