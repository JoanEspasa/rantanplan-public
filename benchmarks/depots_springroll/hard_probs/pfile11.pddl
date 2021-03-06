(define (problem depotprob8765) (:domain Depot)
(:objects
	depot0 depot1 depot2 - Depot
	distributor0 distributor1 distributor2 - Distributor
	truck0 truck1 truck2 truck3 - Truck
	pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 - Pallet
	crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 crate15 crate16 crate17 crate18 crate19 crate20 crate21 crate22 crate23 crate24 crate25 crate26 crate27 crate28 crate29 crate30 crate31 crate32 crate33 crate34 crate35 crate36 crate37 crate38 crate39 crate40 crate41 crate42 crate43 crate44 crate45 crate46 crate47 crate48 crate49 crate50 crate51 crate52 crate53 crate54 crate55 crate56 crate57 crate58 crate59 - Crate
	hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - Hoist)
(:init
	(at pallet0 depot0)
	(clear crate59)
	(at pallet1 depot1)
	(clear crate35)
	(at pallet2 depot2)
	(clear crate55)
	(at pallet3 distributor0)
	(clear crate52)
	(at pallet4 distributor1)
	(clear crate57)
	(at pallet5 distributor2)
	(clear crate58)
	(at truck0 depot2)
	(= (current_load truck0) 0)
	(= (load_limit truck0) 338)
	(at truck1 distributor0)
	(= (current_load truck1) 0)
	(= (load_limit truck1) 366)
	(at truck2 depot1)
	(= (current_load truck2) 0)
	(= (load_limit truck2) 267)
	(at truck3 depot1)
	(= (current_load truck3) 0)
	(= (load_limit truck3) 226)
	(at hoist0 depot0)
	(available hoist0)
	(at hoist1 depot1)
	(available hoist1)
	(at hoist2 depot2)
	(available hoist2)
	(at hoist3 distributor0)
	(available hoist3)
	(at hoist4 distributor1)
	(available hoist4)
	(at hoist5 distributor2)
	(available hoist5)
	(at crate0 depot1)
	(on crate0 pallet1)
	(= (weight crate0) 64)
	(at crate1 depot2)
	(on crate1 pallet2)
	(= (weight crate1) 61)
	(at crate2 depot2)
	(on crate2 crate1)
	(= (weight crate2) 79)
	(at crate3 distributor2)
	(on crate3 pallet5)
	(= (weight crate3) 29)
	(at crate4 distributor2)
	(on crate4 crate3)
	(= (weight crate4) 77)
	(at crate5 distributor2)
	(on crate5 crate4)
	(= (weight crate5) 19)
	(at crate6 depot2)
	(on crate6 crate2)
	(= (weight crate6) 98)
	(at crate7 depot2)
	(on crate7 crate6)
	(= (weight crate7) 60)
	(at crate8 depot1)
	(on crate8 crate0)
	(= (weight crate8) 58)
	(at crate9 depot2)
	(on crate9 crate7)
	(= (weight crate9) 96)
	(at crate10 depot2)
	(on crate10 crate9)
	(= (weight crate10) 17)
	(at crate11 distributor1)
	(on crate11 pallet4)
	(= (weight crate11) 19)
	(at crate12 distributor0)
	(on crate12 pallet3)
	(= (weight crate12) 82)
	(at crate13 distributor2)
	(on crate13 crate5)
	(= (weight crate13) 97)
	(at crate14 distributor1)
	(on crate14 crate11)
	(= (weight crate14) 76)
	(at crate15 depot2)
	(on crate15 crate10)
	(= (weight crate15) 30)
	(at crate16 distributor2)
	(on crate16 crate13)
	(= (weight crate16) 88)
	(at crate17 distributor0)
	(on crate17 crate12)
	(= (weight crate17) 88)
	(at crate18 depot1)
	(on crate18 crate8)
	(= (weight crate18) 34)
	(at crate19 depot0)
	(on crate19 pallet0)
	(= (weight crate19) 63)
	(at crate20 distributor1)
	(on crate20 crate14)
	(= (weight crate20) 9)
	(at crate21 depot0)
	(on crate21 crate19)
	(= (weight crate21) 100)
	(at crate22 distributor0)
	(on crate22 crate17)
	(= (weight crate22) 21)
	(at crate23 distributor1)
	(on crate23 crate20)
	(= (weight crate23) 44)
	(at crate24 depot2)
	(on crate24 crate15)
	(= (weight crate24) 89)
	(at crate25 depot0)
	(on crate25 crate21)
	(= (weight crate25) 20)
	(at crate26 depot2)
	(on crate26 crate24)
	(= (weight crate26) 80)
	(at crate27 distributor0)
	(on crate27 crate22)
	(= (weight crate27) 73)
	(at crate28 distributor1)
	(on crate28 crate23)
	(= (weight crate28) 98)
	(at crate29 distributor1)
	(on crate29 crate28)
	(= (weight crate29) 49)
	(at crate30 distributor1)
	(on crate30 crate29)
	(= (weight crate30) 38)
	(at crate31 depot1)
	(on crate31 crate18)
	(= (weight crate31) 14)
	(at crate32 depot0)
	(on crate32 crate25)
	(= (weight crate32) 69)
	(at crate33 depot0)
	(on crate33 crate32)
	(= (weight crate33) 92)
	(at crate34 distributor0)
	(on crate34 crate27)
	(= (weight crate34) 18)
	(at crate35 depot1)
	(on crate35 crate31)
	(= (weight crate35) 13)
	(at crate36 depot0)
	(on crate36 crate33)
	(= (weight crate36) 36)
	(at crate37 distributor0)
	(on crate37 crate34)
	(= (weight crate37) 34)
	(at crate38 distributor1)
	(on crate38 crate30)
	(= (weight crate38) 72)
	(at crate39 distributor0)
	(on crate39 crate37)
	(= (weight crate39) 34)
	(at crate40 distributor0)
	(on crate40 crate39)
	(= (weight crate40) 16)
	(at crate41 distributor2)
	(on crate41 crate16)
	(= (weight crate41) 64)
	(at crate42 depot2)
	(on crate42 crate26)
	(= (weight crate42) 91)
	(at crate43 distributor2)
	(on crate43 crate41)
	(= (weight crate43) 56)
	(at crate44 depot0)
	(on crate44 crate36)
	(= (weight crate44) 5)
	(at crate45 depot2)
	(on crate45 crate42)
	(= (weight crate45) 61)
	(at crate46 distributor1)
	(on crate46 crate38)
	(= (weight crate46) 83)
	(at crate47 distributor0)
	(on crate47 crate40)
	(= (weight crate47) 69)
	(at crate48 distributor0)
	(on crate48 crate47)
	(= (weight crate48) 75)
	(at crate49 distributor2)
	(on crate49 crate43)
	(= (weight crate49) 53)
	(at crate50 distributor0)
	(on crate50 crate48)
	(= (weight crate50) 14)
	(at crate51 depot2)
	(on crate51 crate45)
	(= (weight crate51) 20)
	(at crate52 distributor0)
	(on crate52 crate50)
	(= (weight crate52) 77)
	(at crate53 depot2)
	(on crate53 crate51)
	(= (weight crate53) 6)
	(at crate54 depot2)
	(on crate54 crate53)
	(= (weight crate54) 29)
	(at crate55 depot2)
	(on crate55 crate54)
	(= (weight crate55) 8)
	(at crate56 distributor1)
	(on crate56 crate46)
	(= (weight crate56) 93)
	(at crate57 distributor1)
	(on crate57 crate56)
	(= (weight crate57) 38)
	(at crate58 distributor2)
	(on crate58 crate49)
	(= (weight crate58) 8)
	(at crate59 depot0)
	(on crate59 crate44)
	(= (weight crate59) 70)
	(= (fuel-cost) 0)
)

(:goal (and
		(on crate0 crate47)
		(on crate2 crate58)
		(on crate3 crate9)
		(on crate5 crate35)
		(on crate6 crate18)
		(on crate7 crate24)
		(on crate8 crate53)
		(on crate9 crate51)
		(on crate10 crate15)
		(on crate11 crate41)
		(on crate12 crate54)
		(on crate13 crate29)
		(on crate14 crate56)
		(on crate15 crate27)
		(on crate18 crate34)
		(on crate19 crate32)
		(on crate20 crate8)
		(on crate21 crate0)
		(on crate22 crate7)
		(on crate23 crate3)
		(on crate24 crate46)
		(on crate25 pallet3)
		(on crate26 crate38)
		(on crate27 crate2)
		(on crate29 crate42)
		(on crate30 crate5)
		(on crate31 crate25)
		(on crate32 pallet4)
		(on crate34 crate40)
		(on crate35 crate12)
		(on crate37 crate20)
		(on crate38 crate31)
		(on crate39 crate30)
		(on crate40 pallet2)
		(on crate41 crate6)
		(on crate42 crate49)
		(on crate43 crate10)
		(on crate44 crate19)
		(on crate45 crate57)
		(on crate46 crate14)
		(on crate47 crate55)
		(on crate48 crate22)
		(on crate49 pallet5)
		(on crate51 crate13)
		(on crate52 crate26)
		(on crate53 crate44)
		(on crate54 pallet0)
		(on crate55 crate52)
		(on crate56 crate43)
		(on crate57 crate37)
		(on crate58 pallet1)
		(on crate59 crate11)
	)
)

;(:metric minimize (total-time))
)
