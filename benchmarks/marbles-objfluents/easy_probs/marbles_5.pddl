(define (problem marbles1)
(:domain marbles)
(:objects
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person

	cell1 - place
	cell2 - place
	cell3 - place
	cell4 - place
	cell5 - place
	cell6 - place
	cell7 - place
	cell8 - place
	cell9 - place
	cell10 - place
	cell11 - place
	cell12 - place
	cell13 - place
	cell14 - place
	cell15 - place
)
(:init
	(= (at person1) cell5)
	(= (at person2) cell5)
	(= (at person3) cell6)
	(= (at person4) cell7)
	(= (at person5) cell7)

	(= (items cell1) 0)
	(= (items cell2) 2)
	(= (items cell3) 0)
	(= (items cell4) 0)
	(= (items cell5) 0)
	(= (items cell6) 1)
	(= (items cell7) 0)
	(= (items cell8) 1)
	(= (items cell9) 2)
	(= (items cell10) 0)
	(= (items cell11) 0)
	(= (items cell12) 0)
	(= (items cell13) 0)
	(= (items cell14) 1)
	(= (items cell15) 1)

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

	(neighbour cell7 cell10)
	(neighbour cell10 cell7)

	(neighbour cell8 cell11)
	(neighbour cell11 cell8)

	(neighbour cell9 cell12)
	(neighbour cell12 cell9)

	(neighbour cell10 cell11)
	(neighbour cell11 cell10)

	(neighbour cell11 cell12)
	(neighbour cell12 cell11)

	(neighbour cell3 cell13)
	(neighbour cell13 cell3)

	(neighbour cell6 cell14)
	(neighbour cell14 cell6)

	(neighbour cell9 cell15)
	(neighbour cell15 cell9)

	(neighbour cell13 cell14)
	(neighbour cell14 cell13)

	(neighbour cell14 cell15)
	(neighbour cell15 cell14)
)

(:goal (and
	(= (items cell12) 3)
	(= (items cell13) 2)
	(= (items cell1) 3)
	))
)
