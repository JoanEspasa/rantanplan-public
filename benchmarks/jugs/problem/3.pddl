(define 
 (problem jugs3)
 (:domain jug-pouring)

 (:objects
  j100 - jug
  j3 - jug
  j5 - jug
 )

 (:init
  (= (capacity j100) 100)
  (= (capacity j3) 3)
  (= (capacity j5) 5)
  (= (amount j100) 0)
  (= (amount j3) 0)
  (= (amount j5) 0)
 )

 (:goal
  (and
  (= (amount j100) 50)
  (= (amount j3) 0)
  (= (amount j5) 0)
  )
 )
)
