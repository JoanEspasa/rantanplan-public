(define
(problem foo_6_3_3)
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
(= (capacity j0) 18)
(= (amount j0) 0)
(= (capacity j1) 15)
(= (amount j1) 0)
(= (capacity j2) 28)
(= (amount j2) 0)
(= (capacity j3) 20)
(= (amount j3) 0)
(= (capacity j4) 23)
(= (amount j4) 0)
(= (capacity j5) 7)
(= (amount j5) 0)
(= (capacity j6) 19)
(= (amount j6) 0)
(= (capacity j7) 21)
(= (amount j7) 0)
(= (capacity j8) 7)
(= (amount j8) 0)
(= (capacity j9) 15)
(= (amount j9) 0)
)
(:goal
 (and
(= (amount j0) 3)
(= (amount j1) 1)
(= (amount j2) 4)
(= (amount j3) 1)
(= (amount j4) 1)
(= (amount j5) 1)
(= (amount j6) 1)
(= (amount j7) 7)
(= (amount j8) 1)
(= (amount j9) 1)
)
)
