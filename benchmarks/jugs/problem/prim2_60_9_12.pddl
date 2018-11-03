(define
(problem prim2_60_9_12)
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
(= (capacity j0) 29)
(= (amount j0) 0)
(= (capacity j1) 23)
(= (amount j1) 0)
(= (capacity j2) 52)
(= (amount j2) 0)
(= (capacity j3) 47)
(= (amount j3) 0)
(= (capacity j4) 41)
(= (amount j4) 0)
(= (capacity j5) 88)
(= (amount j5) 0)
(= (capacity j6) 29)
(= (amount j6) 0)
(= (capacity j7) 39)
(= (amount j7) 0)
(= (capacity j8) 68)
(= (amount j8) 0)
)
(:goal
 (and
(= (amount j0) 0)
(= (amount j1) 0)
(= (amount j2) 51)
(= (amount j3) 0)
(= (amount j4) 0)
(= (amount j5) 87)
(= (amount j6) 0)
(= (amount j7) 0)
(= (amount j8) 67)
)
))
