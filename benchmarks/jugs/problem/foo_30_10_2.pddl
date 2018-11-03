(define
(problem foo_30_10_2)
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
(= (capacity j0) 12)
(= (amount j0) 0)
(= (capacity j1) 28)
(= (amount j1) 0)
(= (capacity j2) 16)
(= (amount j2) 0)
(= (capacity j3) 5)
(= (amount j3) 0)
(= (capacity j4) 21)
(= (amount j4) 0)
(= (capacity j5) 17)
(= (amount j5) 0)
(= (capacity j6) 2)
(= (amount j6) 0)
(= (capacity j7) 16)
(= (amount j7) 0)
(= (capacity j8) 4)
(= (amount j8) 0)
(= (capacity j9) 2)
(= (amount j9) 0)
)
(:goal
 (and
(= (amount j0) 4)
(= (amount j1) 4)
(= (amount j2) 1)
(= (amount j3) 1)
(= (amount j4) 1)
(= (amount j5) 1)
(= (amount j6) 2)
(= (amount j7) 4)
(= (amount j8) 2)
(= (amount j9) 2)
)
)
