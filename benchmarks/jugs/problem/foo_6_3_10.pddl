(define
(problem foo_6_3_10)
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
j9 - jug
)
(:init
(= (capacity j0) 16)
(= (amount j0) 0)
(= (capacity j1) 18)
(= (amount j1) 0)
(= (capacity j2) 6)
(= (amount j2) 0)
(= (capacity j3) 4)
(= (amount j3) 0)
(= (capacity j4) 22)
(= (amount j4) 0)
(= (capacity j5) 8)
(= (amount j5) 0)
(= (capacity j6) 30)
(= (amount j6) 0)
(= (capacity j7) 24)
(= (amount j7) 0)
(= (capacity j8) 30)
(= (amount j8) 0)
(= (capacity j9) 13)
(= (amount j9) 0)
)
(:goal
 (and
(= (amount j0) 2)
(= (amount j1) 6)
(= (amount j2) 2)
(= (amount j3) 2)
(= (amount j4) 2)
(= (amount j5) 2)
(= (amount j6) 6)
(= (amount j7) 6)
(= (amount j8) 1)
(= (amount j9) 1)
)
)
