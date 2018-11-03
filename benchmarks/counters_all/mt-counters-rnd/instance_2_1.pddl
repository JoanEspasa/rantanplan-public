(define (problem instance_2_1)
  (:domain fn-counters-rnd)
  (:objects
    c0 c1 - counter
  )

  (:init
    (= (value c0) 0)
	(= (value c1) 0)
	(= (max_int) 4)
  )

  (:goal (and 
    (< (value c0) (value c1))
  ))

  
  

  
)
