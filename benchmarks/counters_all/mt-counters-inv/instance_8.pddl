(define (problem instance_8)
  (:domain fn-counters-inv)
  (:objects
    c0 c1 c2 c3 c4 c5 c6 c7 - counter
  )

  (:init
    (= (max_int) 16)
	(= (value c0) 14)
	(= (value c1) 12)
	(= (value c2) 10)
	(= (value c3) 8)
	(= (value c4) 6)
	(= (value c5) 4)
	(= (value c6) 2)
	(= (value c7) 0)
  )

  (:goal (and 
    (< (value c0) (value c1))
	(< (value c1) (value c2))
	(< (value c2) (value c3))
	(< (value c3) (value c4))
	(< (value c4) (value c5))
	(< (value c5) (value c6))
	(< (value c6) (value c7))
  ))

  
)
