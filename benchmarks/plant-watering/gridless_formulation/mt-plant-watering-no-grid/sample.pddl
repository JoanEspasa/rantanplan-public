(define (problem instance_4_1)
  (:domain mt-plant-watering)
  (:objects
    plant1 plant3 plant2 plant4 - plant
	  tap1 - tap
	  agent1 - agent
  )

  (:init
    (= (maxx) 5) (= (minx) 0) (= (maxy) 5) (= (miny) 0)

  	(= (max_int) 80)
  	(= (carrying) 0)
  	(= (total_poured) 0)
  	(= (total_loaded) 0)
  	(= (poured plant1) 0)
  	(= (poured plant2) 0)
  	(= (poured plant3) 0)
  	(= (poured plant4) 0)

  	;;(pos agent1 pos-3-2)
    (= (x agent1) 3) (= (y agent1) 2)

  	;;(pos plant1 pos-1-4)
    (= (x plant1) 1) (= (y plant1) 4)

  	;;(pos tap1 pos-3-4)
    (= (x tap1) 3) (= (y tap1) 4)

    ;;(pos plant3 pos-4-4)
    (= (x plant3) 4) (= (y plant3) 4)

    ;;(pos plant2 pos-1-2)
    (= (x plant2) 1) (= (y plant2) 2)

    ;;(pos plant4 pos-2-2)
    (= (x plant4) 2) (= (y plant4) 2)

    )

  (:goal (and
    (= (total_poured) (total_loaded))
  	(= (poured plant1) 9)
  	(= (poured plant2) 7)
  	(= (poured plant3) 4)
  	(= (poured plant4) 1)
  ))





)
