(define 
 (problem jugs3)
 (:domain jug-pouring)

 (:objects
  j3 - jug
  j4 - jug
  j5 - jug
  j6 - jug
  j7 - jug
  j8 - jug
  j9 - jug
  j10 - jug
 )

 (:init
  (= (capacity j3) 3)
  (= (capacity j4) 4)
  (= (capacity j5) 5)
  (= (capacity j6) 6)
  (= (capacity j7) 7)
  (= (capacity j8) 8)
  (= (capacity j9) 9)
  (= (capacity j10) 10)
  (= (amount j3) 0)
  (= (amount j4) 0)
  (= (amount j5) 0)
  (= (amount j6) 0)
  (= (amount j7) 0)
  (= (amount j8) 0)
  (= (amount j9) 0)
  (= (amount j10) 0)
 )

 (:goal
  (and
  (= (amount j4) 2)
  (= (amount j5) 2)
  (= (amount j6) 3)
  (= (amount j7) 3)
  (= (amount j8) 4)
  (= (amount j9) 4)
  (= (amount j10) 5)
  )
 )
)
