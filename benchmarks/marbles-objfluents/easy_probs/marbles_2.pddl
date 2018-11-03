(define (problem marbles1)
(:domain marbles)
(:objects
	person1 - person
	person2 - person
	person3 - person

	cell1 - place
	cell2 - place
	cell3 - place
	cell4 - place
	cell5 - place
	cell6 - place
	)
(:init
	(= (at person1) cell1)
	(= (at person2) cell1)
	(= (at person3) cell5)

	(= (items cell1) 0)
	(= (items cell2) 1)
	(= (items cell3) 0)
	(= (items cell4) 2)
	(= (items cell5) 1)
	(= (items cell6) 0)

	(neighbour cell1 cell2)
	(neighbour cell2 cell1)

	(neighbour cell2 cell3)
	(neighbour cell3 cell2)

	(neighbour cell4 cell1)
	(neighbour cell1 cell4)
 
	(neighbour cell2 cell5)
	(neighbour cell5 cell2)
 
	(neighbour cell3 cell6)
	(neighbour cell6 cell3)
 
	(neighbour cell4 cell5)
	(neighbour cell5 cell4)
 
	(neighbour cell5 cell6)
	(neighbour cell6 cell5)
)

(:goal (and
	(= (items cell6) 4)
	))
)
