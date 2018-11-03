(define
(problem foo_20_10_3)
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
(= (capacity j0) 1)
(= (amount j0) 0)
(= (capacity j1) 14)
(= (amount j1) 0)
(= (capacity j2) 7)
(= (amount j2) 0)
(= (capacity j3) 3)
(= (amount j3) 0)
(= (capacity j4) 12)
(= (amount j4) 0)
(= (capacity j5) 6)
(= (amount j5) 0)
(= (capacity j6) 4)
(= (amount j6) 0)
(= (capacity j7) 14)
(= (amount j7) 0)
(= (capacity j8) 6)
(= (amount j8) 0)
(= (capacity j9) 17)
(= (amount j9) 0)
)
(:goal
 (and
(= (amount j0) 1)
(= (amount j1) 7)
(= (amount j2) 1)
(= (amount j3) 3)
(= (amount j4) 6)
(= (amount j5) 2)
(= (amount j6) 2)
(= (amount j7) 2)
(= (amount j8) 1)
(= (amount j9) 1)
)
)
