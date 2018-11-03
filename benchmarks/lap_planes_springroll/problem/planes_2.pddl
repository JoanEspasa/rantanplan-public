(define (problem planes2)
(:domain LAP-PLANES)
(:objects
	plane1 - aircraft

	person1 - person
	person2 - person
	person3 - person
	person4 - person

	city1 - city
	city2 - city
	city3 - city
	city4 - city
	city5 - city
	)
(:init
	(at_ plane1 city1)
	(= (capacity plane1) 3000)
	(= (fuel plane1) 3000)
	(= (seats plane1) 2)
	(= (onboard plane1) 0)

	(at_ person1 city1)
	(at_ person2 city2)
	(at_ person3 city3)
	(at_ person4 city4)

	(= (distance city1 city1) 0)
	(= (distance city1 city2) 899)
	(= (distance city1 city3) 529)
	(= (distance city1 city4) 649)
	(= (distance city1 city5) 456)
	(= (distance city2 city1) 899)
	(= (distance city2 city2) 0)
	(= (distance city2 city3) 722)
	(= (distance city2 city4) 341)
	(= (distance city2 city5) 789)
	(= (distance city3 city1) 529)
	(= (distance city3 city2) 722)
	(= (distance city3 city3) 0)
	(= (distance city3 city4) 663)
	(= (distance city3 city5) 546)
	(= (distance city4 city1) 649)
	(= (distance city4 city2) 341)
	(= (distance city4 city3) 663)
	(= (distance city4 city4) 0)
	(= (distance city4 city5) 324)
	(= (distance city5 city1) 456)
	(= (distance city5 city2) 789)
	(= (distance city5 city3) 546)
	(= (distance city5 city4) 324)
	(= (distance city5 city5) 0)
)
(:goal (and
	(at_ person1 city5)
	(at_ person2 city5)
	(at_ person3 city5)
	(at_ person4 city5)
	))
)
