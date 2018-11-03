(define (problem ZTRAVEL-2-6)
(:domain zeno-travel)
(:objects
	plane1 - aircraft

    person1 - person

	city1 - city
	city2 - city
	)
(:init
	(= (at plane1) city1)

	(= (capacity plane1) 1000)
	(= (fuel plane1) 1000)
	(= (seats plane1) 2)
	(= (onboard plane1) 1)

    (= (at person1) undefined)

    (= (in person1) plane1)

	(= (distance city1 city2) 100)
	(= (distance city2 city1) 100)
)
(:goal (and
	(= (at plane1) city2)
	(= (at person1) city1)
	))
)
