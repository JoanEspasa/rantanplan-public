(define (problem planes4)
(:domain LAP-PLANES)
(:objects
	plane1 - aircraft

	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person

	city1 - city
	city2 - city
	city3 - city
	city4 - city
	city5 - city
	city6 - city
	)
(:init
	(at plane1 city1)
	(= (capacity plane1) 2000)
	(= (fuel plane1) 2000)
	(= (seats plane1) 3)
	(= (onboard plane1) 0)

	(at person1 city1)
	(at person2 city2)
	(at person3 city1)
	(at person4 city3)
	(at person5 city4)
	(at person6 city5)

	(= (distance city1 city1) 0)
	(= (distance city1 city2) 899)
	(= (distance city1 city3) 529)
	(= (distance city1 city4) 649)
	(= (distance city1 city5) 456)
	(= (distance city1 city6) 123)
	(= (distance city2 city1) 899)
	(= (distance city2 city2) 0)
	(= (distance city2 city3) 722)
	(= (distance city2 city4) 341)
	(= (distance city2 city5) 789)
	(= (distance city2 city6) 321)
	(= (distance city3 city1) 529)
	(= (distance city3 city2) 722)
	(= (distance city3 city3) 0)
	(= (distance city3 city4) 663)
	(= (distance city3 city5) 546)
	(= (distance city3 city6) 965)
	(= (distance city4 city1) 649)
	(= (distance city4 city2) 341)
	(= (distance city4 city3) 663)
	(= (distance city4 city4) 0)
	(= (distance city4 city5) 324)
	(= (distance city4 city6) 671)
	(= (distance city5 city1) 456)
	(= (distance city5 city2) 789)
	(= (distance city5 city3) 546)
	(= (distance city5 city4) 324)
	(= (distance city5 city5) 0)
	(= (distance city5 city6) 333)
	(= (distance city6 city1) 123)
	(= (distance city6 city2) 321)
	(= (distance city6 city3) 965)
	(= (distance city6 city4) 671)
	(= (distance city6 city5) 333)
	(= (distance city6 city6) 0)
)
(:goal (and
	(at person1 city6)
	(at person2 city6)
	(at person3 city6)
	(at person4 city6)
	(at person5 city6)
	(at person6 city6)
	))
)
