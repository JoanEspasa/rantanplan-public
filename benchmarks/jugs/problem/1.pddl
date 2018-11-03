(define 
 (problem jugs1)
 (:domain jug-pouring)

 (:objects
  j3 - jug
  j4 - jug
 )

 (:init
  (= (capacity j3) 3)
  (= (capacity j4) 4)
  (= (amount j3) 0)
  (= (amount j4) 0)
 )

 (:goal
  (= (amount j4) 2)
 )
 )
