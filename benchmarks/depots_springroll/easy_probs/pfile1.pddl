(define (problem depotprob1818) (:domain Depot)
(:objects
	depot0 - Depot
	distributor0 distributor1 - Distributor
	truck0 truck1 - Truck
	pallet0 pallet1 pallet2 - Pallet
	crate0 crate1 - Crate
	hoist0 hoist1 hoist2 - Hoist)
(:init
	(at_ pallet0 depot0)
	(clear crate1)
	(at_ pallet1 distributor0)
	(clear crate0)
	(at_ pallet2 distributor1)
	(clear pallet2)
	(at_ truck0 distributor1)
	(= (current_load truck0) 0)
	(= (load_limit truck0) 323)
	(at_ truck1 depot0)
	(= (current_load truck1) 0)
	(= (load_limit truck1) 220)
	(at_ hoist0 depot0)
	(available hoist0)
	(at_ hoist1 distributor0)
	(available hoist1)
	(at_ hoist2 distributor1)
	(available hoist2)
	(at_ crate0 distributor0)
	(on crate0 pallet1)
	(= (weight crate0) 11)
	(at_ crate1 depot0)
	(on crate1 pallet0)
	(= (weight crate1) 86)
	(= (fuel-cost) 0)
)

(:goal (and
		(on crate0 pallet2)
		(on crate1 pallet1)
	)
)

(:metric minimize (fuel-cost)))
