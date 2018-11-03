(define (problem settlers)
(:domain civ)
(:objects
	location0 - place
	location1 - place
	location2 - place
	location3 - place
	location4 - place
	location5 - place
	location6 - place
	location7 - place
	location8 - place
	location9 - place
	location10 - place
	location11 - place
	vehicle0 - vehicle
	vehicle1 - vehicle
	vehicle2 - vehicle
	vehicle3 - vehicle
	vehicle4 - vehicle
	vehicle5 - vehicle
	vehicle6 - vehicle
	vehicle7 - vehicle
	vehicle8 - vehicle
	vehicle9 - vehicle
)
(:init
	(= (resource-use) 0)
	(= (labour) 0)
	(= (pollution) 0)
	(mountain location0)
	(woodland location0)
	(= (housing location0) 0)
	(= (available wood location0) 0)
	(= (available timber location0) 0)
	(= (available ore location0) 0)
	(= (available stone location0) 0)
	(= (available iron location0) 0)
	(= (available coal location0) 0)
	(mountain location1)
	(woodland location1)
	(= (housing location1) 0)
	(= (available wood location1) 0)
	(= (available timber location1) 0)
	(= (available ore location1) 0)
	(= (available stone location1) 0)
	(= (available iron location1) 0)
	(= (available coal location1) 0)
	(mountain location2)
	(woodland location2)
	(by-coast location2)
	(metalliferous location2)
	(= (housing location2) 0)
	(= (available wood location2) 0)
	(= (available timber location2) 0)
	(= (available ore location2) 0)
	(= (available stone location2) 0)
	(= (available iron location2) 0)
	(= (available coal location2) 0)
	(woodland location3)
	(= (housing location3) 0)
	(= (available wood location3) 0)
	(= (available timber location3) 0)
	(= (available ore location3) 0)
	(= (available stone location3) 0)
	(= (available iron location3) 0)
	(= (available coal location3) 0)
	(by-coast location4)
	(metalliferous location4)
	(= (housing location4) 0)
	(= (available wood location4) 0)
	(= (available timber location4) 0)
	(= (available ore location4) 0)
	(= (available stone location4) 0)
	(= (available iron location4) 0)
	(= (available coal location4) 0)
	(mountain location5)
	(by-coast location5)
	(= (housing location5) 0)
	(= (available wood location5) 0)
	(= (available timber location5) 0)
	(= (available ore location5) 0)
	(= (available stone location5) 0)
	(= (available iron location5) 0)
	(= (available coal location5) 0)
	(mountain location6)
	(woodland location6)
	(metalliferous location6)
	(= (housing location6) 0)
	(= (available wood location6) 0)
	(= (available timber location6) 0)
	(= (available ore location6) 0)
	(= (available stone location6) 0)
	(= (available iron location6) 0)
	(= (available coal location6) 0)
	(= (housing location7) 0)
	(= (available wood location7) 0)
	(= (available timber location7) 0)
	(= (available ore location7) 0)
	(= (available stone location7) 0)
	(= (available iron location7) 0)
	(= (available coal location7) 0)
	(woodland location8)
	(by-coast location8)
	(metalliferous location8)
	(= (housing location8) 0)
	(= (available wood location8) 0)
	(= (available timber location8) 0)
	(= (available ore location8) 0)
	(= (available stone location8) 0)
	(= (available iron location8) 0)
	(= (available coal location8) 0)
	(by-coast location9)
	(= (housing location9) 0)
	(= (available wood location9) 0)
	(= (available timber location9) 0)
	(= (available ore location9) 0)
	(= (available stone location9) 0)
	(= (available iron location9) 0)
	(= (available coal location9) 0)
	(woodland location10)
	(= (housing location10) 0)
	(= (available wood location10) 0)
	(= (available timber location10) 0)
	(= (available ore location10) 0)
	(= (available stone location10) 0)
	(= (available iron location10) 0)
	(= (available coal location10) 0)
	(mountain location11)
	(woodland location11)
	(by-coast location11)
	(metalliferous location11)
	(= (housing location11) 0)
	(= (available wood location11) 0)
	(= (available timber location11) 0)
	(= (available ore location11) 0)
	(= (available stone location11) 0)
	(= (available iron location11) 0)
	(= (available coal location11) 0)
	(connected-by-land location0 location1)
	(connected-by-land location1 location0)
	(connected-by-land location0 location10)
	(connected-by-land location10 location0)
	(connected-by-land location1 location2)
	(connected-by-land location2 location1)
	(connected-by-land location1 location3)
	(connected-by-land location3 location1)
	(connected-by-land location1 location4)
	(connected-by-land location4 location1)
	(connected-by-land location2 location5)
	(connected-by-land location5 location2)
	(connected-by-land location2 location7)
	(connected-by-land location7 location2)
	(connected-by-land location2 location8)
	(connected-by-land location8 location2)
	(connected-by-land location2 location9)
	(connected-by-land location9 location2)
	(connected-by-land location2 location10)
	(connected-by-land location10 location2)
	(connected-by-land location2 location11)
	(connected-by-land location11 location2)
	(connected-by-land location3 location0)
	(connected-by-land location0 location3)
	(connected-by-land location3 location2)
	(connected-by-land location2 location3)
	(connected-by-land location3 location9)
	(connected-by-land location9 location3)
	(connected-by-land location3 location11)
	(connected-by-land location11 location3)
	(connected-by-land location4 location0)
	(connected-by-land location0 location4)
	(connected-by-land location5 location0)
	(connected-by-land location0 location5)
	(connected-by-land location5 location1)
	(connected-by-land location1 location5)
	(connected-by-land location5 location3)
	(connected-by-land location3 location5)
	(connected-by-land location5 location4)
	(connected-by-land location4 location5)
	(connected-by-land location6 location0)
	(connected-by-land location0 location6)
	(connected-by-land location6 location2)
	(connected-by-land location2 location6)
	(connected-by-land location6 location3)
	(connected-by-land location3 location6)
	(connected-by-land location7 location4)
	(connected-by-land location4 location7)
	(connected-by-land location7 location8)
	(connected-by-land location8 location7)
	(connected-by-land location8 location5)
	(connected-by-land location5 location8)
	(connected-by-land location8 location10)
	(connected-by-land location10 location8)
	(connected-by-land location9 location5)
	(connected-by-land location5 location9)
	(connected-by-land location9 location6)
	(connected-by-land location6 location9)
	(connected-by-land location9 location7)
	(connected-by-land location7 location9)
	(connected-by-land location10 location1)
	(connected-by-land location1 location10)
	(connected-by-land location10 location3)
	(connected-by-land location3 location10)
	(connected-by-land location10 location11)
	(connected-by-land location11 location10)
	(connected-by-land location11 location4)
	(connected-by-land location4 location11)
	(connected-by-land location11 location8)
	(connected-by-land location8 location11)
	(connected-by-sea location4 location8)
	(connected-by-sea location8 location4)
	(connected-by-sea location4 location9)
	(connected-by-sea location9 location4)
	(connected-by-sea location4 location11)
	(connected-by-sea location11 location4)
	(connected-by-sea location8 location9)
	(connected-by-sea location9 location8)
	(connected-by-sea location8 location11)
	(connected-by-sea location11 location8)
	(connected-by-sea location9 location11)
	(connected-by-sea location11 location9)
	(potential vehicle0)
	(potential vehicle1)
	(potential vehicle2)
	(potential vehicle3)
	(potential vehicle4)
	(potential vehicle5)
	(potential vehicle6)
	(potential vehicle7)
	(potential vehicle8)
	(potential vehicle9)
)
(:goal (and
	(has-sawmill location0)
	(has-coal-stack location8)
	(has-coal-stack location2)
	(>= (housing location4) 1)
	(connected-by-rail location9 location6)
	(connected-by-rail location6 location3)
	(connected-by-rail location3 location0)
	(connected-by-rail location0 location1)
	(has-ironworks location4)
	(connected-by-rail location4 location0)
	(connected-by-rail location1 location4)
	(>= (housing location0) 2)
	(>= (housing location3) 2)
	(has-ironworks location8)
	(>= (housing location1) 2)
	(has-ironworks location0)
	(has-ironworks location10)
	)
)

;(:metric minimize (+ (+ (* 0 (pollution)) (* 3 (resource-use))) (* 3 (labour))))
)
