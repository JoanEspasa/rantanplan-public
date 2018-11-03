(define (problem DLOG-23-6)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
	truck1 - truck
	truck2 - truck
	truck3 - truck
	package1 - obj
	package2 - obj
	package3 - obj
	package4 - obj
	package5 - obj
	package6 - obj
	s0 - location
	s1 - location
	s2 - location
	s3 - location
	s4 - location
	s5 - location
	s6 - location
	p03 - location
	p10 - location
	p15 - location
	p23 - location
	p26 - location
	p34 - location
	p40 - location
	p41 - location
	p42 - location
	p50 - location
	p63 - location
	)
	(:init
     (= (driving driver1) undefined)
     (= (driving driver2) undefined)
    (= (in package1) undefined)
    (= (in package2) undefined)
    (= (in package3) undefined)
    (= (in package4) undefined)
    (= (in package5) undefined)
    (= (in package6) undefined)
	(= (at driver1) s6)
	(= (at driver2) s0)
	(= (at truck1) s0)
	(empty truck1)
	(= (at truck2) s2)
	(empty truck2)
	(= (at truck3) s2)
	(empty truck3)
	(= (at package1) s6)
	(= (at package2) s2)
	(= (at package3) s3)
	(= (at package4) s0)
	(= (at package5) s5)
	(= (at package6) s5)
	(path s0 p03)
	(path p03 s0)
	(path s3 p03)
	(path p03 s3)
	(= (time_to_walk s0 p03) 80)
	(= (time_to_walk p03 s0) 80)
	(= (time_to_walk s3 p03) 9)
	(= (time_to_walk p03 s3) 9)
	(path s1 p10)
	(path p10 s1)
	(path s0 p10)
	(path p10 s0)
	(= (time_to_walk s1 p10) 69)
	(= (time_to_walk p10 s1) 69)
	(= (time_to_walk s0 p10) 58)
	(= (time_to_walk p10 s0) 58)
	(path s1 p15)
	(path p15 s1)
	(path s5 p15)
	(path p15 s5)
	(= (time_to_walk s1 p15) 16)
	(= (time_to_walk p15 s1) 16)
	(= (time_to_walk s5 p15) 40)
	(= (time_to_walk p15 s5) 40)
	(path s2 p23)
	(path p23 s2)
	(path s3 p23)
	(path p23 s3)
	(= (time_to_walk s2 p23) 84)
	(= (time_to_walk p23 s2) 84)
	(= (time_to_walk s3 p23) 56)
	(= (time_to_walk p23 s3) 56)
	(path s2 p26)
	(path p26 s2)
	(path s6 p26)
	(path p26 s6)
	(= (time_to_walk s2 p26) 9)
	(= (time_to_walk p26 s2) 9)
	(= (time_to_walk s6 p26) 37)
	(= (time_to_walk p26 s6) 37)
	(path s3 p34)
	(path p34 s3)
	(path s4 p34)
	(path p34 s4)
	(= (time_to_walk s3 p34) 95)
	(= (time_to_walk p34 s3) 95)
	(= (time_to_walk s4 p34) 85)
	(= (time_to_walk p34 s4) 85)
	(path s4 p40)
	(path p40 s4)
	(path s0 p40)
	(path p40 s0)
	(= (time_to_walk s4 p40) 65)
	(= (time_to_walk p40 s4) 65)
	(= (time_to_walk s0 p40) 88)
	(= (time_to_walk p40 s0) 88)
	(path s4 p41)
	(path p41 s4)
	(path s1 p41)
	(path p41 s1)
	(= (time_to_walk s4 p41) 85)
	(= (time_to_walk p41 s4) 85)
	(= (time_to_walk s1 p41) 23)
	(= (time_to_walk p41 s1) 23)
	(path s4 p42)
	(path p42 s4)
	(path s2 p42)
	(path p42 s2)
	(= (time_to_walk s4 p42) 26)
	(= (time_to_walk p42 s4) 26)
	(= (time_to_walk s2 p42) 37)
	(= (time_to_walk p42 s2) 37)
	(path s5 p50)
	(path p50 s5)
	(path s0 p50)
	(path p50 s0)
	(= (time_to_walk s5 p50) 41)
	(= (time_to_walk p50 s5) 41)
	(= (time_to_walk s0 p50) 71)
	(= (time_to_walk p50 s0) 71)
	(path s6 p63)
	(path p63 s6)
	(path s3 p63)
	(path p63 s3)
	(= (time_to_walk s6 p63) 8)
	(= (time_to_walk p63 s6) 8)
	(= (time_to_walk s3 p63) 19)
	(= (time_to_walk p63 s3) 19)
	(link s0 s2)
	(link s2 s0)
	(= (time_to_drive s0 s2) 80)
	(= (time_to_drive s2 s0) 80)
	(link s0 s5)
	(link s5 s0)
	(= (time_to_drive s0 s5) 3)
	(= (time_to_drive s5 s0) 3)
	(link s1 s0)
	(link s0 s1)
	(= (time_to_drive s1 s0) 83)
	(= (time_to_drive s0 s1) 83)
	(link s1 s3)
	(link s3 s1)
	(= (time_to_drive s1 s3) 62)
	(= (time_to_drive s3 s1) 62)
	(link s1 s4)
	(link s4 s1)
	(= (time_to_drive s1 s4) 20)
	(= (time_to_drive s4 s1) 20)
	(link s1 s6)
	(link s6 s1)
	(= (time_to_drive s1 s6) 82)
	(= (time_to_drive s6 s1) 82)
	(link s2 s1)
	(link s1 s2)
	(= (time_to_drive s2 s1) 37)
	(= (time_to_drive s1 s2) 37)
	(link s2 s4)
	(link s4 s2)
	(= (time_to_drive s2 s4) 27)
	(= (time_to_drive s4 s2) 27)
	(link s3 s6)
	(link s6 s3)
	(= (time_to_drive s3 s6) 87)
	(= (time_to_drive s6 s3) 87)
	(link s4 s0)
	(link s0 s4)
	(= (time_to_drive s4 s0) 17)
	(= (time_to_drive s0 s4) 17)
	(link s5 s1)
	(link s1 s5)
	(= (time_to_drive s5 s1) 35)
	(= (time_to_drive s1 s5) 35)
	(link s5 s2)
	(link s2 s5)
	(= (time_to_drive s5 s2) 56)
	(= (time_to_drive s2 s5) 56)
	(link s6 s0)
	(link s0 s6)
	(= (time_to_drive s6 s0) 74)
	(= (time_to_drive s0 s6) 74)
	(link s6 s2)
	(link s2 s6)
	(= (time_to_drive s6 s2) 51)
	(= (time_to_drive s2 s6) 51)
	(link s6 s4)
	(link s4 s6)
	(= (time_to_drive s6 s4) 96)
	(= (time_to_drive s4 s6) 96)
	(link s6 s5)
	(link s5 s6)
	(= (time_to_drive s6 s5) 58)
	(= (time_to_drive s5 s6) 58)
)
	(:goal (and
	(= (at driver2) s4)
	(= (at truck2) s4)
	(= (at package1) s6)
	(= (at package2) s3)
	(= (at package3) s4)
	(= (at package4) s6)
	(= (at package5) s1)
	))

;(:metric minimize (+ (+ (* 4  (total-time)) (* 1  (driven))) (* 1  (walked))))

)