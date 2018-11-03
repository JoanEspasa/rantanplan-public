(define (problem instance_4_2_1)
  (:domain mt-sc-simple-sokoban)
  (:objects
          	player1 - player
          	stone1 stone2 - stone
  )

  (:init
    (= (max_x) 4)
    (= (min_x) 1)
    (= (max_y) 4)
    (= (min_y) 1)

    ;;(= (loc player1) pos-2-2)
    (= (x player1) 2) (= (y player1) 2)

  	;;(= (loc stone1) pos-3-2)
    (= (x stone1) 3) (= (y stone1) 2)

  	;;(= (loc stone2) pos-3-3)
    (= (x stone2) 3) (= (y stone2) 3)

  	;;(goal_location pos-1-2)
  	;;(goal_location pos-4-4)
  )

  (:goal (and
          ;;(goal_location (loc stone1))
          ;;(goal_location (loc stone2))
          (or (and (= (x stone1) 1) (= (y stone1) 2)) (and (= (x stone1) 4) (= (y stone1) 4)))
          (or (and (= (x stone2) 1) (= (y stone2) 2)) (and (= (x stone2) 4) (= (y stone2) 4)))
  ))

)
