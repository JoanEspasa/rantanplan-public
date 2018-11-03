(define (problem instance_25_5_2_1)
  (:domain mt-block-grouping-no-grid)
  (:objects
    b1 b2 b3 b4 b5 - block
  )

  (:init
    (= (x b3) 13)
	(= (y b3) 11)
	(= (x b4) 12)
	(= (y b4) 18)
	(= (x b2) 22)
	(= (y b2) 12)
	(= (x b1) 20)
	(= (y b1) 24)
	(= (x b5) 2)
	(= (y b5) 1)
	(= (max_x) 25 )
	(= (min_x) 1 )
	(= (max_y) 25 )
	(= (min_y) 1 )
  )

  (:goal (and 
    (or (not (= (x b1) (x b2))) (not (= (y b1) (y b2))))
	(= (x b1) (x b3))
(= (y b1) (y b3))
	(= (x b1) (x b4))
(= (y b1) (y b4))
	(= (x b1) (x b5))
(= (y b1) (y b5))
	(or (not (= (x b2) (x b3))) (not (= (y b2) (y b3))))
	(or (not (= (x b2) (x b4))) (not (= (y b2) (y b4))))
	(or (not (= (x b2) (x b5))) (not (= (y b2) (y b5))))
	(= (x b3) (x b4))
(= (y b3) (y b4))
	(= (x b3) (x b5))
(= (y b3) (y b5))
	(= (x b4) (x b5))
(= (y b4) (y b5))
  ))

  
  

  
)
