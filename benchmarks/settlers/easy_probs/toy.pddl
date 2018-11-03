(define (problem settlers)
(:domain civ)
(:objects
	location0 - place
	location1 - place
	location2 - place
	vehicle0 - vehicle
	vehicle1 - vehicle
	vehicle2 - vehicle
)
(:init
	(= (space-in vehicle0) 40)
	(= (available wood vehicle0) 0)
	(= (available timber vehicle0) 0)
	(= (available ore vehicle0) 0)
	(= (available stone vehicle0) 0)
	(= (available iron vehicle0) 0)
	(= (available coal vehicle0) 0)

	(= (space-in vehicle1) 40)
	(= (available wood vehicle1) 0)
	(= (available timber vehicle1) 0)
	(= (available ore vehicle1) 0)
	(= (available stone vehicle1) 0)
	(= (available iron vehicle1) 0)
	(= (available coal vehicle1) 0)
	
	(= (space-in vehicle2) 40)
    (= (available wood vehicle2) 0)
	(= (available timber vehicle2) 0)
	(= (available ore vehicle2) 0)
	(= (available stone vehicle2) 0)
	(= (available iron vehicle2) 0)
	(= (available coal vehicle2) 0)

	(= (resource-use) 0)
	(= (labour) 0)
	(= (pollution) 0)

	(mountain location0)
	(woodland location0)
	(by-coast location0)
	(= (housing location0) 0)
	(= (available wood location0) 0)
	(= (available timber location0) 0)
	(= (available ore location0) 0)
	(= (available stone location0) 0)
	(= (available iron location0) 0)
	(= (available coal location0) 0)

	(woodland location1)
    (by-coast location1)
	(metalliferous location1)
	(= (housing location1) 0)
	(= (available wood location1) 0)
	(= (available timber location1) 0)
	(= (available ore location1) 0)
	(= (available stone location1) 0)
	(= (available iron location1) 0)
	(= (available coal location1) 0)
	
    (woodland location2)
	(by-coast location2)
	(= (housing location2) 0)
	(= (available wood location2) 0)
	(= (available timber location2) 0)
	(= (available ore location2) 0)
	(= (available stone location2) 0)
	(= (available iron location2) 0)
	(= (available coal location2) 0)

	(connected-by-land location1 location2)
	(connected-by-land location2 location1)
	(connected-by-land location2 location0)
	(connected-by-land location0 location2)

	(potential vehicle0)
	(potential vehicle1)
	(potential vehicle2)
)
(:goal (and
	(>= (housing location0) 1)
	)
)
)
