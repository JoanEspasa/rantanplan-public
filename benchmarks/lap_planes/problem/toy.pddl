(define (problem lap-planes-toy)
(:domain LAP-PLANES)
(:objects
	plane1 - aircraft

    person1 - person

	city1 - city
	city2 - city
	)
(:init
	(at plane1 city1)

	(= (capacity plane1) 1000)
	(= (fuel plane1) 1000)
	(= (seats plane1) 2)
	(= (onboard plane1) 0)

    (at person1 city1)

	(= (distance city1 city2) 899)
	(= (distance city2 city1) 899)
)
(:goal (and
	(in person1 plane1)
	;(at person1 city2)
	))
)
