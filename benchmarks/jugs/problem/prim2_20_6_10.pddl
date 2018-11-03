(define
(problem prim2_20_6_10)
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
(= (capacity j0) 20)
(= (amount j0) 0)
(= (capacity j1) 1)
(= (amount j1) 0)
(= (capacity j2) 21)
(= (amount j2) 0)
(= (capacity j3) 19)
(= (amount j3) 0)
(= (capacity j4) 7)
(= (amount j4) 0)
(= (capacity j5) 26)
(= (amount j5) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 20)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 25)
)
))
