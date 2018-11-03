(define
(problem prim2_50_6_5)
(:domain jug-pouring)
(:objects
j0 - jug
j1 - jug
j2 - jug
j3 - jug
j4 - jug
j5 - jug
)
(:init
(= (capacity j0) 2)
(= (amount j0) 0)
(= (capacity j1) 43)
(= (amount j1) 0)
(= (capacity j2) 45)
(= (amount j2) 0)
(= (capacity j3) 46)
(= (amount j3) 0)
(= (capacity j4) 1)
(= (amount j4) 0)
(= (capacity j5) 47)
(= (amount j5) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 44)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 46)
)
))
