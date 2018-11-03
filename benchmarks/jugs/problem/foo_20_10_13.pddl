(define
(problem foo_20_10_13)
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
(= (capacity j0) 13)
(= (amount j0) 0)
(= (capacity j1) 2)
(= (amount j1) 0)
(= (capacity j2) 10)
(= (amount j2) 0)
(= (capacity j3) 4)
(= (amount j3) 0)
(= (capacity j4) 12)
(= (amount j4) 0)
(= (capacity j5) 19)
(= (amount j5) 0)
(= (capacity j6) 15)
(= (amount j6) 0)
(= (capacity j7) 17)
(= (amount j7) 0)
(= (capacity j8) 3)
(= (amount j8) 0)
(= (capacity j9) 15)
(= (amount j9) 0)
)
(:goal
 (and
(= (amount j0) 1)
(= (amount j1) 2)
(= (amount j2) 2)
(= (amount j3) 4)
(= (amount j4) 1)
(= (amount j5) 1)
(= (amount j6) 1)
(= (amount j7) 1)
(= (amount j8) 3)
(= (amount j9) 3)
)
)
