(define (problem DLOG-22-4)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
	truck1 - truck
	truck2 - truck
	package1 - obj
	package2 - obj
	package3 - obj
	package4 - obj
	s0 - location
	s1 - location
	s2 - location
	p01 - location
	p20 - location
	p21 - location
	)
	(:init
     (= (driving driver1) undefined)
     (= (driving driver2) undefined)
    (= (in package1) undefined)
    (= (in package2) undefined)
    (= (in package3) undefined)
    (= (in package4) undefined)
	(= (at driver1) s1)
	(= (at driver2) s0)
	(= (at truck1) s1)
	(empty truck1)
	(= (at truck2) s2)
	(empty truck2)
	(= (at package1) s0)
	(= (at package2) s0)
	(= (at package3) s1)
	(= (at package4) s1)
	(path s0 p01)
	(path p01 s0)
	(path s1 p01)
	(path p01 s1)
	(= (time_to_walk s0 p01) 50)
	(= (time_to_walk p01 s0) 50)
	(= (time_to_walk s1 p01) 92)
	(= (time_to_walk p01 s1) 92)
	(path s2 p20)
	(path p20 s2)
	(path s0 p20)
	(path p20 s0)
	(= (time_to_walk s2 p20) 73)
	(= (time_to_walk p20 s2) 73)
	(= (time_to_walk s0 p20) 100)
	(= (time_to_walk p20 s0) 100)
	(path s2 p21)
	(path p21 s2)
	(path s1 p21)
	(path p21 s1)
	(= (time_to_walk s2 p21) 8)
	(= (time_to_walk p21 s2) 8)
	(= (time_to_walk s1 p21) 71)
	(= (time_to_walk p21 s1) 71)
	(link s1 s0)
	(link s0 s1)
	(= (time_to_drive s1 s0) 42)
	(= (time_to_drive s0 s1) 42)
	(link s1 s2)
	(link s2 s1)
	(= (time_to_drive s1 s2) 55)
	(= (time_to_drive s2 s1) 55)
	(link s2 s0)
	(link s0 s2)
	(= (time_to_drive s2 s0) 23)
	(= (time_to_drive s0 s2) 23)
)
	(:goal (and
	(= (at driver2) s2)
	(= (at truck1) s1)
	(= (at truck2) s2)
	(= (at package1) s1)
	(= (at package2) s1)
	(= (at package3) s2)
	))

;(:metric minimize (+ (+ (* 4  (total-time)) (* 3  (driven))) (* 3  (walked))))

)
