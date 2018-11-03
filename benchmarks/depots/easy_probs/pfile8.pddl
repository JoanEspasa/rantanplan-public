(define (problem depotprob4321) (:domain Depot)
(:objects
	depot0 - Depot
	distributor0 distributor1 - Distributor
	truck0 truck1 - Truck
	pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 - Pallet
	crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 - Crate
	hoist0 hoist1 hoist2 - Hoist)
(:init
	(at pallet0 depot0)
	(clear crate2)
	(at pallet1 distributor0)
	(clear crate6)
	(at pallet2 distributor1)
	(clear crate9)
	(at pallet3 distributor1)
	(clear crate7)
	(at pallet4 distributor0)
	(clear crate0)
	(at pallet5 distributor0)
	(clear crate8)
	(at truck0 distributor0)
	(= (current_load truck0) 0)
	(= (load_limit truck0) 477)
	(at truck1 distributor0)
	(= (current_load truck1) 0)
	(= (load_limit truck1) 342)
	(at hoist0 depot0)
	(available hoist0)
	(at hoist1 distributor0)
	(available hoist1)
	(at hoist2 distributor1)
	(available hoist2)
	(at crate0 distributor0)
	(on crate0 pallet4)
	(= (weight crate0) 100)
	(at crate1 distributor0)
	(on crate1 pallet1)
	(= (weight crate1) 23)
	(at crate2 depot0)
	(on crate2 pallet0)
	(= (weight crate2) 28)
	(at crate3 distributor0)
	(on crate3 pallet5)
	(= (weight crate3) 41)
	(at crate4 distributor1)
	(on crate4 pallet3)
	(= (weight crate4) 2)
	(at crate5 distributor0)
	(on crate5 crate1)
	(= (weight crate5) 89)
	(at crate6 distributor0)
	(on crate6 crate5)
	(= (weight crate6) 9)
	(at crate7 distributor1)
	(on crate7 crate4)
	(= (weight crate7) 18)
	(at crate8 distributor0)
	(on crate8 crate3)
	(= (weight crate8) 79)
	(at crate9 distributor1)
	(on crate9 pallet2)
	(= (weight crate9) 43)
	(= (fuel-cost) 0)
)

(:goal (and
		(on crate0 pallet3)
		(on crate1 crate0)
		(on crate3 crate8)
		(on crate6 pallet2)
		(on crate7 pallet1)
		(on crate8 pallet4)
		(on crate9 pallet0)
	)
)

;(:metric minimize (total-time))

)
