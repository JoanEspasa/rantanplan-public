(define (problem depotprob1818) (:domain Depot)
(:objects
	;depot0 - Depot
	distributor0 distributor1 - Distributor
	truck0 - Truck
	pallet0 pallet1 - Pallet
	crate0 - Crate
	hoist0 hoist1 - Hoist)

(:init
	(= (at pallet0) distributor0)
	(= (at pallet1) distributor1)

	(= (at hoist0) distributor0)
	(= (at hoist1) distributor1)
	(available hoist0)
	(available hoist1)

	(= (at truck0) distributor0)
	(= (current_load truck0) 0)
	(= (load_limit truck0) 323)

	(= (at crate0) distributor0)
	(= (on crate0) pallet0)
	(= (weight crate0) 11)

	(clear crate0)
	(clear pallet1)

	(= (fuel-cost) 0)

    (= (in crate0) undefined)
    (= (lifting hoist0) undefined)
    (= (lifting hoist1) undefined)
)

(:goal (and
		(= (on crate0) pallet1)
	)
)

;(:metric minimize (fuel-cost))
)
