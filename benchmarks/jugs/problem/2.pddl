(define 
 (problem jugs2)
 (:domain jug-pouring)

 (:objects
  j3 - jug
  j4 - jug
  j5 - jug
  j6 - jug
 )

 (:init
  (= (capacity j3) 3)
  (= (capacity j4) 4)
  (= (capacity j5) 5)
  (= (capacity j6) 6)
  (= (amount j3) 0)
  (= (amount j4) 0)
  (= (amount j5) 0)
  (= (amount j6) 0)
 )

 (:goal
  (and
  (= (amount j4) 2)
  (= (amount j5) 2)
  (= (amount j6) 3)
  )
 )
)
