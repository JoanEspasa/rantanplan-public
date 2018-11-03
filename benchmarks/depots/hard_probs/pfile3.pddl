(define (problem depotprob1935) (:domain Depot)
(:objects
	depot0 depot1 depot2 depot3 depot4 depot5 depot6 depot7 depot8 depot9 - Depot
	distributor0 distributor1 distributor2 distributor3 distributor4 distributor5 distributor6 distributor7 distributor8 distributor9 - Distributor
	truck0 truck1 truck2 truck3 truck4 truck5 - Truck
	pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 pallet10 pallet11 pallet12 pallet13 pallet14 pallet15 pallet16 pallet17 pallet18 pallet19 pallet20 pallet21 pallet22 pallet23 pallet24 pallet25 pallet26 pallet27 pallet28 pallet29 - Pallet
	crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 crate15 crate16 crate17 crate18 crate19 crate20 crate21 crate22 crate23 crate24 crate25 crate26 crate27 crate28 crate29 crate30 crate31 crate32 crate33 crate34 crate35 crate36 crate37 crate38 crate39 crate40 crate41 crate42 crate43 crate44 crate45 crate46 crate47 crate48 crate49 crate50 crate51 crate52 crate53 crate54 crate55 crate56 crate57 crate58 crate59 - Crate
	hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 hoist8 hoist9 hoist10 hoist11 hoist12 hoist13 hoist14 hoist15 hoist16 hoist17 hoist18 hoist19 hoist20 hoist21 hoist22 hoist23 hoist24 hoist25 hoist26 hoist27 hoist28 hoist29 - Hoist)
(:init
	(at pallet0 depot0)
	(clear crate16)
	(at pallet1 depot1)
	(clear pallet1)
	(at pallet2 depot2)
	(clear crate45)
	(at pallet3 depot3)
	(clear crate14)
	(at pallet4 depot4)
	(clear crate52)
	(at pallet5 depot5)
	(clear crate56)
	(at pallet6 depot6)
	(clear crate39)
	(at pallet7 depot7)
	(clear crate55)
	(at pallet8 depot8)
	(clear crate59)
	(at pallet9 depot9)
	(clear crate51)
	(at pallet10 distributor0)
	(clear crate40)
	(at pallet11 distributor1)
	(clear crate43)
	(at pallet12 distributor2)
	(clear crate36)
	(at pallet13 distributor3)
	(clear crate57)
	(at pallet14 distributor4)
	(clear pallet14)
	(at pallet15 distributor5)
	(clear pallet15)
	(at pallet16 distributor6)
	(clear pallet16)
	(at pallet17 distributor7)
	(clear crate53)
	(at pallet18 distributor8)
	(clear crate28)
	(at pallet19 distributor9)
	(clear crate58)
	(at pallet20 depot9)
	(clear crate9)
	(at pallet21 depot1)
	(clear crate41)
	(at pallet22 distributor6)
	(clear crate42)
	(at pallet23 distributor5)
	(clear crate3)
	(at pallet24 depot2)
	(clear crate34)
	(at pallet25 depot2)
	(clear crate50)
	(at pallet26 distributor6)
	(clear crate2)
	(at pallet27 distributor7)
	(clear crate22)
	(at pallet28 distributor6)
	(clear crate47)
	(at pallet29 distributor2)
	(clear crate32)
	(at truck0 distributor4)
	(= (current_load truck0) 0)
	(= (load_limit truck0) 396)
	(at truck1 depot8)
	(= (current_load truck1) 0)
	(= (load_limit truck1) 269)
	(at truck2 distributor2)
	(= (current_load truck2) 0)
	(= (load_limit truck2) 284)
	(at truck3 depot3)
	(= (current_load truck3) 0)
	(= (load_limit truck3) 279)
	(at truck4 distributor7)
	(= (current_load truck4) 0)
	(= (load_limit truck4) 247)
	(at truck5 depot0)
	(= (current_load truck5) 0)
	(= (load_limit truck5) 266)
	(at hoist0 depot0)
	(available hoist0)
	(at hoist1 depot1)
	(available hoist1)
	(at hoist2 depot2)
	(available hoist2)
	(at hoist3 depot3)
	(available hoist3)
	(at hoist4 depot4)
	(available hoist4)
	(at hoist5 depot5)
	(available hoist5)
	(at hoist6 depot6)
	(available hoist6)
	(at hoist7 depot7)
	(available hoist7)
	(at hoist8 depot8)
	(available hoist8)
	(at hoist9 depot9)
	(available hoist9)
	(at hoist10 distributor0)
	(available hoist10)
	(at hoist11 distributor1)
	(available hoist11)
	(at hoist12 distributor2)
	(available hoist12)
	(at hoist13 distributor3)
	(available hoist13)
	(at hoist14 distributor4)
	(available hoist14)
	(at hoist15 distributor5)
	(available hoist15)
	(at hoist16 distributor6)
	(available hoist16)
	(at hoist17 distributor7)
	(available hoist17)
	(at hoist18 distributor8)
	(available hoist18)
	(at hoist19 distributor9)
	(available hoist19)
	(at hoist20 depot8)
	(available hoist20)
	(at hoist21 depot2)
	(available hoist21)
	(at hoist22 depot7)
	(available hoist22)
	(at hoist23 depot5)
	(available hoist23)
	(at hoist24 distributor0)
	(available hoist24)
	(at hoist25 depot3)
	(available hoist25)
	(at hoist26 depot5)
	(available hoist26)
	(at hoist27 depot5)
	(available hoist27)
	(at hoist28 distributor5)
	(available hoist28)
	(at hoist29 distributor6)
	(available hoist29)
	(at crate0 depot2)
	(on crate0 pallet24)
	(= (weight crate0) 46)
	(at crate1 distributor1)
	(on crate1 pallet11)
	(= (weight crate1) 96)
	(at crate2 distributor6)
	(on crate2 pallet26)
	(= (weight crate2) 26)
	(at crate3 distributor5)
	(on crate3 pallet23)
	(= (weight crate3) 75)
	(at crate4 depot1)
	(on crate4 pallet21)
	(= (weight crate4) 34)
	(at crate5 distributor8)
	(on crate5 pallet18)
	(= (weight crate5) 17)
	(at crate6 depot8)
	(on crate6 pallet8)
	(= (weight crate6) 10)
	(at crate7 depot2)
	(on crate7 pallet2)
	(= (weight crate7) 8)
	(at crate8 distributor6)
	(on crate8 pallet28)
	(= (weight crate8) 76)
	(at crate9 depot9)
	(on crate9 pallet20)
	(= (weight crate9) 34)
	(at crate10 depot2)
	(on crate10 crate0)
	(= (weight crate10) 32)
	(at crate11 depot4)
	(on crate11 pallet4)
	(= (weight crate11) 76)
	(at crate12 depot2)
	(on crate12 pallet25)
	(= (weight crate12) 59)
	(at crate13 distributor2)
	(on crate13 pallet12)
	(= (weight crate13) 27)
	(at crate14 depot3)
	(on crate14 pallet3)
	(= (weight crate14) 75)
	(at crate15 depot6)
	(on crate15 pallet6)
	(= (weight crate15) 5)
	(at crate16 depot0)
	(on crate16 pallet0)
	(= (weight crate16) 94)
	(at crate17 depot5)
	(on crate17 pallet5)
	(= (weight crate17) 60)
	(at crate18 distributor0)
	(on crate18 pallet10)
	(= (weight crate18) 89)
	(at crate19 depot6)
	(on crate19 crate15)
	(= (weight crate19) 98)
	(at crate20 depot4)
	(on crate20 crate11)
	(= (weight crate20) 5)
	(at crate21 depot4)
	(on crate21 crate20)
	(= (weight crate21) 86)
	(at crate22 distributor7)
	(on crate22 pallet27)
	(= (weight crate22) 41)
	(at crate23 depot4)
	(on crate23 crate21)
	(= (weight crate23) 24)
	(at crate24 distributor7)
	(on crate24 pallet17)
	(= (weight crate24) 88)
	(at crate25 depot5)
	(on crate25 crate17)
	(= (weight crate25) 84)
	(at crate26 distributor7)
	(on crate26 crate24)
	(= (weight crate26) 39)
	(at crate27 distributor2)
	(on crate27 pallet29)
	(= (weight crate27) 35)
	(at crate28 distributor8)
	(on crate28 crate5)
	(= (weight crate28) 45)
	(at crate29 depot5)
	(on crate29 crate25)
	(= (weight crate29) 40)
	(at crate30 distributor3)
	(on crate30 pallet13)
	(= (weight crate30) 73)
	(at crate31 distributor9)
	(on crate31 pallet19)
	(= (weight crate31) 40)
	(at crate32 distributor2)
	(on crate32 crate27)
	(= (weight crate32) 45)
	(at crate33 depot9)
	(on crate33 pallet9)
	(= (weight crate33) 84)
	(at crate34 depot2)
	(on crate34 crate10)
	(= (weight crate34) 33)
	(at crate35 distributor1)
	(on crate35 crate1)
	(= (weight crate35) 56)
	(at crate36 distributor2)
	(on crate36 crate13)
	(= (weight crate36) 95)
	(at crate37 distributor0)
	(on crate37 crate18)
	(= (weight crate37) 52)
	(at crate38 distributor6)
	(on crate38 pallet22)
	(= (weight crate38) 34)
	(at crate39 depot6)
	(on crate39 crate19)
	(= (weight crate39) 51)
	(at crate40 distributor0)
	(on crate40 crate37)
	(= (weight crate40) 33)
	(at crate41 depot1)
	(on crate41 crate4)
	(= (weight crate41) 40)
	(at crate42 distributor6)
	(on crate42 crate38)
	(= (weight crate42) 93)
	(at crate43 distributor1)
	(on crate43 crate35)
	(= (weight crate43) 69)
	(at crate44 depot2)
	(on crate44 crate7)
	(= (weight crate44) 36)
	(at crate45 depot2)
	(on crate45 crate44)
	(= (weight crate45) 57)
	(at crate46 distributor6)
	(on crate46 crate8)
	(= (weight crate46) 52)
	(at crate47 distributor6)
	(on crate47 crate46)
	(= (weight crate47) 74)
	(at crate48 distributor7)
	(on crate48 crate26)
	(= (weight crate48) 95)
	(at crate49 depot8)
	(on crate49 crate6)
	(= (weight crate49) 29)
	(at crate50 depot2)
	(on crate50 crate12)
	(= (weight crate50) 39)
	(at crate51 depot9)
	(on crate51 crate33)
	(= (weight crate51) 65)
	(at crate52 depot4)
	(on crate52 crate23)
	(= (weight crate52) 25)
	(at crate53 distributor7)
	(on crate53 crate48)
	(= (weight crate53) 68)
	(at crate54 depot5)
	(on crate54 crate29)
	(= (weight crate54) 92)
	(at crate55 depot7)
	(on crate55 pallet7)
	(= (weight crate55) 79)
	(at crate56 depot5)
	(on crate56 crate54)
	(= (weight crate56) 53)
	(at crate57 distributor3)
	(on crate57 crate30)
	(= (weight crate57) 95)
	(at crate58 distributor9)
	(on crate58 crate31)
	(= (weight crate58) 93)
	(at crate59 depot8)
	(on crate59 crate49)
	(= (weight crate59) 83)
	(= (fuel-cost) 0)
)

(:goal (and
		(on crate0 crate2)
		(on crate1 crate10)
		(on crate2 pallet3)
		(on crate5 pallet10)
		(on crate6 pallet29)
		(on crate8 pallet25)
		(on crate9 crate54)
		(on crate10 pallet8)
		(on crate11 crate1)
		(on crate13 pallet27)
		(on crate14 crate44)
		(on crate15 pallet19)
		(on crate16 crate11)
		(on crate17 crate29)
		(on crate18 crate20)
		(on crate19 crate40)
		(on crate20 pallet6)
		(on crate21 pallet2)
		(on crate22 crate5)
		(on crate24 crate43)
		(on crate25 crate56)
		(on crate29 pallet5)
		(on crate30 crate55)
		(on crate32 crate42)
		(on crate33 pallet7)
		(on crate34 pallet1)
		(on crate35 crate0)
		(on crate36 crate15)
		(on crate37 crate34)
		(on crate38 crate50)
		(on crate39 pallet14)
		(on crate40 pallet18)
		(on crate41 crate17)
		(on crate42 pallet11)
		(on crate43 pallet13)
		(on crate44 crate21)
		(on crate45 crate14)
		(on crate46 pallet21)
		(on crate48 pallet20)
		(on crate50 pallet12)
		(on crate51 crate39)
		(on crate52 pallet23)
		(on crate53 pallet9)
		(on crate54 crate37)
		(on crate55 pallet28)
		(on crate56 pallet17)
		(on crate57 crate32)
		(on crate58 crate48)
	)
)

;(:metric minimize (total-time))
)
