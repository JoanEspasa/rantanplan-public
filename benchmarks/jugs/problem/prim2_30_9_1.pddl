(define
(problem prim2_30_9_1)
(:domain jug-pouring)
(:objects
j0 - jug
j1 - jug
j2 - jug
j3 - jug
j4 - jug
j5 - jug
j6 - jug
j7 - jug
j8 - jug
)
(:init
(= (capacity j0) 3)
(= (amount j0) 0)
(= (capacity j1) 8)
(= (amount j1) 0)
(= (capacity j2) 11)
(= (amount j2) 0)
(= (capacity j3) 6)
(= (amount j3) 0)
(= (capacity j4) 25)
(= (amount j4) 0)
(= (capacity j5) 31)
(= (amount j5) 0)
(= (capacity j6) 11)
(= (amount j6) 0)
(= (capacity j7) 26)
(= (amount j7) 0)
(= (capacity j8) 37)
(= (amount j8) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 10)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 30)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 36)
)
))
