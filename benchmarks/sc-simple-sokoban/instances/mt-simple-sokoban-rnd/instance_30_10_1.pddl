(define (problem instance_30_10_1)
  (:domain mt-simple-sokoban-rnd)
  (:objects
    stone1 stone2 stone3 stone4 stone5 stone6 stone7 stone8 stone9 stone10 - stone
	player1 - player
  )

  (:init
    (= (max_x) 30)
	(= (min_x) 1)
	(= (max_y) 30)
	(= (min_y) 1)
	(= (x player1) 14)
	(= (y player1) 16)
	(= (x stone1) 20)
	(= (y stone1) 9)
	(= (x stone2) 8)
	(= (y stone2) 4)
	(= (x stone3) 12)
	(= (y stone3) 10)
	(= (x stone4) 24)
	(= (y stone4) 7)
	(= (x stone5) 14)
	(= (y stone5) 25)
	(= (x stone6) 28)
	(= (y stone6) 2)
	(= (x stone7) 14)
	(= (y stone7) 27)
	(= (x stone8) 28)
	(= (y stone8) 22)
	(= (x stone9) 5)
	(= (y stone9) 11)
	(= (x stone10) 2)
	(= (y stone10) 13)
  )

  (:goal (and 
    (or (and (= (x stone1) 4) (= (y stone1) 21)) (and (= (x stone1) 4) (= (y stone1) 24)) (and (= (x stone1) 28) (= (y stone1) 21)) (and (= (x stone1) 25) (= (y stone1) 8)) (and (= (x stone1) 16) (= (y stone1) 26)) (and (= (x stone1) 5) (= (y stone1) 6)) (and (= (x stone1) 17) (= (y stone1) 13)) (and (= (x stone1) 28) (= (y stone1) 3)) (and (= (x stone1) 26) (= (y stone1) 8)) (and (= (x stone1) 30) (= (y stone1) 27)))
	(or (and (= (x stone2) 4) (= (y stone2) 21)) (and (= (x stone2) 4) (= (y stone2) 24)) (and (= (x stone2) 28) (= (y stone2) 21)) (and (= (x stone2) 25) (= (y stone2) 8)) (and (= (x stone2) 16) (= (y stone2) 26)) (and (= (x stone2) 5) (= (y stone2) 6)) (and (= (x stone2) 17) (= (y stone2) 13)) (and (= (x stone2) 28) (= (y stone2) 3)) (and (= (x stone2) 26) (= (y stone2) 8)) (and (= (x stone2) 30) (= (y stone2) 27)))
	(or (and (= (x stone3) 4) (= (y stone3) 21)) (and (= (x stone3) 4) (= (y stone3) 24)) (and (= (x stone3) 28) (= (y stone3) 21)) (and (= (x stone3) 25) (= (y stone3) 8)) (and (= (x stone3) 16) (= (y stone3) 26)) (and (= (x stone3) 5) (= (y stone3) 6)) (and (= (x stone3) 17) (= (y stone3) 13)) (and (= (x stone3) 28) (= (y stone3) 3)) (and (= (x stone3) 26) (= (y stone3) 8)) (and (= (x stone3) 30) (= (y stone3) 27)))
	(or (and (= (x stone4) 4) (= (y stone4) 21)) (and (= (x stone4) 4) (= (y stone4) 24)) (and (= (x stone4) 28) (= (y stone4) 21)) (and (= (x stone4) 25) (= (y stone4) 8)) (and (= (x stone4) 16) (= (y stone4) 26)) (and (= (x stone4) 5) (= (y stone4) 6)) (and (= (x stone4) 17) (= (y stone4) 13)) (and (= (x stone4) 28) (= (y stone4) 3)) (and (= (x stone4) 26) (= (y stone4) 8)) (and (= (x stone4) 30) (= (y stone4) 27)))
	(or (and (= (x stone5) 4) (= (y stone5) 21)) (and (= (x stone5) 4) (= (y stone5) 24)) (and (= (x stone5) 28) (= (y stone5) 21)) (and (= (x stone5) 25) (= (y stone5) 8)) (and (= (x stone5) 16) (= (y stone5) 26)) (and (= (x stone5) 5) (= (y stone5) 6)) (and (= (x stone5) 17) (= (y stone5) 13)) (and (= (x stone5) 28) (= (y stone5) 3)) (and (= (x stone5) 26) (= (y stone5) 8)) (and (= (x stone5) 30) (= (y stone5) 27)))
	(or (and (= (x stone6) 4) (= (y stone6) 21)) (and (= (x stone6) 4) (= (y stone6) 24)) (and (= (x stone6) 28) (= (y stone6) 21)) (and (= (x stone6) 25) (= (y stone6) 8)) (and (= (x stone6) 16) (= (y stone6) 26)) (and (= (x stone6) 5) (= (y stone6) 6)) (and (= (x stone6) 17) (= (y stone6) 13)) (and (= (x stone6) 28) (= (y stone6) 3)) (and (= (x stone6) 26) (= (y stone6) 8)) (and (= (x stone6) 30) (= (y stone6) 27)))
	(or (and (= (x stone7) 4) (= (y stone7) 21)) (and (= (x stone7) 4) (= (y stone7) 24)) (and (= (x stone7) 28) (= (y stone7) 21)) (and (= (x stone7) 25) (= (y stone7) 8)) (and (= (x stone7) 16) (= (y stone7) 26)) (and (= (x stone7) 5) (= (y stone7) 6)) (and (= (x stone7) 17) (= (y stone7) 13)) (and (= (x stone7) 28) (= (y stone7) 3)) (and (= (x stone7) 26) (= (y stone7) 8)) (and (= (x stone7) 30) (= (y stone7) 27)))
	(or (and (= (x stone8) 4) (= (y stone8) 21)) (and (= (x stone8) 4) (= (y stone8) 24)) (and (= (x stone8) 28) (= (y stone8) 21)) (and (= (x stone8) 25) (= (y stone8) 8)) (and (= (x stone8) 16) (= (y stone8) 26)) (and (= (x stone8) 5) (= (y stone8) 6)) (and (= (x stone8) 17) (= (y stone8) 13)) (and (= (x stone8) 28) (= (y stone8) 3)) (and (= (x stone8) 26) (= (y stone8) 8)) (and (= (x stone8) 30) (= (y stone8) 27)))
	(or (and (= (x stone9) 4) (= (y stone9) 21)) (and (= (x stone9) 4) (= (y stone9) 24)) (and (= (x stone9) 28) (= (y stone9) 21)) (and (= (x stone9) 25) (= (y stone9) 8)) (and (= (x stone9) 16) (= (y stone9) 26)) (and (= (x stone9) 5) (= (y stone9) 6)) (and (= (x stone9) 17) (= (y stone9) 13)) (and (= (x stone9) 28) (= (y stone9) 3)) (and (= (x stone9) 26) (= (y stone9) 8)) (and (= (x stone9) 30) (= (y stone9) 27)))
	(or (and (= (x stone10) 4) (= (y stone10) 21)) (and (= (x stone10) 4) (= (y stone10) 24)) (and (= (x stone10) 28) (= (y stone10) 21)) (and (= (x stone10) 25) (= (y stone10) 8)) (and (= (x stone10) 16) (= (y stone10) 26)) (and (= (x stone10) 5) (= (y stone10) 6)) (and (= (x stone10) 17) (= (y stone10) 13)) (and (= (x stone10) 28) (= (y stone10) 3)) (and (= (x stone10) 26) (= (y stone10) 8)) (and (= (x stone10) 30) (= (y stone10) 27)))
  ))

  
  

  
)
