(define (problem instance_10_3)
  (:domain mt-plant-watering-constrained)
  (:objects
    tap1 - tap
	agent1 - agent
	plant10 plant9 plant2 plant3 plant1 plant8 plant6 plant5 plant7 plant4 - plant
  )

  (:init
    (= (max_int) 200)
	(= (maxx) 10)
	(= (minx) 1)
	(= (maxy) 10)
	(= (miny) 1)
	(= (carrying) 0)
	(= (total_poured) 0)
	(= (total_loaded) 0)
	(= (poured plant1) 0)
	(= (poured plant2) 0)
	(= (poured plant3) 0)
	(= (poured plant4) 0)
	(= (poured plant5) 0)
	(= (poured plant6) 0)
	(= (poured plant7) 0)
	(= (poured plant8) 0)
	(= (poured plant9) 0)
	(= (poured plant10) 0)
	(= (x agent1) 5)
	(= (y agent1) 3)
	(= (x plant10) 10)
	(= (y plant10) 10)
	(= (x plant1) 5)
	(= (y plant1) 5)
	(= (x plant3) 3)
	(= (y plant3) 3)
	(= (x plant2) 1)
	(= (y plant2) 1)
	(= (x plant8) 2)
	(= (y plant8) 2)
	(= (x plant6) 3)
	(= (y plant6) 3)
	(= (x plant4) 3)
	(= (y plant4) 3)
	(= (x plant7) 6)
	(= (y plant7) 6)
	(= (x tap1) 6)
	(= (y tap1) 6)
	(= (x plant5) 4)
	(= (y plant5) 4)
	(= (x plant9) 5)
	(= (y plant9) 5)
  )

  (:goal (and 
    (= (poured plant1) 4)
	(= (poured plant2) 4)
	(= (poured plant3) 8)
	(= (poured plant4) 8)
	(= (poured plant5) 1)
	(= (poured plant6) 8)
	(= (poured plant7) 5)
	(= (poured plant8) 8)
	(= (poured plant9) 7)
	(= (poured plant10) 8)
	(= (total_poured) (+ (+ (+ (+ (+ (+ (+ (+ (+ (poured plant1) (poured plant2)) (poured plant3)) (poured plant4)) (poured plant5)) (poured plant6)) (poured plant7)) (poured plant8)) (poured plant9)) (poured plant10)) )
  ))

  
  

  
)
