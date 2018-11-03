(define
(problem prim2_20_6_6)
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
(= (capacity j0) 1)
(= (amount j0) 0)
(= (capacity j1) 19)
(= (amount j1) 0)
(= (capacity j2) 20)
(= (amount j2) 0)
(= (capacity j3) 3)
(= (amount j3) 0)
(= (capacity j4) 19)
(= (amount j4) 0)
(= (capacity j5) 22)
(= (amount j5) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 19)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 21)
)
))
