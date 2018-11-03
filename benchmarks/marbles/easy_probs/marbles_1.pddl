(define (problem marbles1)
(:domain marbles)
(:objects
	person1 - person
	person2 - person

	cell1 - place
	cell2 - place
	cell3 - place
	)
(:init
	(at person1 cell1)
	(at person2 cell1)

	(= (items cell1) 2)
	(= (items cell2) 1)
	(= (items cell3) 0)

	(neighbour cell1 cell2)
	(neighbour cell2 cell1)

	(neighbour cell2 cell3)
	(neighbour cell3 cell2)
)

(:goal (and
	(= (items cell3) 3)
	))
)
