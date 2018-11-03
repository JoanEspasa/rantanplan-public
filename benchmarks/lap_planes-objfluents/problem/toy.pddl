(define (problem planes1)
(:domain lap_planes)
(:objects
	plane1 - aircraft

	person1 - person
	person2 - person

	city1 - city
	)
(:init
	(= (at plane1) city1)
	(= (capacity plane1) 6000)
	(= (fuel plane1) 6000)
	(= (seats plane1) 1)
	(= (onboard plane1) 0)

	(= (at person1) city1)
	(= (at person2) city1)

	(= (in person1) undefined)
	(= (in person2) undefined)

)
(:goal (and
	(= (in person1) plane1)
	(= (in person2) plane1)
	))
)
