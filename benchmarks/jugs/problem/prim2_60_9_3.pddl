(define
(problem prim2_60_9_3)
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
(= (capacity j0) 2)
(= (amount j0) 0)
(= (capacity j1) 11)
(= (amount j1) 0)
(= (capacity j2) 13)
(= (amount j2) 0)
(= (capacity j3) 57)
(= (amount j3) 0)
(= (capacity j4) 23)
(= (amount j4) 0)
(= (capacity j5) 80)
(= (amount j5) 0)
(= (capacity j6) 45)
(= (amount j6) 0)
(= (capacity j7) 7)
(= (amount j7) 0)
(= (capacity j8) 52)
(= (amount j8) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 12)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 79)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 51)
)
))
