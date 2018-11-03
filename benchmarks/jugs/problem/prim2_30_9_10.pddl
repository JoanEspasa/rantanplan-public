(define
(problem prim2_30_9_10)
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
(= (capacity j0) 9)
(= (amount j0) 0)
(= (capacity j1) 11)
(= (amount j1) 0)
(= (capacity j2) 20)
(= (amount j2) 0)
(= (capacity j3) 4)
(= (amount j3) 0)
(= (capacity j4) 21)
(= (amount j4) 0)
(= (capacity j5) 25)
(= (amount j5) 0)
(= (capacity j6) 3)
(= (amount j6) 0)
(= (capacity j7) 4)
(= (amount j7) 0)
(= (capacity j8) 7)
(= (amount j8) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 19)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 24)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 6)
)
))
