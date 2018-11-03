(define (problem depotprob1818) (:domain Depot)
(:objects
	depot0 - Depot
	distributor0 distributor1 - Distributor
	truck0 truck1 - Truck
	pallet0 pallet1 pallet2 - Pallet
	crate0 crate1 - Crate
	hoist0 hoist1 hoist2 - Hoist)

;%s%(at \([a-zA-Z0-9]\{3,6\}\)%\="(= ".submatch(0).") "%g
;%s%(on \([a-zA-Z0-9]\{3,6\}\)%\="(= ".submatch(0).") "%g

(:init
	(= (at pallet0) depot0)
	(= (at pallet1) distributor0)
	(= (at pallet2) distributor1)

	(= (at truck0) distributor1)
	(= (at truck1) depot0)
	(= (current_load truck0) 0)
	(= (current_load truck1) 0)
	(= (load_limit truck0) 323)
	(= (load_limit truck1) 220)

	(= (at hoist0) depot0)
	(= (at hoist1) distributor0)
	(= (at hoist2) distributor1)

	(available hoist0)
	(available hoist1)
	(available hoist2)

	(= (at crate0) distributor0)
	(= (at crate1) depot0)
	(= (on crate0) pallet1)
	(= (on crate1) pallet0)
	(= (weight crate0) 11)
	(= (weight crate1) 86)

	(clear crate1)
	(clear crate0)
	(clear pallet2)

	(= (fuel-cost) 0)

    (= (in crate0) undefined)
    (= (in crate1) undefined)
    (= (lifting hoist0) undefined)
    (= (lifting hoist1) undefined)
    (= (lifting hoist2) undefined)
)

(:goal (and
		(= (on crate0) pallet2)
		(= (on crate1) pallet1)
	)
)

(:metric minimize (fuel-cost))
)
