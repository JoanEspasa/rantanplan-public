(define (problem DLOG_5_5_10)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
	driver3 - driver
	driver4 - driver
	driver5 - driver
	truck1 - truck
	truck2 - truck
	truck3 - truck
	truck4 - truck
	truck5 - truck
	package1 - obj
	package2 - obj
	package3 - obj
	package4 - obj
	package5 - obj
	package6 - obj
	package7 - obj
	package8 - obj
	package9 - obj
	package10 - obj
	s0 - location
	s1 - location
	s2 - location
	s3 - location
	s4 - location
	s5 - location
	s6 - location
	s7 - location
	s8 - location
	s9 - location
	s10 - location
	s11 - location
	s12 - location
	s13 - location
	s14 - location
	p0_1 - location
	p0_4 - location
	p1_2 - location
	p1_5 - location
	p2_3 - location
	p2_6 - location
	p3_7 - location
	p3_10 - location
	p3_11 - location
	p4_0 - location
	p4_6 - location
	p5_14 - location
	p7_9 - location
	p7_13 - location
	p8_12 - location
	p9_0 - location
	p9_4 - location
	p9_6 - location
	p9_8 - location
	p10_0 - location
	p12_4 - location
	p12_14 - location
	p13_1 - location
	p13_9 - location
	p13_14 - location
	p14_0 - location
	p14_8 - location
	p14_9 - location
	)
	(:init
	(at_ driver1 s14)
	(at_ driver2 s1)
	(at_ driver3 s0)
	(at_ driver4 s10)
	(at_ driver5 s12)
	(at_ truck1 s7)
	(empty truck1)
	(at_ truck2 s1)
	(empty truck2)
	(at_ truck3 s2)
	(empty truck3)
	(at_ truck4 s13)
	(empty truck4)
	(at_ truck5 s3)
	(empty truck5)
	(at_ package1 s0)
	(at_ package2 s14)
	(at_ package3 s4)
	(at_ package4 s3)
	(at_ package5 s11)
	(at_ package6 s7)
	(at_ package7 s12)
	(at_ package8 s8)
	(at_ package9 s2)
	(at_ package10 s7)
	(path s0 p0_1)
	(path p0_1 s0)
	(path s1 p0_1)
	(path p0_1 s1)
	(= (time_to_walk s0 p0_1) 17)
	(= (time_to_walk p0_1 s0) 17)
	(= (time_to_walk s1 p0_1) 57)
	(= (time_to_walk p0_1 s1) 57)
	(path s0 p0_4)
	(path p0_4 s0)
	(path s4 p0_4)
	(path p0_4 s4)
	(= (time_to_walk s0 p0_4) 63)
	(= (time_to_walk p0_4 s0) 63)
	(= (time_to_walk s4 p0_4) 67)
	(= (time_to_walk p0_4 s4) 67)
	(path s1 p1_2)
	(path p1_2 s1)
	(path s2 p1_2)
	(path p1_2 s2)
	(= (time_to_walk s1 p1_2) 56)
	(= (time_to_walk p1_2 s1) 56)
	(= (time_to_walk s2 p1_2) 66)
	(= (time_to_walk p1_2 s2) 66)
	(path s1 p1_5)
	(path p1_5 s1)
	(path s5 p1_5)
	(path p1_5 s5)
	(= (time_to_walk s1 p1_5) 95)
	(= (time_to_walk p1_5 s1) 95)
	(= (time_to_walk s5 p1_5) 89)
	(= (time_to_walk p1_5 s5) 89)
	(path s2 p2_3)
	(path p2_3 s2)
	(path s3 p2_3)
	(path p2_3 s3)
	(= (time_to_walk s2 p2_3) 75)
	(= (time_to_walk p2_3 s2) 75)
	(= (time_to_walk s3 p2_3) 99)
	(= (time_to_walk p2_3 s3) 99)
	(path s2 p2_6)
	(path p2_6 s2)
	(path s6 p2_6)
	(path p2_6 s6)
	(= (time_to_walk s2 p2_6) 11)
	(= (time_to_walk p2_6 s2) 11)
	(= (time_to_walk s6 p2_6) 54)
	(= (time_to_walk p2_6 s6) 54)
	(path s3 p3_7)
	(path p3_7 s3)
	(path s7 p3_7)
	(path p3_7 s7)
	(= (time_to_walk s3 p3_7) 84)
	(= (time_to_walk p3_7 s3) 84)
	(= (time_to_walk s7 p3_7) 90)
	(= (time_to_walk p3_7 s7) 90)
	(path s3 p3_10)
	(path p3_10 s3)
	(path s10 p3_10)
	(path p3_10 s10)
	(= (time_to_walk s3 p3_10) 21)
	(= (time_to_walk p3_10 s3) 21)
	(= (time_to_walk s10 p3_10) 43)
	(= (time_to_walk p3_10 s10) 43)
	(path s3 p3_11)
	(path p3_11 s3)
	(path s11 p3_11)
	(path p3_11 s11)
	(= (time_to_walk s3 p3_11) 42)
	(= (time_to_walk p3_11 s3) 42)
	(= (time_to_walk s11 p3_11) 38)
	(= (time_to_walk p3_11 s11) 38)
	(path s4 p4_6)
	(path p4_6 s4)
	(path s6 p4_6)
	(path p4_6 s6)
	(= (time_to_walk s4 p4_6) 36)
	(= (time_to_walk p4_6 s4) 36)
	(= (time_to_walk s6 p4_6) 27)
	(= (time_to_walk p4_6 s6) 27)
	(path s5 p5_14)
	(path p5_14 s5)
	(path s14 p5_14)
	(path p5_14 s14)
	(= (time_to_walk s5 p5_14) 63)
	(= (time_to_walk p5_14 s5) 63)
	(= (time_to_walk s14 p5_14) 70)
	(= (time_to_walk p5_14 s14) 70)
	(path s7 p7_9)
	(path p7_9 s7)
	(path s9 p7_9)
	(path p7_9 s9)
	(= (time_to_walk s7 p7_9) 86)
	(= (time_to_walk p7_9 s7) 86)
	(= (time_to_walk s9 p7_9) 5)
	(= (time_to_walk p7_9 s9) 5)
	(path s7 p7_13)
	(path p7_13 s7)
	(path s13 p7_13)
	(path p7_13 s13)
	(= (time_to_walk s7 p7_13) 63)
	(= (time_to_walk p7_13 s7) 63)
	(= (time_to_walk s13 p7_13) 2)
	(= (time_to_walk p7_13 s13) 2)
	(path s8 p8_12)
	(path p8_12 s8)
	(path s12 p8_12)
	(path p8_12 s12)
	(= (time_to_walk s8 p8_12) 35)
	(= (time_to_walk p8_12 s8) 35)
	(= (time_to_walk s12 p8_12) 36)
	(= (time_to_walk p8_12 s12) 36)
	(path s9 p9_0)
	(path p9_0 s9)
	(path s0 p9_0)
	(path p9_0 s0)
	(= (time_to_walk s9 p9_0) 55)
	(= (time_to_walk p9_0 s9) 55)
	(= (time_to_walk s0 p9_0) 89)
	(= (time_to_walk p9_0 s0) 89)
	(path s9 p9_4)
	(path p9_4 s9)
	(path s4 p9_4)
	(path p9_4 s4)
	(= (time_to_walk s9 p9_4) 5)
	(= (time_to_walk p9_4 s9) 5)
	(= (time_to_walk s4 p9_4) 72)
	(= (time_to_walk p9_4 s4) 72)
	(path s9 p9_6)
	(path p9_6 s9)
	(path s6 p9_6)
	(path p9_6 s6)
	(= (time_to_walk s9 p9_6) 45)
	(= (time_to_walk p9_6 s9) 45)
	(= (time_to_walk s6 p9_6) 68)
	(= (time_to_walk p9_6 s6) 68)
	(path s9 p9_8)
	(path p9_8 s9)
	(path s8 p9_8)
	(path p9_8 s8)
	(= (time_to_walk s9 p9_8) 38)
	(= (time_to_walk p9_8 s9) 38)
	(= (time_to_walk s8 p9_8) 1)
	(= (time_to_walk p9_8 s8) 1)
	(path s10 p10_0)
	(path p10_0 s10)
	(path s0 p10_0)
	(path p10_0 s0)
	(= (time_to_walk s10 p10_0) 33)
	(= (time_to_walk p10_0 s10) 33)
	(= (time_to_walk s0 p10_0) 32)
	(= (time_to_walk p10_0 s0) 32)
	(path s12 p12_4)
	(path p12_4 s12)
	(path s4 p12_4)
	(path p12_4 s4)
	(= (time_to_walk s12 p12_4) 90)
	(= (time_to_walk p12_4 s12) 90)
	(= (time_to_walk s4 p12_4) 8)
	(= (time_to_walk p12_4 s4) 8)
	(path s12 p12_14)
	(path p12_14 s12)
	(path s14 p12_14)
	(path p12_14 s14)
	(= (time_to_walk s12 p12_14) 31)
	(= (time_to_walk p12_14 s12) 31)
	(= (time_to_walk s14 p12_14) 1)
	(= (time_to_walk p12_14 s14) 1)
	(path s13 p13_1)
	(path p13_1 s13)
	(path s1 p13_1)
	(path p13_1 s1)
	(= (time_to_walk s13 p13_1) 61)
	(= (time_to_walk p13_1 s13) 61)
	(= (time_to_walk s1 p13_1) 15)
	(= (time_to_walk p13_1 s1) 15)
	(path s13 p13_9)
	(path p13_9 s13)
	(path s9 p13_9)
	(path p13_9 s9)
	(= (time_to_walk s13 p13_9) 90)
	(= (time_to_walk p13_9 s13) 90)
	(= (time_to_walk s9 p13_9) 82)
	(= (time_to_walk p13_9 s9) 82)
	(path s13 p13_14)
	(path p13_14 s13)
	(path s14 p13_14)
	(path p13_14 s14)
	(= (time_to_walk s13 p13_14) 57)
	(= (time_to_walk p13_14 s13) 57)
	(= (time_to_walk s14 p13_14) 31)
	(= (time_to_walk p13_14 s14) 31)
	(path s14 p14_0)
	(path p14_0 s14)
	(path s0 p14_0)
	(path p14_0 s0)
	(= (time_to_walk s14 p14_0) 19)
	(= (time_to_walk p14_0 s14) 19)
	(= (time_to_walk s0 p14_0) 93)
	(= (time_to_walk p14_0 s0) 93)
	(path s14 p14_8)
	(path p14_8 s14)
	(path s8 p14_8)
	(path p14_8 s8)
	(= (time_to_walk s14 p14_8) 58)
	(= (time_to_walk p14_8 s14) 58)
	(= (time_to_walk s8 p14_8) 82)
	(= (time_to_walk p14_8 s8) 82)
	(path s14 p14_9)
	(path p14_9 s14)
	(path s9 p14_9)
	(path p14_9 s9)
	(= (time_to_walk s14 p14_9) 63)
	(= (time_to_walk p14_9 s14) 63)
	(= (time_to_walk s9 p14_9) 43)
	(= (time_to_walk p14_9 s9) 43)
	(link s0 s1)
	(link s1 s0)
	(= (time_to_drive s0 s1) 86)
	(= (time_to_drive s1 s0) 86)
	(link s0 s11)
	(link s11 s0)
	(= (time_to_drive s0 s11) 25)
	(= (time_to_drive s11 s0) 25)
	(link s0 s13)
	(link s13 s0)
	(= (time_to_drive s0 s13) 45)
	(= (time_to_drive s13 s0) 45)
	(link s0 s14)
	(link s14 s0)
	(= (time_to_drive s0 s14) 20)
	(= (time_to_drive s14 s0) 20)
	(link s1 s2)
	(link s2 s1)
	(= (time_to_drive s1 s2) 61)
	(= (time_to_drive s2 s1) 61)
	(link s1 s8)
	(link s8 s1)
	(= (time_to_drive s1 s8) 99)
	(= (time_to_drive s8 s1) 99)
	(link s1 s10)
	(link s10 s1)
	(= (time_to_drive s1 s10) 9)
	(= (time_to_drive s10 s1) 9)
	(link s1 s13)
	(link s13 s1)
	(= (time_to_drive s1 s13) 66)
	(= (time_to_drive s13 s1) 66)
	(link s2 s11)
	(link s11 s2)
	(= (time_to_drive s2 s11) 70)
	(= (time_to_drive s11 s2) 70)
	(link s3 s0)
	(link s0 s3)
	(= (time_to_drive s3 s0) 54)
	(= (time_to_drive s0 s3) 54)
	(link s3 s1)
	(link s1 s3)
	(= (time_to_drive s3 s1) 33)
	(= (time_to_drive s1 s3) 33)
	(link s3 s10)
	(link s10 s3)
	(= (time_to_drive s3 s10) 8)
	(= (time_to_drive s10 s3) 8)
	(link s3 s11)
	(link s11 s3)
	(= (time_to_drive s3 s11) 55)
	(= (time_to_drive s11 s3) 55)
	(link s3 s12)
	(link s12 s3)
	(= (time_to_drive s3 s12) 66)
	(= (time_to_drive s12 s3) 66)
	(link s5 s0)
	(link s0 s5)
	(= (time_to_drive s5 s0) 39)
	(= (time_to_drive s0 s5) 39)
	(link s5 s2)
	(link s2 s5)
	(= (time_to_drive s5 s2) 44)
	(= (time_to_drive s2 s5) 44)
	(link s5 s3)
	(link s3 s5)
	(= (time_to_drive s5 s3) 73)
	(= (time_to_drive s3 s5) 73)
	(link s5 s7)
	(link s7 s5)
	(= (time_to_drive s5 s7) 69)
	(= (time_to_drive s7 s5) 69)
	(link s6 s0)
	(link s0 s6)
	(= (time_to_drive s6 s0) 45)
	(= (time_to_drive s0 s6) 45)
	(link s6 s1)
	(link s1 s6)
	(= (time_to_drive s6 s1) 34)
	(= (time_to_drive s1 s6) 34)
	(link s6 s5)
	(link s5 s6)
	(= (time_to_drive s6 s5) 83)
	(= (time_to_drive s5 s6) 83)
	(link s6 s7)
	(link s7 s6)
	(= (time_to_drive s6 s7) 34)
	(= (time_to_drive s7 s6) 34)
	(link s6 s8)
	(link s8 s6)
	(= (time_to_drive s6 s8) 15)
	(= (time_to_drive s8 s6) 15)
	(link s7 s2)
	(link s2 s7)
	(= (time_to_drive s7 s2) 40)
	(= (time_to_drive s2 s7) 40)
	(link s7 s4)
	(link s4 s7)
	(= (time_to_drive s7 s4) 65)
	(= (time_to_drive s4 s7) 65)
	(link s7 s9)
	(link s9 s7)
	(= (time_to_drive s7 s9) 33)
	(= (time_to_drive s9 s7) 33)
	(link s7 s10)
	(link s10 s7)
	(= (time_to_drive s7 s10) 33)
	(= (time_to_drive s10 s7) 33)
	(link s7 s11)
	(link s11 s7)
	(= (time_to_drive s7 s11) 23)
	(= (time_to_drive s11 s7) 23)
	(link s8 s0)
	(link s0 s8)
	(= (time_to_drive s8 s0) 14)
	(= (time_to_drive s0 s8) 14)
	(link s8 s3)
	(link s3 s8)
	(= (time_to_drive s8 s3) 95)
	(= (time_to_drive s3 s8) 95)
	(link s10 s0)
	(link s0 s10)
	(= (time_to_drive s10 s0) 66)
	(= (time_to_drive s0 s10) 66)
	(link s10 s2)
	(link s2 s10)
	(= (time_to_drive s10 s2) 100)
	(= (time_to_drive s2 s10) 100)
	(link s10 s4)
	(link s4 s10)
	(= (time_to_drive s10 s4) 20)
	(= (time_to_drive s4 s10) 20)
	(link s10 s5)
	(link s5 s10)
	(= (time_to_drive s10 s5) 10)
	(= (time_to_drive s5 s10) 10)
	(link s10 s6)
	(link s6 s10)
	(= (time_to_drive s10 s6) 19)
	(= (time_to_drive s6 s10) 19)
	(link s12 s0)
	(link s0 s12)
	(= (time_to_drive s12 s0) 80)
	(= (time_to_drive s0 s12) 80)
	(link s12 s5)
	(link s5 s12)
	(= (time_to_drive s12 s5) 9)
	(= (time_to_drive s5 s12) 9)
	(link s12 s6)
	(link s6 s12)
	(= (time_to_drive s12 s6) 28)
	(= (time_to_drive s6 s12) 28)
	(link s12 s10)
	(link s10 s12)
	(= (time_to_drive s12 s10) 45)
	(= (time_to_drive s10 s12) 45)
	(link s13 s2)
	(link s2 s13)
	(= (time_to_drive s13 s2) 79)
	(= (time_to_drive s2 s13) 79)
	(link s13 s7)
	(link s7 s13)
	(= (time_to_drive s13 s7) 81)
	(= (time_to_drive s7 s13) 81)
	(link s13 s10)
	(link s10 s13)
	(= (time_to_drive s13 s10) 77)
	(= (time_to_drive s10 s13) 77)
	(link s13 s11)
	(link s11 s13)
	(= (time_to_drive s13 s11) 86)
	(= (time_to_drive s11 s13) 86)
	(link s14 s6)
	(link s6 s14)
	(= (time_to_drive s14 s6) 35)
	(= (time_to_drive s6 s14) 35)
	(link s14 s12)
	(link s12 s14)
	(= (time_to_drive s14 s12) 42)
	(= (time_to_drive s12 s14) 42)
	(= (driven) 0)
	(= (walked) 0)
)
	(:goal (and
	(at_ driver1 s12)
	(at_ driver2 s11)
	(at_ driver3 s11)
	(at_ driver4 s12)
	(at_ driver5 s11)
	(at_ truck1 s5)
	(at_ truck2 s6)
	(at_ truck3 s8)
	(at_ truck4 s12)
	(at_ truck5 s14)
	(at_ package1 s13)
	(at_ package2 s0)
	(at_ package4 s11)
	(at_ package5 s9)
	(at_ package6 s2)
	(at_ package7 s3)
	(at_ package8 s6)
	(at_ package9 s4)
	(at_ package10 s8)
	))

;(:metric minimize (+ (+ (* 1  (total_time)) (* 4  (driven))) (* 1  (walked))))

)
