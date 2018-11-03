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
	cell7 - place
	cell8 - place
	cell9 - place
	)
(:init
	(= (at person1) cell5)
	(= (at person2) cell5)
	(= (at person3) cell6)

	(= (items cell1) 0)
	(= (items cell2) 0)
	(= (items cell3) 1)
	(= (items cell4) 0)
	(= (items cell5) 3)
	(= (items cell6) 0)
	(= (items cell7) 0)
	(= (items cell8) 0)
	(= (items cell9) 0)

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
 
	(neighbour cell4 cell7)
	(neighbour cell7 cell4)
 
	(neighbour cell5 cell8)
	(neighbour cell8 cell5)
 
	(neighbour cell6 cell9)
	(neighbour cell9 cell6)
 
	(neighbour cell7 cell8)
	(neighbour cell8 cell7)
 
	(neighbour cell8 cell9)
	(neighbour cell9 cell8)
)

(:goal (and
	(= (items cell9) 4)
	))
)
