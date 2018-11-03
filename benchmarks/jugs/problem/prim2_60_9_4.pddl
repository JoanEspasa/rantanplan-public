(define
(problem prim2_60_9_4)
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
(= (capacity j0) 8)
(= (amount j0) 0)
(= (capacity j1) 35)
(= (amount j1) 0)
(= (capacity j2) 43)
(= (amount j2) 0)
(= (capacity j3) 8)
(= (amount j3) 0)
(= (capacity j4) 3)
(= (amount j4) 0)
(= (capacity j5) 11)
(= (amount j5) 0)
(= (capacity j6) 1)
(= (amount j6) 0)
(= (capacity j7) 24)
(= (amount j7) 0)
(= (capacity j8) 25)
(= (amount j8) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 42)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 10)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 24)
)
))
