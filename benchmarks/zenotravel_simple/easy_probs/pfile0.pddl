(define (problem ZTRAVEL-1-2)
(:domain zeno-travel)
(:objects
	plane1 - aircraft
	city0 - city
	city1 - city
	)
(:init
	(at_ plane1 city0)
	(= (capacity plane1) 10232)
	(= (fuel plane1) 3956)
	(= (slow-burn plane1) 4)
	(= (onboard plane1) 0)
	(= (distance city0 city0) 0)
	(= (distance city0 city1) 678)
	(= (distance city1 city0) 678)
	(= (distance city1 city1) 0)
)
(:goal (and
	(at_ plane1 city1)
	))

)
