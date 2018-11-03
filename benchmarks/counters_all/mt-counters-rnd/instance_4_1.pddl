(define (problem instance_4_1)
  (:domain fn-counters-rnd)
  (:objects
    c0 c1 c2 c3 - counter
  )

  (:init
    (= (max_int) 8)
	(= (value c0) 1)
	(= (value c1) 3)
	(= (value c2) 7)
	(= (value c3) 1)
  )

  (:goal (and 
    (< (value c0) (value c1))
	(< (value c1) (value c2))
	(< (value c2) (value c3))
  ))

  
)
