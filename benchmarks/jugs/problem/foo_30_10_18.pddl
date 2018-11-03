(define
(problem foo_30_10_18)
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
(= (capacity j0) 22)
(= (amount j0) 0)
(= (capacity j1) 7)
(= (amount j1) 0)
(= (capacity j2) 28)
(= (amount j2) 0)
(= (capacity j3) 26)
(= (amount j3) 0)
(= (capacity j4) 25)
(= (amount j4) 0)
(= (capacity j5) 29)
(= (amount j5) 0)
(= (capacity j6) 17)
(= (amount j6) 0)
(= (capacity j7) 22)
(= (amount j7) 0)
(= (capacity j8) 18)
(= (amount j8) 0)
(= (capacity j9) 10)
(= (amount j9) 0)
)
(:goal
 (and
(= (amount j0) 1)
(= (amount j1) 7)
(= (amount j2) 2)
(= (amount j3) 1)
(= (amount j4) 1)
(= (amount j5) 1)
(= (amount j6) 1)
(= (amount j7) 2)
(= (amount j8) 2)
(= (amount j9) 2)
)
)
