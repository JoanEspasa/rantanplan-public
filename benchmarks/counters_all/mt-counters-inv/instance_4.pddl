(define (problem instance_4)
  (:domain fn-counters-inv)
  (:objects
    c0 c1 c2 c3 - counter
  )

  (:init
    (= (max_int) 8)
	(= (value c0) 6)
	(= (value c1) 4)
	(= (value c2) 2)
	(= (value c3) 0)
  )

  (:goal (and 
    (< (value c0) (value c1))
	(< (value c1) (value c2))
	(< (value c2) (value c3))
  ))

  
)
